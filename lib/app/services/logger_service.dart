import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:idb/app/services/sentry_service.dart';
import 'package:get_it/get_it.dart';

class LoggerService {
  void _printToConsole(Object obj) {
    if (kDebugMode) {
      if (obj is List) {
        for (var x in obj) {
          log(x.toString());
        }
        log('-------');
      } else {
        log(obj.toString());
      }
    }
  }

  String _getMessage(Object obj) {
    String msg = '';

    if (obj is List) {
      for (var x in obj) {
        msg += x.toString();
        msg += ' | ';
      }
    } else {
      msg = obj.toString();
    }
    return msg;
  }

  void _sendToSentry(Object obj, String level) {
    if (kReleaseMode) {
      var sentry = GetIt.I<SentryService>();

      if (level == 'info') {
        sentry.logInfo(_getMessage(obj));
      } else if (level == 'error') {
        sentry.logError(_getMessage(obj));
      }
    }
  }

  void debug(Object obj) {
    _printToConsole(obj);
  }

  void info(Object obj) {
    _printToConsole(obj);
    _sendToSentry(obj, 'info');
  }

  void error(Object obj) {
    _printToConsole(obj);
    _sendToSentry(obj, 'error');
  }
}
