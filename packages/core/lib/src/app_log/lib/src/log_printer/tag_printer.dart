import 'package:app_log/src/utils/log_level_color.dart';
import 'package:logger/logger.dart';

class TagPrinter extends LogPrinter {
  final String? defaultTag;
  final bool includeTimestamp;

  TagPrinter({this.defaultTag, this.includeTimestamp = false});

  static const String _bold = '\x1B[1m';
  static const String _reset = '\x1B[0m';

  @override
  List<String> log(LogEvent event) {
    final rawMessage = event.message?.toString() ?? '';
    final tagMatch = RegExp(r'^\[(.*?)\]').firstMatch(rawMessage);
    final tag = tagMatch?.group(1) ?? defaultTag ?? 'APP';
    final cleanMessage = rawMessage.replaceFirst(RegExp(r'^\[.*?\]\s*'), '');

    final timestamp = includeTimestamp ? '[${DateTime.now().toIso8601String()}] ' : '';

    final color = event.level.colorCode;
    final formattedLine = '$color$timestamp{${event.level.name.toUpperCase()}} - [$tag] - $cleanMessage$_reset';

    final lines = [formattedLine];

    if (event.error != null) {
      lines.add('$color🔴 ${_bold}ERROR$_reset: ${event.error}');
    }

    if (event.stackTrace != null) {
      lines.add('$color📌 ${_bold}STACKTRACE$_reset:\n${event.stackTrace}');
    }

    return lines;
  }
}
