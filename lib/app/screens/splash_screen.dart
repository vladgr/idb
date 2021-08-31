import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idb/app/services/ts.dart';

/// Optional child widget is used in Root
/// where we need to activate "widget.child" in navigator state.
/// For this purpose we render hidden "widget.child".
class SplashScreen extends StatefulWidget {
  final Widget? child;

  SplashScreen({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _wSplash() {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(radius: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.child != null) {
      return Stack(
        children: <Widget>[
          Opacity(opacity: 0, child: this.widget.child),
          _wSplash(),
        ],
      );
    }

    return _wSplash();
  }
}
