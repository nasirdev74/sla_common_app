/// bluetooth credentials
const BLUETOOTH_SERVICE_UUID = "37fc19ab-98ca-4543-a68b-d183da78acdc";
const BLUETOOTH_WRITE_UUID = "a40d0c2e-73ba-4d8b-8eef-9a0666992e56";
const BLUETOOTH_NOTIFICATION_UUID = "49535343-8841-43f4-a8d4-ecbe34729bb3";

const BLE_NOTIFICATION_MODEL_KEY = "model";
const BLE_NOTIFICATION_CONFIG_KEY = "config";
const BLE_NOTIFICATION_WIFI_KEY = "wifi";
const BLE_NOTIFICATION_MQTT_KEY = "mqtt";

/// bluetooth scan timeout
const SCAN_TIMEOUT = Duration(seconds: 2);

/// bluetooth connect timeout
const CONNECT_TIMEOUT = Duration(seconds: 5);

/// bluetooth scan retry delay
const RETRY_DELAY = Duration(milliseconds: 500);
const LOCATION_CHECK_INTERVAL = Duration(seconds: 2);
