abstract class ApiGateway {
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  });
}
