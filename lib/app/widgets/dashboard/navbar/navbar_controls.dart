import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class NavbarControls extends StatelessWidget {
  NavbarControls({Key? key}) : super(key: key);

  final _item = GetIt.I<ItemStore>();
  final _layout = GetIt.I<LayoutStore>();
  final _user = GetIt.I<UserStore>();

  double get _iconSize {
    return L.v(24);
  }

  Widget _wProfileEmail() {
    if (_layout.isMobile) {
      return Empty();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: L.v(10)),
      child: Text(
        _user.profile?.email ?? '',
        style: Ts.text14(Config.gray108Color),
      ),
    );
  }

  /// Close selected item on Mobile
  Widget _wCloseContentButton() {
    if (_layout.isMobile && _item.hasSelectedItem) {
      return IconButton(
        constraints: BoxConstraints(),
        onPressed: () => _item.clearSelectedItem(),
        icon: Icon(Icons.clear),
        color: Config.gray108Color,
        iconSize: _iconSize,
      );
    }
    return Empty();
  }

  Widget _wSettingsButton() {
    return IconButton(
      constraints: BoxConstraints(),
      onPressed: () => {},
      icon: Icon(Icons.settings),
      color: Config.gray108Color,
      iconSize: _iconSize,
    );
  }

  Widget _wLogoutButton() {
    return IconButton(
      constraints: BoxConstraints(),
      onPressed: _user.logout,
      icon: Icon(Icons.exit_to_app),
      color: Config.gray108Color,
      iconSize: _iconSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: L.v(15)),
      child: Row(
        children: [
          _wProfileEmail(),
          _wCloseContentButton(),
          _wSettingsButton(),
          _wLogoutButton(),
        ],
      ),
    );
  }
}
