part of 'navigation.dart';

class Routes {
  Routes._(this.context);

  factory Routes.of(BuildContext context) {
    return Routes._(context);
  }

  final BuildContext context;

  void toLocationInitializer() => context.go(_Path.initializer);
}

class _Path {
  static const initializer = '/';
}

