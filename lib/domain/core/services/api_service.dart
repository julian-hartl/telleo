import 'package:dartz/dartz.dart';

import 'api_failure.dart';

abstract class ApiService {
  Future<Either<ApiFailure, Map<String, dynamic>>> get(
      {required String path, Map<String, dynamic>? body});
  Future<Either<ApiFailure, Map<String, dynamic>>> post(
      {required String path, required Map<String, dynamic> data});
  Future<Either<ApiFailure, Map<String, dynamic>>> update(
      {required String path, required Map<String, dynamic> data});
  Future<Either<ApiFailure, Map<String, dynamic>>> delete(
      {required String path, Map<String, dynamic>? data});
}
