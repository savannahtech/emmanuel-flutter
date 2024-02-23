import 'package:flutter/material.dart';
import '../config/config.dart';

class Navigate {
  static NavigatorState? _getCurrentNavState() {
    return AppConfig.navigatorKey.currentState;
  }

  static Future to(
    Widget page, {
    bool fullscreenDialog = false,
  }) {
    var val = _getCurrentNavState()!.push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
        fullscreenDialog: fullscreenDialog,
      ),
    );

    return val;
  }

  static Future toReplaceUntil(Widget page) {
    var val = _getCurrentNavState()!.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
      (route) => false,
    );

    return val;
  }

  static back([dynamic result]) {
    return _getCurrentNavState()!.pop(result);
  }
}
