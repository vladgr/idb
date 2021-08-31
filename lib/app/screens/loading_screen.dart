import 'package:flutter/material.dart';
import 'package:idb/app/services/ts.dart';

/// Optional child widget is used in Root
/// where we need to activate "widget.child" in navigator state.
/// For this purpose we render hidden "widget.child".
class LoadingScreen extends StatefulWidget {
  final Widget? child;

  LoadingScreen({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Widget _wLoading() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Center(
        child: Text(
          'LOADING...',
          style: Ts.bold32(Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.child != null) {
      return Stack(
        children: <Widget>[
          Opacity(opacity: 0, child: this.widget.child),
          _wLoading(),
        ],
      );
    }

    return _wLoading();
  }
}
