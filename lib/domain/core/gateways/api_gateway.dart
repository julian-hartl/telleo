import 'package:dartz/dartz.dart';

abstract class ApiGateway {
  Future<Either<Map<String, dynamic>, List<Map<String, dynamic>>>> get({
    required String endpoint,
    Map<String, dynamic> header,
  });
}
