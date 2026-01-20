import 'package:logger/logger.dart';

extension LogLevelColor on Level {
  static const String _bold = '\x1B[1m';
  static const String _reset = '\x1B[0m';

  String get coloredName => '$colorCode$_bold${name.toUpperCase()}$_reset';

  String get colorCode =>
      switch (this) {
        Level.all => '\x1B[37m', // White
        Level.verbose => '\x1B[90m', // Gray
        Level.trace => '\x1B[36m', // Cyan
        Level.debug => '\x1B[34m', // Blue
        Level.info => '\x1B[32m', // Green
        Level.warning => '\x1B[33m', // Yellow
        Level.error => '\x1B[31m', // Red
        Level.wtf => '\x1B[91m', // Bright Red
        Level.fatal => '\x1B[91m', // Bright Red
        Level.nothing => '',
        Level.off => '',
      };
}
