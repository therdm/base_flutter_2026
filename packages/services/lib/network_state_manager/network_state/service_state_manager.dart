import 'package:reactiv/reactiv.dart';
import 'package:services/network_state_manager/network_response/service_response.dart';

export 'package:reactiv/state_management/reactive_types.dart';
export 'package:services/network_state_manager/network_response/service_response.dart';

///This enum is for Network State of a particular api call
///states are => notStarted, loading, error, noInternet, success
enum ServiceState {
  notStarted,
  loading,
  error,
  noInternet,
  success;

  bool get isLoading => this == ServiceState.loading;
  bool get isLoaded => this == ServiceState.success;
}

mixin ServiceStateMixin<T> {
  final Reactive<ServiceStatus> serviceStatus = Reactive<ServiceStatus>(const ServiceStatus.success());
  final Reactive<ServiceState> serviceState = Reactive<ServiceState>(ServiceState.notStarted);

  Future<ServiceResponse<T>> serviceObserver(Future<ServiceResponse<T>> Function() observer) async {
    serviceState.value = ServiceState.loading;
    final response = await observer();
    serviceStatus.value = response.status;
    if (!serviceStatus.value.isError) {
      serviceState.value = ServiceState.success;
    } else if (serviceStatus.value.isOffline) {
      serviceState.value = ServiceState.noInternet;
    } else {
      serviceState.value = ServiceState.error;
    }
    return response;
  }
}
