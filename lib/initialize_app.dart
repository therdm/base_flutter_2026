import 'package:domain/use_cases/local_storage/local_storage_handler.dart';
import 'package:services/data_providers/data_providers.dart';

import 'infrastructure/environment/app_environment.dart';

Future<void> initializeApp() async {
  InternetConnectionManager.instance.initialize();
  AppEnvironment.setCurrentEnvironment(AppEnvironment.test);
  await LocalStorage.instance.initialize();
  RestApi.instance.initialize(
    baseUrl: AppEnvironment.currentEnv.url,
    showApiLog: AppEnvironment.currentEnv.showLog,
    apiVersion: AppEnvironment.currentEnv.apiVersion,
    tokenKeyName: LocalStorageHandler.instance.tokenKeyName,
  );
}
