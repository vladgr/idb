import 'package:flutter/material.dart';
import 'package:idb/app/services/l.dart';

class ContentCol extends StatelessWidget {
  const ContentCol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: L.v(200),
          color: Colors.green[50],
        ),
      ],
    );
  }
}
