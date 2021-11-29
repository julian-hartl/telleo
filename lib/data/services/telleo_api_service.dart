import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/core/services/api_service/api_failure.dart';
import '../../domain/core/services/api_service/api_service.dart';

@LazySingleton(as: ApiService)
class TelleoApiService implements ApiService {
  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> delete(
      {required String path, Map<String, dynamic>? data}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> get(
      {required String path, Map<String, dynamic>? body}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> post(
      {required String path, required Map<String, dynamic> data}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, Map<String, dynamic>>> update(
      {required String path, required Map<String, dynamic> data}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
