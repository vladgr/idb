import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/routes.dart';
import 'package:idb/app/services/helpers.dart';
import 'package:idb/app/services/locator.dart';
import 'package:idb/app/services/navigation_service.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/services/sentry_service.dart';
import 'package:idb/app/widgets/hoc/root.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/widgets/shortcuts/app_shortcuts.dart';

class MyApp extends StatelessWidget {
  final ns = GetIt.I<NavigationService>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iDB',
      navigatorKey: ns.navigatorKey,
      initialRoute: Routes.homeRoute,
      onGenerateRoute: Routes.generateRoute,
      theme: appTheme(),
      builder: (context, child) => ScaffoldMessenger(
        key: GetIt.I<ScaffoldService>().scaffoldKey,
        child: Scaffold(
          appBar: null,
          body: GestureDetector(
            onTap: () {
              if (isIOS) hideKeyboard(context);
            },
            child: AppShortcuts(
              child: Root(
                child: child!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> loadConfig() async {
  String data = await rootBundle.loadString('assets/json/config.json');
  final m = await json.decode(data);

  Config.apiUrl = m['apiUrl'];
  Config.sentryDSN = m['sentryDSN'];
  Config.bucketUrl = m['bucketUrl'];
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadConfig();
  setupLocator();

  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = Config.sentryDSN;
      },
    );

    if (isWindows || isMacOS || isLinux) {
      await DesktopWindow.setMinWindowSize(Size(375, 375));

      if (isMacOS) {
        // Optimized for personal use on Mac
        await DesktopWindow.setWindowSize(Size(1300, 900));
      }
    }

    runApp(MyApp());
  }, (exception, stackTrace) async {
    GetIt.I<SentryService>().reportError(exception, stackTrace);
  });

  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };
}

ThemeData appTheme() {
  return ThemeData(
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      toolbarTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    primaryColor: Config.primaryColor,
    iconTheme: IconThemeData(
      color: Config.primaryColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Config.primaryColor,
      textTheme: ButtonTextTheme.accent,
    ),
  );
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode curFocus = FocusScope.of(context);
  if (!curFocus.hasPrimaryFocus && curFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
