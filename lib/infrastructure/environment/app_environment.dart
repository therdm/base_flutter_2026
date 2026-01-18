enum AppEnvironment {
  local(Environment(url: 'http://127.0.0.1:3000', showLog: true, apiVersion: '', socketUrl: '')),
  prod(Environment(url: 'https://api.base_flutter.net', showLog: false, apiVersion: '/v1', socketUrl: '')),
  stag(
    Environment(url: 'https://api.stag.base_flutter.net', showLog: true, apiVersion: '/v1', socketUrl: ''),
  ),
  test(
    Environment(
      url: 'http://lazy-count-dev-alb-412901262.ap-south-2.elb.amazonaws.com',
      showLog: true,
      apiVersion: '',
      socketUrl: 'wss://lazy-count-dev-alb-412901262.ap-south-2.elb.amazonaws.com',
    ),
  ),
  dev(Environment(url: 'https://api.dev.base_flutter.net', showLog: true, apiVersion: '/v1', socketUrl: '')),
  dummy(Environment(url: 'https://api.slingacademy.com', showLog: true, apiVersion: '/v1', socketUrl: ''));

  const AppEnvironment(this.environment);

  final Environment environment;
  static bool showLog = true;
  static AppEnvironment _currentEnvironments = AppEnvironment.local;

  static Environment get currentEnv => _currentEnvironments.environment;

  static void setCurrentEnvironment(AppEnvironment env, {bool showLog = true}) {
    _currentEnvironments = env;
    showLog = true;
  }
}

class Environment {
  const Environment({
    required this.url,
    required this.showLog,
    required this.apiVersion,
    required this.socketUrl,
  });

  final String url;
  final bool showLog;
  final String apiVersion;
  final String socketUrl;
}
