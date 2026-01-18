part of 'navigation.dart';

class RouteParams {
  static const channelId = 'channelId';
}

class _Param {
  _Param(this.key, this.value);

  String key;
  String value;

  Map<String, String> toMap() {
    final Map<String, String> map = {};
    map[key] = value;
    return map;
  }
}

extension _RouteParamToMap on List<_Param> {
  // Map<String, String> toMap() {
  //   final Map<String, String> map = {};
  //   forEach((element) => map[element.key] = element.value);
  //   return map;
  // }
}
