import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/constants.dart';
import 'package:idb/app/routes.dart';
import 'package:idb/app/services/helpers.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:idb/app/services/navigation_service.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/widgets/form/error_block.dart';
import 'package:idb/app/widgets/form/input_wrapper.dart';
import 'package:idb/app/widgets/layout/app_button.dart';
import 'package:idb/app/widgets/layout/br.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _logger = GetIt.I<LoggerService>();
  final _ns = GetIt.I<NavigationService>();
  final _user = GetIt.I<UserStore>();

  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _logger.debug('LogginScreen inited');
  }

  @override
  void dispose() {
    _user.clearErrors();
    _logger.debug('LogginScreen disposed');
    super.dispose();
  }

  bool get _isDisabled {
    if (_user.isInprogress) return true;
    if (_email.trim().isEmpty) return true;
    if (_password.trim().isEmpty) return true;
    return false;
  }

  void _onSuccess() {
    _ns.navigateAndClear(Routes.homeRoute);
  }

  Future<void> _onPressed() async {
    dynamic data = {
      'email': _email,
      'password': _password,
    };
    await _user.login(data, _onSuccess);
    dismissKeyboard(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: L.v(350),
            ),
            padding: EdgeInsets.symmetric(horizontal: L.v(50), vertical: L.v(50)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(L.v(5)),
              boxShadow: [kDefaultShadow],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputWrapper(
                  name: 'email',
                  hintText: L.t('E-mail'),
                  prefixIcon: Icons.email,
                  errors: _user.errors,
                  onChanged: (value) => setState(() => _email = value),
                  textInputAction: TextInputAction.next,
                ),
                BR(L.v(30)),
                InputWrapper(
                  name: 'password',
                  isPassword: true,
                  hintText: L.t('Password'),
                  prefixIcon: Icons.lock,
                  errors: _user.errors,
                  onChanged: (value) => setState(() => _password = value),
                  textInputAction: TextInputAction.done,
                ),
                ErrorBlock(errors: _user.errors),
                BR(L.v(30)),
                AppButton(
                  text: 'LOGIN',
                  isDisabled: _isDisabled,
                  onPressed: _onPressed,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
