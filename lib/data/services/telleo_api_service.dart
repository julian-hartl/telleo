import 'package:injectable/injectable.dart';
import 'package:telleo/domain/core/services/api_service.dart';

@LazySingleton(as: ApiService)
class TelleoApiService implements ApiService {}
