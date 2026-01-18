import 'package:services/data_providers/interfaces/i_local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements ILocalStorage {
  LocalStorage._();

  static final LocalStorage instance = LocalStorage._();

  static late final SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  bool? readBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  double? readDouble(String key) {
    return _prefs.getDouble(key);
  }

  @override
  int? readInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  String? readString(String key) {
    return _prefs.getString(key);
  }

  @override
  List<String>? readStringList(String key) {
    return _prefs.getStringList(key);
  }

  @override
  Future<bool> writeBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  @override
  Future<bool> writeDouble(String key, double value) async {
    return _prefs.setDouble(key, value);
  }

  @override
  Future<bool> writeInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }

  @override
  Future<bool> writeString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  @override
  Future<bool> writeStringList(String key, List<String> value) async {
    return _prefs.setStringList(key, value);
  }

  @override
  Future<bool> delete(String key) async {
    return _prefs.remove(key);
  }
}
