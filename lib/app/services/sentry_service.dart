import 'package:flutter/foundation.dart';
import 'package:idb/app/config.dart';
import 'package:sentry/sentry.dart';

class SentryService {
  final _sentry = SentryClient(SentryOptions(dsn: Config.sentryDSN));

  Future<void> reportError(dynamic error, dynamic stackTrace) async {
    if (kDebugMode) {
      print('Caught error: $error');
      print(stackTrace);
    } else {
      _sentry.captureException(error, stackTrace: stackTrace);
    }
  }

  Future<void> logInfo(String message) async {
    _sentry.captureEvent(
      SentryEvent(
        message: SentryMessage(message),
        level: SentryLevel.info,
      ),
    );
  }

  Future<void> logWarning(String message) async {
    _sentry.captureEvent(
      SentryEvent(
        message: SentryMessage(message),
        level: SentryLevel.warning,
      ),
    );
  }

  Future<void> logError(String message) async {
    _sentry.captureEvent(
      SentryEvent(
        message: SentryMessage(message),
        level: SentryLevel.error,
      ),
    );
  }
}
