import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class Session extends ChangeNotifier {
  // Getter
  static Session get current {
    return AppConfig.currentContext.read<Session>();
  }

  static Session get live {
    return AppConfig.currentContext.watch<Session>();
  }

  // Setter
}
