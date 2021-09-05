import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeySets {
  static final LogicalKeySet clear = LogicalKeySet(
    LogicalKeyboardKey.escape,
  );

  static final LogicalKeySet save = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.keyS,
  );

  static final LogicalKeySet toggleEditMode = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.keyE,
  );

  static final LogicalKeySet n1 = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.digit1,
  );

  static final LogicalKeySet n2 = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.digit2,
  );

  static final LogicalKeySet n3 = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.digit3,
  );

  static final LogicalKeySet n4 = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.digit4,
  );

  static final LogicalKeySet n5 = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.digit5,
  );
}
