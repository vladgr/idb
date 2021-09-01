import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';

class ContentButtons extends StatelessWidget {
  const ContentButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          constraints: BoxConstraints(),
          onPressed: () => {},
          icon: Icon(
            Icons.dehaze,
            color: Config.gray108Color,
            size: L.v(20),
          ),
        ),
        IconButton(
          constraints: BoxConstraints(),
          onPressed: () => {},
          icon: Icon(
            Icons.save,
            color: Config.gray108Color,
            size: L.v(20),
          ),
        ),
        IconButton(
          constraints: BoxConstraints(),
          onPressed: () => {},
          icon: Icon(
            Icons.delete,
            color: Config.gray108Color,
            size: L.v(20),
          ),
        ),
      ],
    );
  }
}
