import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idb/app/services/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestService {
  Future<void> init() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');

    channel.setMockMethodCallHandler(
      (MethodCall methodCall) async {
        return '/tmp';
      },
    );

    setupLocator();
  }
}
