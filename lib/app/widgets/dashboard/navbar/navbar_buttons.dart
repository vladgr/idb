import 'package:flutter/material.dart';
import 'package:idb/app/services/l.dart';

class NavbarButtons extends StatelessWidget {
  const NavbarButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: L.v(15)),
      width: 150,
      height: 40,
      color: Colors.pink,
    );
  }
}
