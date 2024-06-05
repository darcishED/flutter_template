import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()

///initializing service locator for the app
configureInjection({String? environment}) =>
    getIt.init(environment: environment);
