export '../extensions/response_to_map.dart';

part 'service_status.dart';

///This class is for returning Entity class as [body] and NetworkStatus as [status]
///from the RemoteDaos to the Use Cases or the controller
class ServiceResponse<T> {
  ///this constructor is to be used by outside world to construct
  ///a object of [ServiceResponse] class by supplying
  ///[status] of type [ServiceStatus] and [body] of type [T]

  ServiceResponse({
    this.message,
    this.error,
    this.data,
    required this.status,
    bool? success,
  }) : success = success ?? status.isSuccess;

  factory ServiceResponse.success({
    T? data,
    String? message,
  }) =>
      ServiceResponse._gen(data, ServiceStatus.success(message: message ?? 'success'));

  factory ServiceResponse._gen(
    T? data,
    ServiceStatus status,
  ) {
    return ServiceResponse(data: data, status: status);
  }

  factory ServiceResponse.error({
    T? data,
    String? message,
  }) =>
      ServiceResponse._gen(data, ServiceStatus.error(message: message ?? 'error'));

  factory ServiceResponse.fromListJson(
    Map<String, dynamic> json,
    T Function(List<Map<String, dynamic>> json)? fromListJsonT, {
    required ServiceStatus status,
  }) {
    return ServiceResponse<T>(
      success: json['success'] == true,
      message: json['message'].toString(),
      error: json['error'] != null ? ApiError.fromJson(json['error'] as Map<String, dynamic>) : null,
      data: json['data'] != null && json['data'] is List<dynamic> && fromListJsonT != null
          ? fromListJsonT((json['data'] as List<dynamic>).map((e) => e as Map<String, dynamic>).toList())
          : null,
      status: status,
    );
  }

  factory ServiceResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT, {
    required ServiceStatus status,
  }) {
    return ServiceResponse<T>(
      success: json['success'] == true,
      message: json['message'].toString(),
      error: json['error'] != null ? ApiError.fromJson(json['error'] as Map<String, dynamic>) : null,
      data: json['data'] != null && json['data'] is Map<String, dynamic> && fromJsonT != null
          ? fromJsonT(json['data'] as Map<String, dynamic>)
          : null,
      status: status,
    );
  }

  final bool success;
  final String? message;
  final ApiError? error;
  final T? data;

  ///this is to store the status of a api call when its executed
  final ServiceStatus status;

  Map<String, dynamic> toJson(Object? Function(T value)? toJsonT) {
    return {
      'success': success,
      'message': message,
      'error': error?.toJson(),
      if (data != null && toJsonT != null) 'data': toJsonT(data as T),
    };
  }

// factory ServiceResponse.success({
//   T? data,
//   String? message,
// }) =>
//     ServiceResponse._gen(data, ServiceStatus.success(message: message ?? 'success'));
//
// ServiceResponse.error({
//   this.body,
//   String? message,
// }) : status = ServiceStatus.error(message: message ?? 'error');

// const ServiceResponse.networkError({
//   required this.body,
// }) : status = const ServiceStatus.networkError();
//
// ServiceResponse.dbError({
//   this.body,
//   String? message,
// }) : status = ServiceStatus.dbError(message: message ?? 'Database Error');

  ///this constructor is to construct a object of [ServiceResponse]
  ///class by supplying [body] of type [T] and [status] is set up as NO INTERNET
// ServiceResponse.offline({
//   required this.body,
// }) : status = const ServiceStatus.noInternet();

// factory NetworkResponse.fromResponse({required Response response}) {
//   dynamic x = T;
//   return NetworkResponse(status: response.status, body: x.fromJson(response.body!));
// }
}

class ApiResponse<T> {
  ApiResponse({
    required this.success,
    this.message,
    this.error,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] == true,
      message: json['message'].toString(),
      error: json['error'] != null ? ApiError.fromJson(json['error'] as Map<String, dynamic>) : null,
      data: json['data'] != null && json['data'] is Map<String, dynamic> && fromJsonT != null
          ? fromJsonT(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  final bool success;
  final String? message;
  final ApiError? error;
  final T? data;

  Map<String, dynamic> toJson(Object? Function(T value)? toJsonT) {
    return {
      'success': success,
      'message': message,
      'error': error?.toJson(),
      if (data != null && toJsonT != null) 'data': toJsonT(data as T),
    };
  }
}

class ApiError {
  ApiError({this.code, this.message});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      code: json['code']?.toString(),
      message: json['message']?.toString(),
    );
  }

  final String? code;
  final String? message;

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };
}
