import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:template/app/constants/string_constants.dart';
import 'package:template/app/di/injection.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZoned(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    setPathUrlStrategy();

    await Hive.initFlutter();
    await Hive.openBox(appConfig);
    await Hive.openBox(authConfig);

    // init firebase
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    await configureInjection(
      environment: kDebugMode ? Environment.dev : Environment.prod,
    );

    runApp(await builder());
  });
}
