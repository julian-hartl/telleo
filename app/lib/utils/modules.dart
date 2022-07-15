import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Logger logger() => Logger();
  @lazySingleton
  Dio dio() => Dio();
}
