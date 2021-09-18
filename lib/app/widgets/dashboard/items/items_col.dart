import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/widgets/dashboard/items/item_box.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class ItemsCol extends StatelessWidget {
  const ItemsCol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _item = GetIt.I<ItemStore>();
    final _layout = GetIt.I<LayoutStore>();

    return Observer(builder: (BuildContext context) {
      final items = _item.map.values.toList();

      if (items.isEmpty) {
        return Empty();
      }

      return SizedBox(
        height: _layout.height - L.v(56) - L.v(30),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (index >= items.length) {
              return Empty();
            }

            return Observer(builder: (BuildContext context) {
              final item = items[index];
              final isActive = _item.selectedItem == item;

              return ItemBox(
                item: item,
                isActive: isActive,
              );
            });
          },
        ),
      );
    });
  }
}
