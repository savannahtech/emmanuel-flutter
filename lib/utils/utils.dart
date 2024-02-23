import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../config/config.dart';

class Utils {
  static Color lightDarkColor({
    required Color light,
    required Color dark,
  }) {
    if (Theme.of(AppConfig.currentContext).brightness == Brightness.light) {
      return light;
    } else {
      return dark;
    }
  }

  static void log(dynamic message) {
    Logger().d(message);
  }

  // Date and Time
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String formatDay(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }

  static String formatDateFromString(String dateTime) {
    return formatDate(DateTime.parse(dateTime));
  }

  static String formatDateTimeFromString(String dateTime) {
    return formatDateTime(DateTime.parse(dateTime));
  }
}
