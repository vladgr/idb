import 'package:flutter/material.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class ContentBoxEditMode extends StatelessWidget {
  final Item item;

  const ContentBoxEditMode({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Empty();
  }
}
