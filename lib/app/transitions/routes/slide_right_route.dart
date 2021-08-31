import 'package:flutter/material.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            var offset = Offset(-1, 0);

            return SlideTransition(
              position: Tween<Offset>(
                begin: offset,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
