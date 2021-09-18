import 'dart:async';
import 'package:flutter/material.dart';

class NavigationService {
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext getContext() {
    return navigatorKey.currentState!.overlay!.context;
  }

  Future<bool> canPop() async {
    if (navigatorKey.currentState == null) return false;
    return navigatorKey.currentState!.canPop();
  }

  Future<dynamic> pop() async {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> navigate(String routeName, {Object? arguments}) async {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replace(String routeName) async {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  // Navigate to route and clear all other widgets in tree
  Future<dynamic> navigateAndClear(String routeName, {Object? arguments}) async {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }
}
