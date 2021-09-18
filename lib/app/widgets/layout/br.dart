import 'package:flutter/material.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class BR extends StatelessWidget {
  final double height;

  const BR(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height),
      child: Empty(),
    );
  }
}

// SizedBox(height: this.height)
