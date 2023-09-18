import 'dart:async';
import 'package:sla_common/enums/enums.dart';
import 'package:sla_logger/sla_logger.dart';
import 'package:wifi_scan/wifi_scan.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WifiUtils {
  /// singleton class
  WifiUtils._internal();

  factory WifiUtils() => _singleton;
  static final _singleton = WifiUtils._internal();

  static final _log = AppLog(WifiUtils);

  /// wifi state stream
  /// listen to this stream
  /// to get wifi state update
  static final wifiState = StreamController<WifiState>.broadcast(
    /// listen for connectivity changes on listen
    onListen: () => _listenToConnectivityChanges(),
    onCancel: () => _log.n("onCancel", "wifi state listening cancelled"),
  );

  /// wifi list stream
  /// subscribe to this stream
  /// to get update for wifi list around the device
  static final wifiList = StreamController<List<WiFiAccessPoint>>.broadcast(
    /// start scanning on listen
    onListen: () async => await _startScan(),
    onCancel: () => _log.n("onCancel", "wifi list listening cancelled"),
  );

  /// check if wifi is on or off
  Future<bool> isWifiOn() async {
    const tag = "isWifiOn";
    try {
      final result = await Connectivity().checkConnectivity();
      return Future.value(result == ConnectivityResult.wifi);
    } catch (e) {
      _log.e(tag, "checking if wifi on failed", e);
      return Future.value(false);
    }
  }

  /// listen to connectivity changes
  /// private to this class
  static void _listenToConnectivityChanges() async {
    const tag = "_listenToConnectivityChanges";
    final connectivity = await Connectivity().checkConnectivity();
    switch (connectivity) {
      case ConnectivityResult.none:
        wifiState.add(WifiState.turnedOff);
        break;
      case ConnectivityResult.wifi:
        wifiState.add(WifiState.turnedOnConnected);
        break;
      default:
        wifiState.add(WifiState.turnedOnNoInternet);
        break;
    }
    Connectivity().onConnectivityChanged.listen((event) {
      try {
        _log.d(tag, "connectivity state changed: ${event.name}");
        switch (event) {
          case ConnectivityResult.none:
            wifiState.add(WifiState.turnedOff);
            break;
          case ConnectivityResult.wifi:
            wifiState.add(WifiState.turnedOnConnected);
            break;
          default:
            wifiState.add(WifiState.turnedOnNoInternet);
            break;
        }
      } catch (e) {
        _log.e(tag, "Connectivity().onConnectivityChanged.listen failed", e);
      }
    });
  }

  static refreshWifiList() async {
    const tag = "refreshWifiList";
    try {
      final list = await WiFiScan.instance.getScannedResults();
      wifiList.add(list);
      _log.d(tag, "refreshed: ${list.length}");
    } catch (e) {
      _log.e(tag, "refreshWifiList catch", e);
    }
  }

  /// scan wifi around the device
  /// private to this class
  static Future _startScan() async {
    const tag = "_startScan";
    try {
      final can = await WiFiScan.instance.canStartScan();
      if (can == CanStartScan.yes) {
        final started = await WiFiScan.instance.startScan();
        if (started) {
          _log.n(tag, "wifi scan started");
          try {
            WiFiScan.instance.onScannedResultsAvailable.listen((list) {
              wifiList.add(list);
            });
          } catch (e) {
            _log.e(tag, "WiFiScan.instance.onScannedResultsAvailable.listen failed", e);
          }
        } else {
          _log.w(tag, "wifi scan starting failed : $started");
        }
      } else {
        _log.w(tag, "can't scan wifi: $can");
      }
    } catch (e) {
      _log.e(tag, "start scan failed", e);
    }
  }
}
