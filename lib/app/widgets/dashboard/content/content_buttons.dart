import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/constants/enums.dart';

class ContentButtons extends StatelessWidget {
  ContentButtons({Key? key}) : super(key: key);

  final _item = GetIt.I<ItemStore>();
  final _scaffold = GetIt.I<ScaffoldService>();

  Future<void> _onPressSave() async {
    final item = _item.selectedItem!;

    bool isUpdated = await _item.updateItem(item.guid, item.content, item.tags.map((x) => x.id).toList());
    if (isUpdated) {
      _scaffold.createAlert('Item updated', seconds: 1);
    } else {
      _scaffold.createAlert('Something went wrong!', type: AlertType.error);
    }
  }

  Future<void> _onPressDelete() async {}

  Future<void> _onPressDeleteConfirm() async {
    bool isDeleted = await _item.deleteItem('guid');
    if (isDeleted) {
      _scaffold.createAlert('Item updated');
    } else {
      _scaffold.createAlert('Something went wrong!', type: AlertType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _item = GetIt.I<ItemStore>();

    return Observer(builder: (BuildContext context) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: _onPressSave,
              icon: Icon(
                Icons.save,
                color: Config.gray108Color,
                size: L.v(20),
              ),
            ),
          if (_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: _onPressDelete,
              icon: Icon(
                Icons.delete,
                color: Config.gray108Color,
                size: L.v(20),
              ),
            ),
          if (_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: () => _item.setEditModeEnabled(false),
              icon: Icon(
                Icons.arrow_right_alt,
                color: Config.gray108Color,
                size: L.v(20),
              ),
            ),
          if (!_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: () => _item.setEditModeEnabled(true),
              icon: Icon(
                Icons.wysiwyg,
                color: Config.gray108Color,
                size: L.v(20),
              ),
            ),
        ],
      );
    });
  }
}
