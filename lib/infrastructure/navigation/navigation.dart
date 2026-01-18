import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/initializer/initializer.screen.dart';
import '../../presentation/route_error/route_error.screen.dart';

part 'route_param.dart';
part 'routes.dart';

class Nav {
  static final GoRouter goRoutes = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => RouteErrorScreen(error: state.error),
    routes: [
      LazyTransitionRoute(
        name: _Path.initializer,
        nameAlt: _Path.initializer,
        page: (context, state) => InitializerScreen(state: state),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
GoRoute LazyTransitionRoute({
  required String name,
  required Widget Function(BuildContext, GoRouterState)? page,
  String? nameAlt,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  GlobalKey<NavigatorState>? parentNavigatorKey,
  FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
  List<RouteBase> routes = const <RouteBase>[],
}) {
  return GoRoute(
    path: name,
    name: nameAlt,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: page!.call(context, state),
        transitionDuration: const Duration(milliseconds: 50),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      );
    },
    // builder: pageBuilder,
    parentNavigatorKey: parentNavigatorKey,
    redirect: redirect,
    routes: routes,
  );
}
