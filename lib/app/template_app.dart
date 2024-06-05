import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:template/app/constants/string_constants.dart';
import 'package:template/app/router/app_router.dart';
import 'package:template/app/utils/extensions.dart';

class TemplateApp extends StatefulWidget {
  const TemplateApp({super.key});

  @override
  State<TemplateApp> createState() => _TemplateAppState();
}

class _TemplateAppState extends State<TemplateApp> {
  late final AppRouter _appRouter;
  final GlobalKey<NavigatorState> _navKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(_navKey);
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _scaffoldMessengerKey,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      routerConfig: _appRouter.config(
        // navigatorObservers: () => [
        //   FirebaseAnalyticsObserver(analytics: getIt<FirebaseAnalytics>()),
        //   routeObserver
        // ],
        deepLinkBuilder: (deepLink) => deepLink,
      ),
      builder: (_, child) => Theme(
        // you can implement theme changes here
        data: ThemeData(
          useMaterial3: true,
          // fontFamily: GoogleFonts.mavenPro().fontFamily,
          splashFactory: InkRipple.splashFactory,
          // highlightColor: transparent,
          // splashColor: ashGrey25,
          // colorSchemeSeed: blueL01,
          // primaryColor: black,
          // scaffoldBackgroundColor: white,
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(0.8.resize(context)),
          ),
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
