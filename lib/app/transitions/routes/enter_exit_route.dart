import 'package:flutter/material.dart';

/// Usage:
/// Navigator.push(context,
/// EnterExitRoute(exitPage: this, enterPage: Screen2()))
class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  EnterExitRoute({
    required this.exitPage,
    required this.enterPage,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset(0.0, 0.0),
                  end: Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
