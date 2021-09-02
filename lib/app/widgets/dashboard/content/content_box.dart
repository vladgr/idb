import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/stores/item_store.dart';
import 'package:idb/app/widgets/dashboard/content/content_box_edit_mode.dart';
import 'package:idb/app/widgets/dashboard/content/content_box_read_mode.dart';

class ContentBox extends StatelessWidget {
  final Item item;

  const ContentBox({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _item = GetIt.I<ItemStore>();

    return Observer(builder: (BuildContext context) {
      return _item.isEditModeEnabled ? ContentBoxEditMode(item: item) : ContentBoxReadMode(item: item);
    });
  }
}
