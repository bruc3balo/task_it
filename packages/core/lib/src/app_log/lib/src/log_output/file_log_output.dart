import 'dart:io';

import 'package:logger/logger.dart';

class FileLogOutput extends ConsoleOutput {
  final String path;
  IOSink? _sink;

  FileLogOutput(this.path) {
    _init();
  }

  void _init() {
    final file = File(path);
    _sink = file.openWrite(mode: FileMode.append);
  }

  @override
  void output(OutputEvent event) {
    super.output(event);
    if (_sink == null) return;
    for (var line in event.lines) {
      _sink!.writeln(line);
    }
  }

  void dispose() async {
    await _sink?.flush();
    await _sink?.close();
  }
}