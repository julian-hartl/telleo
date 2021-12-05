abstract class ApiGateway {
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? header,
  });

  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  });
}
