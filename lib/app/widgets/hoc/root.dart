import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:idb/app/routes.dart';
import 'package:idb/app/services/navigation_service.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:mobx/mobx.dart';
import 'package:idb/app/screens/splash_screen.dart';
import 'package:idb/app/services/helpers.dart';
import 'package:idb/app/services/logger_service.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/user_store.dart';

class Root extends StatefulWidget {
  final Key? key;
  final Widget child;

  Root({this.key, required this.child}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final _layout = GetIt.I<LayoutStore>();
  final _logger = GetIt.I<LoggerService>();
  final _nav = GetIt.I<NavigationService>();
  final _tag = GetIt.I<TagStore>();
  final _user = GetIt.I<UserStore>();

  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    _disposer = autorun((_) {
      if (_user.isAuthenticated == false) {
        _nav.navigateAndClear(Routes.loginRoute);
      }

      if (_user.isAuthenticated == true) {
        _init();
      }
    });

    Timer.run(() async {
      // Global detection of keyboard visibility
      if (isIOS || isAndroid) {
        final controller = KeyboardVisibilityController();
        controller.onChange.listen((bool isVisible) {
          _layout.setKeyboardVisibility(isVisible);
        });
      }

      await _layout.init();
      _logger.debug('Root inited');
    });
  }

  @override
  void dispose() {
    _disposer();
    _logger.debug('Root disposed');
    super.dispose();
  }

  Future<void> _init() async {
    await _user.getProfile();
    await _tag.load();
  }

  void _setScreenSettings(BuildContext ctx) {
    // Set real screen minSize for Layout Service
    var width = MediaQuery.of(ctx).size.width;
    var height = MediaQuery.of(ctx).size.height;
    var paddingTop = MediaQuery.of(ctx).padding.top;

    double minSize = width < height ? width : height;

    L.setScreenMinSize(minSize);
    L.setOrientation(MediaQuery.of(ctx).orientation);
    _layout.setOrientation(MediaQuery.of(ctx).orientation);
    _layout.setWidth(width);
    _layout.setHeight(height);
    _layout.setPaddingTop(paddingTop);
    _layout.setBreakpoints(width);
  }

  @override
  Widget build(BuildContext context) {
    _setScreenSettings(context);

    _logger.debug('Root render');

    return Observer(builder: (BuildContext context) {
      if (_user.isAuthenticated == null || !_layout.isLayoutReady) {
        return SplashScreen(child: this.widget.child);
      }

      return widget.child;
    });
  }
}
