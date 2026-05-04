import 'package:domain/models/responses/sample_response.dart';
import 'package:services/data_providers/data_providers.dart';

class SampleRepository {
  SampleRepository._();

  static final instance = SampleRepository._();

  Future<ServiceResponse<SampleResponse>> getSampleData() async {
    final response = await RestApi.instance.get('/sample-data/photos');
    return response.richData((data) => SampleResponse.fromJson(data));
  }
}
