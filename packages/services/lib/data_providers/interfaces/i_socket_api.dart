abstract class ISocketApi {
  Future<void> connectAndListen({
    required String path,
    String? baseUrl,
    bool attachToken = true,
    void Function(dynamic)? onDataCallback,
    void Function(dynamic)? onError,
    void Function()? onDone,
    bool? cancelOnError,
  });

  void send(GenericSinkPayload data);

  Future<void> disconnect();
}

abstract class GenericSinkPayload {
  GenericSinkPayload({required this.event});

  final String event;

  Map<String, dynamic> toJson();
}
