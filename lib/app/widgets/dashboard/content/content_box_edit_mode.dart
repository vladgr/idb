import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/stores/layout_store.dart';

class ContentBoxEditMode extends StatefulWidget {
  final Item item;

  const ContentBoxEditMode({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _ContentBoxEditModeState createState() => _ContentBoxEditModeState();
}

class _ContentBoxEditModeState extends State<ContentBoxEditMode> {
  final _item = GetIt.I<ItemStore>();
  final _layout = GetIt.I<LayoutStore>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    var item = this.widget.item;

    // Set initial value
    _controller.text = item.content;

    // addListener is triggered when we set initial value.
    // MobX state in initState should be updated in Timer.run
    // otherwise it throws exception when it updated instantly.
    Timer.run(() {
      _controller.addListener(() {
        item.content = _controller.text;
        _item.setItem(item);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: TextField(
        focusNode: _layout.contentFocusNode,
        cursorColor: Config.gray108Color,
        cursorWidth: 3,
        style: Ts.text13(Config.gray108Color),
        textAlignVertical: TextAlignVertical.top,
        maxLines: null,
        minLines: null,
        expands: true,
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: L.v(1), color: Colors.black12),
            borderRadius: BorderRadius.circular(L.v(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black12),
            borderRadius: BorderRadius.circular(L.v(5)),
          ),
        ),
      ),
    );
  }
}
