import 'package:flutter/material.dart';

class TapWrapper extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final bool hasEffect; // Material effect

  const TapWrapper({
    Key? key,
    required this.child,
    required this.onPressed,
    this.hasEffect = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasEffect) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed as void Function()?,
          child: child,
        ),
      );
    }

    // No material effect
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed as void Function()?,
        child: child,
      ),
    );
  }
}
