import 'package:flutter/material.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class BH extends StatelessWidget {
  final double width;

  const BH(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: this.width),
      child: Empty(),
    );
  }
}
