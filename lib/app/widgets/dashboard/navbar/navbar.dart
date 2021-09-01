import 'package:flutter/material.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/widgets/dashboard/navbar/navbar_buttons.dart';
import 'package:idb/app/widgets/dashboard/navbar/navbar_search.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: L.v(56),
      ),
      width: double.infinity,
      color: Config.gray243Color,
      child: Row(
        children: [
          NavbarSearch(),
          Spacer(),
          NavbarButtons(),
        ],
      ),
    );
  }
}
