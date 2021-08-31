import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/screens/splash_screen.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/stores/user_store.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _logger = GetIt.I<LoggerService>();
  final _user = GetIt.I<UserStore>();

  @override
  void initState() {
    super.initState();
    _logger.debug('HomeScreen inited');
  }

  @override
  void dispose() {
    _logger.debug('HomeScreen disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      if (_user.isAuthenticated == false || _user.profile == null) {
        return SplashScreen();
      }

      return SafeArea(
        child: Center(
          child: Text('Home'),
        ),
      );
    });
  }
}
