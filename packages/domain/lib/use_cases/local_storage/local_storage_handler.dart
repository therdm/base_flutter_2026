import 'package:services/data_providers/data_providers.dart';

class _LocalStorageKeys {
  static String accessToken = 'access_token';
  static String userId = 'user_id';
  static String phoneNumber = 'phone_number';
  static String deviceId = 'device_id';
  static String route = 'route_key';
}

class LocalStorageHandler {
  LocalStorageHandler._();

  static LocalStorageHandler instance = LocalStorageHandler._();

  Future<void> saveAccessToken(String? value) async {
    if (value != null) {
      await LocalStorage.instance.writeString(_LocalStorageKeys.accessToken, value);
    }
  }

  Future<void> saveUserId(String? value) async {
    if (value != null) {
      await LocalStorage.instance.writeString(_LocalStorageKeys.userId, value);
    }
  }

  Future<void> savePhoneNumber(String? value) async {
    if (value != null) {
      await LocalStorage.instance.writeString(_LocalStorageKeys.phoneNumber, value);
    }
  }

  Future<void> saveUserDeviceId(String? value) async {
    if (value != null) {
      await LocalStorage.instance.writeString(_LocalStorageKeys.deviceId, value);
    }
  }

  Future<void> saveRoute(String? value) async {
    if (value != null) {
      await LocalStorage.instance.writeString(_LocalStorageKeys.route, value);
    }
  }

  String? get accessToken => LocalStorage.instance.readString(_LocalStorageKeys.accessToken);

  String? get userId => LocalStorage.instance.readString(_LocalStorageKeys.userId);

  String get tokenKeyName => _LocalStorageKeys.accessToken;

  String get phoneNumber => LocalStorage.instance.readString(_LocalStorageKeys.phoneNumber) ?? '';

  String get deviceId => LocalStorage.instance.readString(_LocalStorageKeys.deviceId) ?? '';

  String get route => LocalStorage.instance.readString(_LocalStorageKeys.route) ?? '';

  Future<bool> get deleteAccessToken => LocalStorage.instance.delete(_LocalStorageKeys.accessToken);

  Future<void> clearAppData() async {
    await LocalStorage.instance.delete(_LocalStorageKeys.accessToken);
    await LocalStorage.instance.delete(_LocalStorageKeys.userId);
    await LocalStorage.instance.delete(_LocalStorageKeys.phoneNumber);
    await LocalStorage.instance.delete(_LocalStorageKeys.deviceId);
  }
}
