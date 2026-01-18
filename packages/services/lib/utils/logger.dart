// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

///This class is for all the log in the console related methods

class LogMaster {
  ///this constructor is for ensuring Nobody can create any object of this class

  LogMaster._();

  ///this works similar to log, one advantage you don't need to pass String always here

  ///you can send anything, it will call .toString() and log what you want

  static void info(dynamic data,
      {required String tag, String? loggerName, int stackTraceLevel = 1, bool printLeftLine = true}) {
    final stackTraces = StackTrace.current.toString().split('\n');

    final lines = '$data'.split('\n');

    final body = printLeftLine ? '│${lines.join('\n│')}' : lines.join('\n');

    final List<String> stackTracesLines =
        stackTraceLevel > 1 ? stackTraces.sublist(1, stackTraceLevel + 1) : [stackTraces[stackTraceLevel]];

    final stackTracesBody = '│${stackTracesLines.join('\n│')}';

    final String output = '\n'
        '┌──[$tag]──────────────────────────────────────────────────────────────────────────────────────────\n'
        '$body'
        '\n├┄┄[STACK TRACE]┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄\n'
        '$stackTracesBody\n'
        '└─────────────────────────────────────────────────────────────────────────────────────────────────────\n';

    // if (!kIsWeb) log('$output', name: 'REACTIV LOGGER', level: 0, time: DateTime.now(), sequenceNumber: 10);

    // debugPrint(output, wrapWidth: 100);

    if (kDebugMode) {
      log(output, name: loggerName ?? tag);
    }

    // print(StackTrace.current);

    // log(stackTracesBody);
  }

  static void infoWithoutStackTrace(dynamic data, {required String tag, bool printLeftLine = true}) {
    final lines = '$data'.split('\n');

    final body = printLeftLine ? '│${lines.join('\n│')}' : lines.join('\n');

    final String output = '\n'
        '┌─────────────────────────────────────────────────────────────────────────────────────────────────────\n'
        '$body\n'
        '└─────────────────────────────────────────────────────────────────────────────────────────────────────\n';

    if (!kIsWeb) {
      log(output, name: tag);
    }
  }

  static void prodInfo(dynamic data, {required String tag}) {
    if (!kIsWeb && kDebugMode) {
      log('[$tag] $data');
    }
  }

  static void infoJson(dynamic data) {
    LogMaster.info(prettyJson(data), tag: 'RESPONSE JSON', stackTraceLevel: 4);
  }

  static String prettyJson(dynamic data) {
    try {
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (e) {
      String response = '';
      const int tabCount = 0;
      const String tab = '\t';
      if (data.runtimeType.toString() == 'String') {
        response = '$response ${tab * tabCount}"$data"';
      } else {
        response = '$response ${tab * tabCount}$data';
      }
      return response;
    }
  }
}
