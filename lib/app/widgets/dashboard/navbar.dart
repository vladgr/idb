import 'package:flutter/material.dart';
import 'package:idb/app/services/l.dart';

class AppTopNavbar extends StatelessWidget {
  const AppTopNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: L.v(50),
      color: Colors.blue,
    );
  }
}
