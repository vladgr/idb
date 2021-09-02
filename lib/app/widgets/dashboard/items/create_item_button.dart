import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/stores/tag_store.dart';
import 'package:idb/app/stores/user_store.dart';
import 'package:idb/app/widgets/dashboard/items/create_item_dialog.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class CreateItemButton extends StatelessWidget {
  CreateItemButton({Key? key}) : super(key: key);

  final _scaffold = GetIt.I<ScaffoldService>();
  final _tag = GetIt.I<TagStore>();
  final _user = GetIt.I<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      if (_user.profile == null || !_user.profile!.isAdmin) return Empty();

      return FloatingActionButton(
        onPressed: () async {
          if (_tag.selectedTags.isEmpty) {
            _scaffold.createAlert('Please select tags', type: 'error');
            return;
          }

          await showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => CreateItemDialog(),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Config.primaryColor,
        foregroundColor: Colors.white,
      );
    });
  }
}
