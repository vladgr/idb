import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/stores/item_store.dart';

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
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    var item = this.widget.item;

    _controller.addListener(() {
      item.content = _controller.text;
      _item.setItem(item);
    });

    // Set initial value
    _controller.text = item.content;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: TextField(
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
              borderSide: BorderSide(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      );
    });
  }
}
