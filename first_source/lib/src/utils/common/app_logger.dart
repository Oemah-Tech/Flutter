import 'package:logger/logger.dart';

class AppLogger {
  static final _settings = Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 2,
          lineLength: 120,
          noBoxingByDefault: true,
          levelColors: {
        Level.info: const AnsiColor.fg(36),
        Level.debug: const AnsiColor.fg(175),
      },
          levelEmojis: {
        Level.info: '✨'
      }));

  static void su(dynamic message) {
    _settings.i(message.toString());
  }

  static void d(dynamic message) {
    _settings.d(message.toString());
  }

  static void w(dynamic message) {
    _settings.w(message.toString());
  }

  static void e(dynamic message) {
    _settings.e(message.toString());
  }
}
