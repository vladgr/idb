import 'package:flutter/material.dart';
import 'package:idb/app/screens/login_screen.dart';

import 'screens/home_screen.dart';

class Routes {
  static const String homeRoute = '/';
  static const String loginRoute = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
