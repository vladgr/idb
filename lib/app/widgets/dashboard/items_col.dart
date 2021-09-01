import 'package:flutter/material.dart';
import 'package:idb/app/services/l.dart';

class ItemsCol extends StatelessWidget {
  const ItemsCol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          height: L.v(200),
          color: Colors.pink[50],
        ),
      ],
    );
  }
}
