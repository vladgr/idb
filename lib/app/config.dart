import 'package:flutter/material.dart';

class Config {
  static String get appVersion {
    return '1.0.1';
  }

  static const Color primaryColor = Color(0xFF5E41D6);
  static const Color blackColor = Color(0xFF323438);
  static const Color grayColor = Color(0xFFA9A9A9);
  static const Color greenColor = Color(0xFF16D76F);
  static const Color redColor = Color(0xFFF31629);
  static const Color grayLightColor = Color(0xFFFAFAFA);
  static const Color grayBgColor = Color(0xFFE5E5E5);
  static const Color yellowColor = Color(0xFFFFB72B);

  static const apiUrl = 'https://api.desit.ru';

  static const sentryDSN = 'https://3943fc97b137429a8731e09b700e6091@o343321.ingest.sentry.io/5938944';

  static const apiCheckTokenUrl = '$apiUrl/v1/auth/check_token';
  static const apiLoginUrl = '$apiUrl/v1/auth/login';
  static const apiTagsUrl = '$apiUrl/v1/idb/tags';
  static const apiItemsUrl = '$apiUrl/v1/idb/items';
  static const apiItemUrl = '$apiUrl/v1/idb/items/<guid>';
}
