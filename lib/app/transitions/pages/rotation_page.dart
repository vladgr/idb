import 'package:flutter/material.dart';

/// Usage in AppRoutePages: instead of
/// MaterialPage(
///   key: ValueKey(i.key),
///   child: SomeScreen(),
///   name: i.route,
/// );
///
/// Use:
///
/// RotationPage(
///   child: SignupScreen(),
///   name: i.route,
/// );
class RotationPage extends Page {
  final Widget child;
  final String name;

  RotationPage({
    required this.child,
    required this.name,
  }) : super(key: ValueKey(name));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return RotationTransition(
          child: this.child,
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.linear),
          ),
        );
      },
    );
  }
}
