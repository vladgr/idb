import 'package:flutter/material.dart';
import 'package:idb/app/models/item.dart';

class ItemBox extends StatelessWidget {
  final Item item;

  const ItemBox({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget _wLeft() {
    return Text('data');
  }

  Widget _wRight() {
    return Text('data');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: _wLeft(),
          ),
          _wRight(),
        ],
      ),
    );
  }
}
