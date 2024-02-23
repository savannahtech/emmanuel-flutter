import 'package:flutter/material.dart';

import '../global_widgets/loading_widget.dart';

extension StringExtension on String? {
  bool get isNullEmpty => this == null || this == "";
}

extension WidgetExtension on Widget {
  loadingWidget({
    bool isLoading = false,
    required Widget loader,
    Color? primaryColor,
    Color? secondaryColor,
  }) {
    return LoadingWidget(
      loader: loader,
      isLoading: isLoading,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      child: this,
    );
  }
}
