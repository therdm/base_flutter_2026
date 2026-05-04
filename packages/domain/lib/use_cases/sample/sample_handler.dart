import 'package:domain/models/responses/sample_response.dart';
import 'package:domain/repository/sample_repository.dart';
import 'package:services/network_state_manager/network_state/service_state_manager.dart';

class SampleHandler with ServiceStateMixin<List<PhotosData>> {
  SampleHandler();

  Future<ServiceResponse<List<PhotosData>>> fetchSampleData() async {
    return serviceObserver(() async {
      final response = await SampleRepository.instance.getSampleData();
      List<PhotosData> photosData = [];
      if (response.status.isSuccess) {
        photosData = response.data?.photos ?? [];
        return ServiceResponse.success(data: photosData);
      } else {
        return ServiceResponse(status: response.status);
      }
    });
  }
}