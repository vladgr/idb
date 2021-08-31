import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idb/app/routes.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/widgets/layout/br.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _logger = GetIt.I<LoggerService>();
  final _user = GetIt.I<UserStore>();

  @override
  void initState() {
    super.initState();
    _logger.debug('LogginScreen inited');
  }

  @override
  void dispose() {
    _logger.debug('LogginScreen disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'LoginScreen',
              style: Theme.of(context).textTheme.headline4,
            ),
            BR(20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.homeRoute);
              },
              child: Text('Go to signup'),
            ),
            BR(20),
            ElevatedButton(
              onPressed: () async {
                await _user.tempAuth();

                // Required.
                Timer(Duration(milliseconds: 200), () {
                  Navigator.of(context).pushNamed(Routes.homeRoute);
                });
              },
              child: Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}
