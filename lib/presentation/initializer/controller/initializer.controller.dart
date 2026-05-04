import 'package:domain/models/responses/sample_response.dart';
import 'package:domain/use_cases/sample/sample_handler.dart';
import 'package:reactiv/controllers/reactive_controller.dart';
import 'package:reactiv/state_management/reactive_types.dart';

class InitializerController extends ReactiveController {
  final SampleHandler sampleHandler = SampleHandler();
  final photos = ReactiveList<PhotosData>([]);

  Future<void> fetchSampleData() async {
    final response = await sampleHandler.fetchSampleData();
    if(response.success) {
      photos.value = response.data ?? [];
    }
  }

  @override
  void onInit() {
    fetchSampleData();
    super.onInit();
  }
}
