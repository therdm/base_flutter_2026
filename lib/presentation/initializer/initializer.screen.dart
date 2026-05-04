import 'package:domain/use_cases/local_storage/local_storage_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactiv/reactiv.dart';
import 'package:services/network_state_manager/network_state/service_state_manager.dart';

import 'controller/initializer.controller.dart';

class InitializerScreen extends ReactiveStateWidget<InitializerController> {
  const InitializerScreen({super.key, required this.state});

  @override
  BindController<InitializerController>? bindController() {
    return BindController(controller: () => InitializerController());
  }

  @override
  Future<void> initStateWithContext(BuildContext context) async {
    super.initState();
    await Future<void>.delayed(const Duration(milliseconds: 100)).then((value) {
      if (state.location == '/') {
        if (context.mounted) {
          if (LocalStorageHandler.instance.accessToken?.isNotEmpty ?? false) {
            //Routes.of(context).toLocationDashBoard();
          } else {
            //Routes.of(context).toLocationPhoneEntry();
          }
        }
      }
    });
  }

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveBuilder(
        reactiv: controller.sampleHandler.serviceState,
        builder: (context, serviceState) {
          return switch (serviceState) {
            ServiceState.notStarted || ServiceState.loading => const Center(child: CircularProgressIndicator()),
            ServiceState.error || ServiceState.noInternet => const Center(child: Text('Something west wrong...')),
            ServiceState.success => ReactiveBuilder(
              reactiv: controller.photos,
              builder: (context, photos) {
                return GridView.count(crossAxisCount: 2, children: photos.map((e) => Image.network(e.url ?? '')).toList());
              },
            ),
          };
        },
      ),
    );
  }
}
