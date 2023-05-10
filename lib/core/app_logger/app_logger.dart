import 'package:logger/logger.dart';

var _logger = Logger();

enum LogType { verbose, debug, info, warning, error, wtf, nothing }

class AppLogger {
  static void log(dynamic message,
      {LogType logType = LogType.debug,
      dynamic error,
      StackTrace? stackTrace}) {
    // _logger.log(_logTypeToLogLevel(logType), message, error, stackTrace);
  }

  static void logError(dynamic message,
      {dynamic error, StackTrace? stackTrace}) {
    _logger.log(Level.error, message, stackTrace);
  }
}
