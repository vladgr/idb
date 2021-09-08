import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/settings_store.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/layout/app_switch.dart';

class SettingsDialog extends StatefulWidget {
  SettingsDialog({Key? key}) : super(key: key);

  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final _settings = GetIt.I<SettingsStore>();
  final _user = GetIt.I<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Center(
        child: Container(
          width: L.v(300),
          padding: EdgeInsets.all(L.v(20)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(L.v(5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Users:',
                style: Ts.bold16(Config.gray108Color),
              ),
              Divider(),
              for (var user in _user.users)
                ListTile(
                  leading: Icon(Icons.manage_accounts),
                  title: Text(user.firstName),
                  trailing: AppSwitch(
                    value: _settings.selectedUserIds.contains(user.id),
                    onChanged: (value) {
                      _settings.toggleUser(user.id);
                    },
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
