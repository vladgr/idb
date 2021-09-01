import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/user_store.dart';

class NavbarInfo extends StatelessWidget {
  const NavbarInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = GetIt.I<UserStore>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: L.v(15)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: L.v(10)),
            child: Text(
              _user.profile?.email ?? '',
              style: Ts.text14(Config.gray108Color),
            ),
          ),
          IconButton(
            constraints: BoxConstraints(),
            onPressed: () => {},
            icon: Icon(Icons.menu),
            color: Config.gray108Color,
            iconSize: L.v(24),
          ),
          IconButton(
            constraints: BoxConstraints(),
            onPressed: () => {},
            icon: Icon(Icons.exit_to_app),
            color: Config.gray108Color,
            iconSize: L.v(24),
          ),
        ],
      ),
    );
  }
}
