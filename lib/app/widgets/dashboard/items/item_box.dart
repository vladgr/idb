import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/helpers.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/layout_store.dart';
import 'package:idb/app/widgets/layout/tap_wrapper.dart';

class ItemBox extends StatelessWidget {
  final Item item;
  final bool isActive;

  const ItemBox({
    Key? key,
    required this.item,
    required this.isActive,
  }) : super(key: key);

  Color get _textColor {
    return isActive ? Colors.white : Config.gray108Color;
  }

  Widget _wLeft() {
    return Text(
      item.name,
      style: Ts.text14(_textColor),
    );
  }

  Widget _wRight() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: item.tags.map((item) {
        return Text(
          item.name,
          style: Ts.text10(_textColor),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _item = GetIt.I<ItemStore>();
    final _layout = GetIt.I<LayoutStore>();

    return TapWrapper(
      onPressed: () {
        _item.setItem(this.item);
        _item.fetchItem(this.item.guid);
        _item.setEditModeEnabled(false);

        // Hide keyboard on mobile devices
        if (!_layout.isDesktop) {
          dismissKeyboard(context);
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: L.v(10), vertical: L.v(7)),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: L.v(1), color: Colors.black12),
            top: BorderSide(width: L.v(0.5), color: Colors.black12),
            right: BorderSide(width: L.v(1), color: Colors.black12),
            bottom: BorderSide(width: L.v(0.5), color: Colors.black12),
          ),
          color: isActive ? Config.gray125Color : Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: _wLeft(),
            ),
            _wRight(),
          ],
        ),
      ),
    );
  }
}
