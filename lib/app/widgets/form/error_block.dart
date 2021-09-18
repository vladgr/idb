import 'package:flutter/material.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/ts.dart';
import 'package:idb/app/widgets/layout/empty.dart';

class ErrorBlock extends StatelessWidget {
  final String? name;
  final dynamic errors;

  const ErrorBlock({
    Key? key,
    this.name,
    this.errors,
  }) : super(key: key);

  List<Widget> _wChildren() {
    List<Widget> l = [
      SizedBox(width: double.infinity), // take full width
    ];

    for (var error in errors['errors']) {
      l.add(
        Padding(
          padding: EdgeInsets.only(top: L.v(10)),
          child: Text(
            error.toString(),
            style: Ts.bold16(Config.redColor),
          ),
        ),
      );
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    if (errors == null) {
      return Empty();
    }

    if (!errors.containsKey('errors')) {
      return Empty();
    }

    if (name != null && errors.containsKey('errorBlockName') && name != errors['errorBlockName']) {
      return Empty();
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: L.v(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _wChildren(),
      ),
    );
  }
}
