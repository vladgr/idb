import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/types.dart';
import 'package:idb/app/services/ts.dart';
import 'package:uuid/uuid.dart';

bool isInt(String? value) {
  if (value == null) {
    return false;
  }

  return int.tryParse(value) != null;
}

String getGuid() {
  var uuid = Uuid();
  String s = uuid.v4();
  return s.replaceAll('-', '');
}

RegExp getEmailRegExp() {
  return RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
}

RegExp getLatinLettersRegExp() {
  return RegExp(r'^[A-Za-z]+$');
}

String getLatinLettersRegExpError() {
  return 'Only latin letters allowed';
}

RegExp getLatinLettersAndSpaceRegExp() {
  return RegExp(r'^[A-Za-z\s]+$');
}

String getLatinLettersAndSpaceRegExpError() {
  return 'Only latin letters and space allowed';
}

RegExp getLatinLettersAndDigitsRegExp() {
  return RegExp(r'^[A-Za-z]+[A-Za-z0-9]*$');
}

String getLatinLettersAndDigitsRegExpError() {
  return 'Only latin letters and digits allowed. Should start with letter.';
}

RegExp getPasswordRegExp() {
  return RegExp(r'^[A-Za-z0-9!@#%&\*\(\)\+\-_]+$');
}

String getPasswordRegExpError() {
  return 'Only latin letters, digits and !@#%&*()+-_ allowed';
}

String enumToString(Object? o) => o.toString().split('.').last;

T enumFromString<T>(String key, List<T> values) => values.firstWhere((v) => key == enumToString(v));

String getMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

Future<void> sleep(int milliseconds) {
  return Future.delayed(Duration(milliseconds: milliseconds), () => {});
}

String generateRandomString(int len) {
  var r = Random();
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

bool get canUseConnectivityPlugin {
  if (kIsWeb) return true;
  if (Platform.isAndroid) return true;
  if (Platform.isIOS) return true;
  if (Platform.isMacOS) return true;
  return false;
}

String getPlatformName() {
  if (kIsWeb) return 'web';
  if (Platform.isAndroid) return 'android';
  if (Platform.isIOS) return 'ios';
  if (Platform.isMacOS) return 'macos';
  if (Platform.isWindows) return 'windows';
  if (Platform.isLinux) return 'linux';
  return 'other';
}

/// Platform helpers.
/// In Web we can not use 'dart:io' "Platform"
bool get isIOS {
  if (kIsWeb) return false;
  return Platform.isIOS;
}

bool get isAndroid {
  if (kIsWeb) return false;
  return Platform.isAndroid;
}

bool get isMacOS {
  if (kIsWeb) return false;
  return Platform.isMacOS;
}

bool get isWindows {
  if (kIsWeb) return false;
  return Platform.isWindows;
}

bool get isLinux {
  if (kIsWeb) return false;
  return Platform.isLinux;
}

bool get isWeb {
  return kIsWeb;
}

bool get isMobile {
  return (isIOS || isAndroid) ? true : false;
}

Future<void> showConfirmDialog(
  BuildContext context,
  String title,
  String text,
  String buttonText,
  FutureVoidCallback onPressed,
) async {
  showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title, style: Ts.bold20(Config.blackColor)),
      content: Text(text, style: Ts.text16(Config.blackColor)),
      actions: [
        CupertinoDialogAction(
          child: Text('Cancel', style: Ts.text18(Colors.blueAccent)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: Text(buttonText, style: Ts.text18(Config.redColor)),
          onPressed: () async {
            await onPressed();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
