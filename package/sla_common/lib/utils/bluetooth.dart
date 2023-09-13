import 'dart:async';
import 'package:sla_common/.env.dart';
import 'package:sla_logger/sla_logger.dart';
import 'package:sla_common/enums/enums.dart';
import 'package:sla_common/constants/constants.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

class BluetoothUtils {
  /// singleton class
  BluetoothUtils._internal();

  factory BluetoothUtils() => _singleton;
  static final _singleton = BluetoothUtils._internal();

  static final _log = AppLog(BluetoothUtils);

  /// bluetooth state stream
  /// listen to this stream
  /// to get bluetooth state update
  static final bluetoothState = StreamController<AppBluetoothState>.broadcast(
    onListen: () => _listenToBluetoothStateChanges(),
    onCancel: () => _log.w("onCancel", "bluetoothState listening cancelled"),
  );

  /// bluetooth device
  /// notification stream
  /// listen to this stream to get
  /// updated message from connected device
  static final deviceNotifications = StreamController<String>.broadcast();

  /// listen to bluetooth state changes
  /// and update the state
  /// private to this class
  static void _listenToBluetoothStateChanges() {
    const tag = "_listenToBluetoothStateChanges";
    FlutterBluePlus.instance.state.listen((event) {
      try {
        _log.d(tag, "bluetooth state updated: ${event.name}");
        switch (event) {
          case BluetoothState.unknown:
          case BluetoothState.unavailable:
            bluetoothState.add(AppBluetoothState.unavailable);
            break;
          case BluetoothState.unauthorized:
            bluetoothState.add(AppBluetoothState.unauthorized);
            break;
          case BluetoothState.turningOn:
          case BluetoothState.on:
            bluetoothState.add(AppBluetoothState.on);
            break;
          case BluetoothState.turningOff:
          case BluetoothState.off:
            bluetoothState.add(AppBluetoothState.off);
            break;
        }
      } catch (e) {
        _log.e(tag, "listen failed", e);
      }
    });
  }

  /// used to write data to bluetooth device
  static Future writeToDevice({
    required String data,
    required BluetoothDevice device,
  }) async {
    const tag = "writeToDevice";
    try {
      _log.n(tag, "device: ${device.name}, data: $data");

      var services = <BluetoothService>[];
      try {
        /// get all the bluetooth services
        services = await device.discoverServices();
      } catch (e) {
        _log.e(tag, "discover services failed", e);
      }

      if (services.isNotEmpty) {
        for (var service in services) {
          if (service.uuid.toString() == BLUETOOTH_SERVICE_UUID) {
            _log.n(tag, "service uuid matched");
            for (var characteristic in service.characteristics) {
              /// write character
              if (characteristic.uuid.toString() == BLUETOOTH_WRITE_UUID) {
                _log.n(tag, "write characteristic matched");
                try {
                  await characteristic.write(data.codeUnits);
                  _log.s(tag, "writing on device succeed");
                } catch (e) {
                  _log.e(tag, "writing to bluetooth device failed", e);
                }
              }
            }
          }
        }
      } else {
        _log.c(tag, "no service found: ${services.length}", services);
      }
    } catch (e) {
      _log.e(tag, "write to device failed", e);
      rethrow;
    }
  }

  /// connect to device and listen for notification
  static Future<void> connectToDeviceAndListenForNotification(BluetoothDevice device) async {
    const tag = "connectToDeviceAndListenForNotification";
    var connectedFlag = false;
    try {
      /// check if already connected
      try {
        await device.disconnect();
        await Future.delayed(milli500);
      } catch (e) {
        _log.e(tag, tryCatch, e);
      }

      /// connect to device
      await device.connect(timeout: CONNECT_TIMEOUT).then((_) {
        connectedFlag = true;
        _log.n(tag, "connected to device");
      });
    } catch (e) {
      _log.w(tag, "retrying...i", err: e);
      try {
        await device.connect(timeout: CONNECT_TIMEOUT).then((_) {
          connectedFlag = true;
          _log.n(tag, "connected to device...ii");
        });
      } catch (e) {
        _log.w(tag, "retrying...ii", err: e);
        try {
          await device.connect(timeout: CONNECT_TIMEOUT).then((_) {
            connectedFlag = true;
            _log.n(tag, "connected to device...iii");
          });
        } catch (e) {
          connectedFlag = false;
          _log.e(tag, "connect to device failed", e);
          rethrow;
        }
      }
    }

    if (connectedFlag) {
      _listenForBLENotification(device);
    }
  }

