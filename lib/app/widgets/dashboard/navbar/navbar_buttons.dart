import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/layout_store.dart';

class NavbarButtons extends StatelessWidget {
  const NavbarButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _layout = GetIt.I<LayoutStore>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: L.v(15)),
      width: 150,
      height: 40,
      color: Config.primaryColor,
      child: Center(
        child: Text(
          _layout.width.toString(),
          style: Ts.text14(Colors.white),
        ),
      ),
    );
  }
}
