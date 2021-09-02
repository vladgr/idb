import 'package:flutter/material.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/constants/enums.dart';
import 'package:idb/app/services/ts.dart';

class ScaffoldService {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void createAlert(String text, {AlertType type: AlertType.success, int seconds: 3}) {
    var color;

    switch (type) {
      case AlertType.success:
        color = Config.primaryColor;
        break;
      case AlertType.error:
        color = Config.redColor;
        break;
      case AlertType.warning:
        color = Config.yellowColor;
        break;
      case AlertType.info:
        color = Colors.blueAccent;
        break;
      default:
        color = Config.primaryColor;
    }

    final snack = SnackBar(
      content: Text(text, style: Ts.text16(Colors.white)),
      duration: Duration(seconds: seconds),
      backgroundColor: color,
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'CLOSE',
        onPressed: () {
          this.scaffoldKey.currentState!.hideCurrentSnackBar();
        },
      ),
    );

    this.scaffoldKey.currentState!.showSnackBar(snack);
  }
}
