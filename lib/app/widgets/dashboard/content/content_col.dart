import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/widgets/dashboard/content/content_buttons.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class ContentCol extends StatelessWidget {
  const ContentCol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      final item = GetIt.I<ItemStore>().selectedItem;

      if (item == null) {
        return Empty();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: Ts.text18(Config.gray108Color),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ContentButtons(),
            ],
          ),
          Divider(),
        ],
      );
    });
  }
}