  static void _listenForBLENotification(BluetoothDevice device) async {
    const tag = "_listenForBLENotification";
    try {
      var services = <BluetoothService>[];
      try {
        /// get all the bluetooth services
        services = await device.discoverServices();
      } catch (e) {
        _log.e(tag, "discover services failed", e);
      }

      if (services.isNotEmpty) {
        for (var service in services) {
          if (service.uuid.toString() == BLUETOOTH_SERVICE_UUID) {
            _log.n(tag, "service uuid matched");
            for (var characteristic in service.characteristics) {
              /// notification character
              if (characteristic.uuid.toString() == BLUETOOTH_NOTIFICATION_UUID) {
                _log.n(tag, "notification characteristic matched");
                try {
                  /// set notify
                  try {
                    characteristic.setNotifyValue(true);
                  } catch (err) {
                    _log.e(tag, "characteristic.setNotifyValue(true) failed", err);
                  }

                  if (deviceNotifications.hasListener) {
                    characteristic.value.listen((e) {
                      final message = String.fromCharCodes(e);
                      if (message.isNotEmpty) {
                        _log.n(tag, "message received from BLE: $message");

                        /// notify listeners
                        deviceNotifications.add(message);
                      } else {
                        _log.w(tag, "empty notification message received: $message");
                      }
                    });
                  } else {
                    _log.w(tag, "no listener found");
                  }
                } catch (e) {
                  _log.e(tag, "notification receiving failed", e);
                }
              }
            }
          }
        }
      } else {
        _log.c(tag, "no service found: ${services.length}", services);
      }
    } catch (e) {
      _log.e(tag, "catch", e);
    }
  }

  static Future startScan() async {
    const tag = "startScan";
    try {
      await FlutterBluePlus.instance.startScan(timeout: SCAN_TIMEOUT);
      _log.n(tag, "bluetooth scan started.");
    } catch (e) {
      _log.w(tag, "retrying...i", err: e);
      try {
        await FlutterBluePlus.instance.stopScan();
        await Future.delayed(RETRY_DELAY, () async {
          await FlutterBluePlus.instance.startScan(timeout: SCAN_TIMEOUT);
          _log.n(tag, "bluetooth scan started...ii");
        });
      } catch (e) {
        _log.w(tag, "retrying...ii", err: e);
        try {
          await FlutterBluePlus.instance.stopScan();
          await Future.delayed(RETRY_DELAY, () async {
            await FlutterBluePlus.instance.startScan(timeout: SCAN_TIMEOUT);
            _log.n(tag, "bluetooth scan started...iii");
          });
        } catch (e) {
          _log.e(tag, "scan start failed", e);
        }
      }
    }
  }

  static Future stopScan() async {
    const tag = "stopScan";
    try {
      await FlutterBluePlus.instance.stopScan();
    } catch (e) {
      _log.e(tag, tryCatch, e);
    }
  }

  /// request bluetooth permission
  Future requestPermission() async {
    const tag = "requestPermission";
    try {
      final status = await permission.Permission.bluetooth.request();
      _log.n(tag, "request permission result: ${status.name}");
    } catch (e) {
      _log.e(tag, "request bluetooth permission failed", e);
    }
  }

  /// get connected devices
  Future<List<BluetoothDevice>> connectedDevices() async {
    const tag = "connectedDevices";
    try {
      final connectedDevices = await FlutterBluePlus.instance.connectedDevices;
      if (connectedDevices.isNotEmpty) {
        _log.n(tag, "connected devices: $connectedDevices");
      } else {
        _log.n(tag, "no bluetooth connected device found");
      }
      return Future.value(connectedDevices);
    } catch (e) {
      _log.e(tag, "getting connected devices failed", e);
      return Future.value([]);
    }
  }

  /// turn off bluetooth
  Future<bool> turnOffBluetooth() async {
    const tag = "turnOffBluetooth";
    try {
      final turnOff = await FlutterBluePlus.instance.turnOff();
      if (turnOff) {
        _log.s(tag, "bluetooth turned off succeed");
      } else {
        _log.w(tag, "bluetooth didn't turned off");
      }
      return Future.value(turnOff);
    } catch (e) {
      _log.e(tag, "turn off bluetooth failed", e);
      return Future.value(false);
    }
  }

  /// turn on bluetooth
  Future<bool> turnOnBluetooth() async {
    const tag = "turnOnBluetooth";
    try {
      final turnOn = await FlutterBluePlus.instance.turnOn();
      if (turnOn) {
        _log.s(tag, "bluetooth turned on succeed");
      } else {
        _log.c(tag, "bluetooth turn on from app failed", turnOn);
      }
      return Future.value(turnOn);
    } catch (e) {
      _log.e(tag, "turn on bluetooth failed", e);
      return Future.value(false);
    }
  }

  /// check if bluetooth is available or not
  Future<bool> isAvailable() async {
    const tag = "isAvailable";
    try {
      final isAvailable = await FlutterBluePlus.instance.isAvailable;
      if (isAvailable) {
        _log.n(tag, "bluetooth is available");
      } else {
        _log.c(tag, "bluetooth is not available", isAvailable);
      }
      return Future.value(isAvailable);
    } catch (e) {
      _log.e(tag, "checking if bluetooth available failed", e);
      return Future.value(false);
    }
  }

  /// get device bluetooth name
  Future<String> name() async {
    const tag = "name";
    try {
      return Future.value(await FlutterBluePlus.instance.name);
    } catch (e) {
      _log.e(tag, "getting bluetooth name failed", e);
      return Future.value("");
    }
  }

  /// check if bluetooth is on or off
  Future<bool> isOn() async {
    const tag = "isOn";
    try {
      return Future.value(await FlutterBluePlus.instance.isOn);
    } catch (e) {
      _log.e(tag, "checking if bluetooth isOn failed", e);
      return Future.value(false);
    }
  }
}
