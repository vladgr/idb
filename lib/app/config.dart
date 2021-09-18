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

  static const Color gray33Color = Color.fromRGBO(33, 33, 33, 1);
  static const Color gray108Color = Color.fromRGBO(108, 108, 108, 1);
  static const Color gray125Color = Color.fromRGBO(125, 125, 125, 1);
  static const Color gray222Color = Color.fromRGBO(222, 222, 222, 1);
  static const Color gray243Color = Color.fromRGBO(243, 243, 243, 1);

  // Loaded from json config on start
  static late final String apiUrl;
  static late final String sentryDSN;
  static late final String bucketUrl;

  // API endpoints
  static final apiLoginUrl = '$apiUrl/v1/auth/login';
  static final apiProfileUrl = '$apiUrl/v1/profile';
  static final apiTagsUrl = '$apiUrl/v1/idb/tags';
  static final apiItemsUrl = '$apiUrl/v1/idb/items';
  static final apiItemUrl = '$apiUrl/v1/idb/items/<guid>';
  static final apiSignUploadUrl = '$apiUrl/v1/idb/sign_s3_upload';
  static final apiUsersUrl = '$apiUrl/v1/idb/users';
}
