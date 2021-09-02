import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/helpers.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/constants/enums.dart';

class ContentButtons extends StatelessWidget {
  final Item item;

  ContentButtons({
    Key? key,
    required this.item,
  }) : super(key: key);

  final _item = GetIt.I<ItemStore>();
  final _scaffold = GetIt.I<ScaffoldService>();

  Future<void> _onPressSave(BuildContext context) async {
    bool isUpdated = await _item.updateItem(
      this.item.guid,
      this.item.content,
      this.item.tags.map((x) => x.id).toList(),
    );
    if (isUpdated) {
      _scaffold.createAlert('Item updated', seconds: 1);
    } else {
      _scaffold.createAlert('Something went wrong!', type: AlertType.error);
    }
  }

  Future<void> _onPressDelete(BuildContext context) async {
    await showConfirmDialog(
      context,
      'Are you sure?',
      'Item: ${this.item.name} will be deleted.',
      'Delete',
      _onPressDeleteConfirm,
    );
  }

  Future<void> _onPressDeleteConfirm() async {
    bool isDeleted = await _item.deleteItem(this.item.guid);
    if (isDeleted) {
      _item.postDeleteItem();
      _scaffold.createAlert('Item deleted');
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
              onPressed: () => _onPressSave(context),
              icon: Icon(
                Icons.save,
                color: Config.gray108Color,
                size: L.v(20),
              ),
            ),
          if (_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: () => _onPressDelete(context),
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
