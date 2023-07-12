import 'package:flutter/cupertino.dart';
import 'package:idb/app/config.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isDisabled;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        disabledColor: Config.primaryColor.withOpacity(0.4),
        color: Config.primaryColor,
        onPressed: isDisabled ? null : onPressed,
        child: Text(text),
      ),
    );
  }
}
