import 'package:flutter/cupertino.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/types.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final BoolCallback onChanged;

  const AppSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        activeColor: Config.primaryColor,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
