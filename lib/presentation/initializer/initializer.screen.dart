import 'package:domain/use_cases/local_storage/local_storage_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphics/graphics_consts/consts.dart';
import 'package:graphics/utils/extension_text_style.dart';
import 'package:reactiv/reactiv.dart';

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
      body: Center(child: Text(GraphicsStringConsts.helloWorld, style: Theme.of(context).textTheme.displayMedium?.bold)),
    );
  }
}
