import 'package:logger/logger.dart';

import 'package:app_log/src/models/log_tag.dart';
export 'package:app_log/src/models/log_tag.dart';

typedef LogMessage = dynamic;

class AppLog {
  AppLog._(this._logger);

  static AppLog? _instance;
  final Logger _logger;

  static AppLog init({
    LogOutput? output,
    LogPrinter? printer,
    Level level = Level.info,
  }) {
    return _instance ??= AppLog._(
      Logger(
        output: output ?? ConsoleOutput(),
        printer: printer ?? PrettyPrinter(
          methodCount: 0,
          printTime: true,
        ),
        level: level,
      ),
    );
  }

  static AppLog get I {
    assert(_instance != null, 'AppLog.init() must be called first');
    return _instance!;
  }

  void d(LogTag tag, LogMessage message) {
    _logger.d('[${tag.name}] $message');
  }

  void i(LogTag tag, LogMessage message) {
    _logger.i('[${tag.name}] $message');
  }

  void w(LogTag tag, LogMessage message) {
    _logger.w('[${tag.name}] $message');
  }

  void e(
      LogTag tag,
      LogMessage message, {
        Object? error,
        StackTrace? trace,
      }) {
    _logger.e(
      '[${tag.name}] $message',
      error: error,
      stackTrace: trace,
    );
  }

  void f(LogTag tag, LogMessage message) {
    _logger.f('[${tag.name}] $message');
  }
}