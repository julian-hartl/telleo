import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependencies.config.dart';

final app = GetIt.instance;

@InjectableInit()
void configureDependenices() => $initGetIt(app);
