import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/stores/item_store.dart';

class ContentButtons extends StatelessWidget {
  const ContentButtons({Key? key}) : super(key: key);

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
              onPressed: () => {},
              icon: Icon(
                Icons.save,
                color: Config.gray108Color,
                size: L.v(20),
              ),
            ),
          if (_item.isEditModeEnabled)
            IconButton(
              constraints: BoxConstraints(),
              onPressed: () => {},
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
