import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../config/config.dart';

class AlertService {
  void show(
    String? message, {
    bool success = true,
    bool info = false,
    IconData? icon,
    Color? backgroundColor,
  }) {
    Color infoColor = const Color(0xFF2196F3);
    Color successColor = const Color(0xFF00E676);
    Color errorColor = const Color(0xFFFF5252);

    IconData infoIcon = Icons.sentiment_neutral;
    IconData successIcon = Icons.sentiment_very_satisfied;
    IconData errorIcon = Icons.sentiment_very_dissatisfied;

    showTopSnackBar(
      AppConfig.navigatorKey.currentState!.overlay!,
      CustomSnackBar.success(
        message: message ?? "",
        icon: Icon(
          icon ??
              (info
                  ? infoIcon
                  : success
                      ? successIcon
                      : errorIcon),
          color: const Color(0x15000000),
          size: 120,
        ),
        backgroundColor: backgroundColor ??
            (info
                ? infoColor
                : success
                    ? successColor
                    : errorColor),
      ),
      displayDuration: const Duration(seconds: 2),
    );
  }
}
