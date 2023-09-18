import 'dart:async';
import 'package:sla_common/.env.dart';
import 'package:sla_logger/sla_logger.dart';
import 'package:sla_common/enums/enums.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart' as permission;

class LocationUtils {
  /// singleton class
  LocationUtils._internal() {
    checkPermissionStatus();
  }

  factory LocationUtils() => _singleton;
  static final _singleton = LocationUtils._internal();

  static final _log = AppLog(LocationUtils);

  /// check location status  periodically
  static final _periodicCheckSubscription = Stream.periodic(LOCATION_CHECK_INTERVAL).listen((_) {
    if (locationState.hasListener) {
      checkPermissionStatus();
    }
  });

  /// location state stream
  /// subscribe to this stream
  /// to get location state update
  static final locationState = StreamController<LocationState>.broadcast(
    onListen: () => _checkPermissionPeriodically(),
    onCancel: () => _pausePeriodicCheckSubscription(),
  );

  /// location instance
  final _location = location.Location();

  static void _pausePeriodicCheckSubscription() {
    const tag = "_pausePeriodicCheckSubscription";
    try {
      _periodicCheckSubscription.pause();
      _log.d(tag, "paused");
    } catch (e) {
      _log.e(tag, "pause failed", e);
    }
  }

  /// update permission status periodically
  static void _checkPermissionPeriodically() {
    const tag = "_checkPermissionPeriodically";
    try {
      if (_periodicCheckSubscription.isPaused) {
        _periodicCheckSubscription.resume();
        _log.d(tag, "resumed");
      }
    } catch (e) {
      _log.e(tag, "resume failed", e);
    }
  }

  /// check permission status
  /// and update the location state
  static Future checkPermissionStatus() async {
    const tag = "checkPermissionStatus";
    try {
      await permission.Permission.locationWhenInUse.status.then((locationPermission) {
        switch (locationPermission) {
          case permission.PermissionStatus.granted:
            permission.Permission.locationWhenInUse.serviceStatus.then((serviceStatus) {
              if (serviceStatus == permission.ServiceStatus.enabled) {
                locationState.add(LocationState.permissionGrantedServiceOn);
              } else {
                locationState.add(LocationState.permissionGrantedServiceOff);
              }
            });
            break;
          case permission.PermissionStatus.denied:
            locationState.add(LocationState.noPermission);
            break;
          case permission.PermissionStatus.permanentlyDenied:
            locationState.add(LocationState.permissionDeniedForever);
            break;
          default:
            locationState.add(LocationState.noPermission);
            break;
        }
      });
    } catch (e) {
      _log.e(tag, "checkPermissionStatus failed", e);
    }
  }

  /// request location permission
  /// and update the location state
  Future requestPermission() async {
    const tag = "requestPermission";
    try {
      await permission.Permission.locationWhenInUse.request().then((permissionStatus) {
        _log.n(tag, "requestPermission result: ${permissionStatus.name}");
        switch (permissionStatus) {
          case permission.PermissionStatus.granted:
            permission.Permission.locationWhenInUse.serviceStatus.then((serviceStatus) {
              if (serviceStatus == permission.ServiceStatus.enabled) {
                locationState.add(LocationState.permissionGrantedServiceOn);
              } else {
                locationState.add(LocationState.permissionGrantedServiceOff);
              }
            });
            break;
          case permission.PermissionStatus.denied:
            locationState.add(LocationState.noPermission);
            break;
          case permission.PermissionStatus.permanentlyDenied:
            locationState.add(LocationState.permissionDeniedForever);
            break;
          default:
            locationState.add(LocationState.noPermission);
            break;
        }
      });
    } catch (e) {
      _log.e(tag, "requestPermission failed", e);
    }
  }

  /// go to app permission settings
  Future openLocationSettings() async {
    const tag = "openLocationSettings";
    try {
      await permission.openAppSettings();
      _log.n(tag, "permission settings opened");
    } catch (e) {
      _log.e(tag, "openLocationSettings failed", e);
    }
  }

  /// request location service to be available
  Future<bool> requestLocationService() async {
    const tag = "requestLocationService";
    try {
      final value = await _location.requestService();
      await checkPermissionStatus();
      return Future.value(value);
    } catch (e) {
      _log.e(tag, "requestLocationService failed", e);
      return Future.value(false);
    }
  }

  Future<location.LocationData?> getLocation() async {
    const tag = "getLocation";
    location.LocationData? locationData;
    try {
      locationData = await location.Location().getLocation();
    } catch (e) {
      _log.e(tag, "get location failed", e);
    }
    return Future.value(locationData);
  }
}
