import 'package:nfc_data_logger/utils/utils.dart';

import '../global_widgets/bottom_sheets/base.bs.dart';
import 'package:flutter/material.dart';

class BottomSheetService {
  static Future show({
    required BuildContext context,
    required Widget body,
    String? title,
    MainAxisSize mainAxisSize = MainAxisSize.min,
    bool showControl = true,
    EdgeInsets padding = const EdgeInsets.all(20.0),
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Utils.lightDarkColor(
        light: Colors.black87,
        dark: Colors.black87,
      ),
      builder: (BuildContext context) {
        return BaseBottomSheet(
          title: title,
          body: body,
          mainAxisSize: mainAxisSize,
          showControl: showControl,
          padding: padding,
        );
      },
    );
  }

  hide(context) {
    Navigator.pop(context);
  }
}
