import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../domain/core/gateways/api_gateway.dart';

@LazySingleton(as: ApiGateway)
class TelleoApiGateway implements ApiGateway {
  final Dio dio;

  TelleoApiGateway(this.dio);

  @override
  Future get({
    required String endpoint,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(endpoint,
        options: Options(
          headers: header,
          validateStatus: validateStatus,
        ),
        queryParameters: queryParameters);
    return response.data;
  }

  bool validateStatus(int? status) {
    return true;
  }

  @override
  Future post(
      {required String endpoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? body}) async {
    final response = await dio.post(
      endpoint,
      options: Options(
        headers: header,
        validateStatus: validateStatus,
      ),
      data: body,
    );
    return response.data;
  }
}
