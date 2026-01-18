import 'package:services/data_providers/local_storage.dart';

class RemoteAuthentication {
  RemoteAuthentication._();

  static final instance = RemoteAuthentication._();

  Future<Map<String, dynamic>> getHeader(String tokenKeyName, {bool isSocketUse = false}) async {
    final String? bToken = LocalStorage.instance.readString(tokenKeyName);
    final Map<String, dynamic> headers = isSocketUse
        ? {
            'Authorization': 'Bearer $bToken',
            'Content-Type': 'application/json',
          }
        : {
            'Authorization': 'Bearer $bToken',
            'Access-Control-Allow-Headers': true,
            'Content-Type': 'application/json',
          };
    return headers;
  }
}
