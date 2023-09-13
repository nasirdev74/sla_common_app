import 'dart:async';
import 'package:sla_common/utils/utils.dart';
import 'package:sla_logger/sla_logger.dart';
import 'package:sla_common/enums/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  /// singleton class
  NetworkUtils._internal() {
    _startNetworkStatusStream();
  }

  factory NetworkUtils() => _singleton;
  static final _singleton = NetworkUtils._internal();

  static final _log = AppLog(NetworkUtils);

  /// connectivity subscription stream
  /// listen to this stream
  /// to get connectivity state update
  static final _connectivitySubscription = Connectivity().onConnectivityChanged.listen((status) {
    const tag = "_connectivitySubscription";
    try {
      _log.n(tag, "connectivity status changed detected: ${status.name}");
      if (status == ConnectivityResult.none || status == ConnectivityResult.bluetooth) {
        networkStatus.add(NetworkStatus.unavailable);
      } else {
        networkStatus.add(NetworkStatus.available);
      }
    } catch (e) {
      _log.e(tag, "Connectivity().onConnectivityChanged.listen failed", e);
    }
  });

  static final networkStatus = StreamController<NetworkStatus>.broadcast(
    onListen: () => _startNetworkStatusStream(),
    onCancel: () => _stopNetworkStatusStream(),
  );

  /// start connectivity subscription stream
  static _startNetworkStatusStream() {
    const tag = "_startNetworkStatusStream";
    try {
      if (_connectivitySubscription.isPaused) {
        _connectivitySubscription.resume();
        _log.n(tag, "networkStatus stream started");
      }
    } catch (e) {
      _log.e(tag, "_startNetworkStatusStream failed", e);
    }
  }

  /// stop connectivity subscription stream
  static _stopNetworkStatusStream() {
    const tag = "_stopNetworkStatusStream";
    try {
      _connectivitySubscription.pause();
      _log.n(tag, "networkStatus stream stopped");
    } catch (e) {
      _log.e(tag, "_stopNetworkStatusStream failed", e);
    }
  }

  /// check internet connection if available
  Future<bool> checkInternet({showError = true}) async {
    const tag = "checkInternet";
    try {
      final status = await Connectivity().checkConnectivity();
      _log.d(tag, "network status: $status");
      if (status == ConnectivityResult.none || status == ConnectivityResult.bluetooth) {
        if (showError) AppFeedback.showShortError("No Internet");
        return Future.value(false);
      }
      return Future.value(true);
    } catch (e) {
      _log.e(tag, "checkInternet failed", e);
      return Future.value(false);
    }
  }
}
