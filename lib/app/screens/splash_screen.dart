import 'package:flutter/material.dart';

/// Optional child widget is used in Root
/// where we need to activate "widget.child" in navigator state.
/// For this purpose we render hidden "widget.child".
class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _wSplash() {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/pics/logo_192x192.png',
          width: 70,
          height: 70,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return Stack(
        children: <Widget>[
          Opacity(opacity: 0, child: widget.child),
          _wSplash(),
        ],
      );
    }

    return _wSplash();
  }
}
