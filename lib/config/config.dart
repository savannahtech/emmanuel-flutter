import 'package:flutter/widgets.dart';

class AppConfig {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get currentContext => navigatorKey.currentContext!;
}
