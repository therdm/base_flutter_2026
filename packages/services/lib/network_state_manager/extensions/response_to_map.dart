import 'package:dio/dio.dart';

import 'package:services/network_state_manager/network_response/service_response.dart';

///This extension is for enhancing the existing class [Response] class
///from dio package like it gives a getter [status] of class [ServiceStatus]
///and a body of type Map as dio gives [data] of type [dynamic]
extension ResponseToMap on Response<dynamic> {
  ///This getter [body] is of type Map<String, dynamic>? as
  ///dio package gives [data] of type [dynamic]
  ///it is easy to work with Map when json coming from back-end
  Map<String, dynamic> get _body {
    if (data is Map<String, dynamic>?) {
      return (data as Map<String, dynamic>?) ?? {};
    } else {
      return {};
    }
  }

  ServiceResponse<T> richData<T>(
    T Function(Map<String, dynamic> json)? fromJsonT, {
    T? orElse,
  }) {
    return ServiceResponse<T>.fromJson(_body, fromJsonT, status: status);
  }

  ServiceResponse<List<T>> listData<T>(
    T Function(Map<String, dynamic> json) fromJsonT, {
    T? orElse,
  }) {
    List<T> fromListJsonT(List<Map<String, dynamic>> data) => data.map((e) => fromJsonT(e)).toList();
    return ServiceResponse<List<T>>.fromListJson(_body, fromListJsonT, status: status);
  }

  // NetworkResponse<T> richData<T>(T body) {
  //   return NetworkResponse(status: status, body: hasNullBody ? null : body);
  // }

  ///This getter of type bool is for knowing body is null or not
  ///this is helpful not writing the same condition "body == null" again and again
  bool get hasNullBody {
    return data == null;
  }

  ///as Dio package gives [statusCode], [statusMessage] separately with the response
  ///this getter will take those and convert to [ServiceStatus]
  ///and give it as a getter [status]
  ServiceStatus get status {
    final status = ServiceStatus(
      statusCode: statusCode ?? -101,
      message: statusMessage ?? _body['message']?.toString() ?? 'Something went wrong',
    );
    return status;
  }
}
