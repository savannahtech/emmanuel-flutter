import 'package:flutter/material.dart';

import 'loading_overlay.dart';

class BaseView extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget body;
  final Widget? fab;
  final FloatingActionButtonLocation? fabLocation;
  final bool isLoading;
  final double appBarElevetion;
  final Color? backgroundColor;

  const BaseView({
    super.key,
    this.title,
    this.actions,
    required this.body,
    this.fab,
    this.fabLocation,
    this.isLoading = false,
    this.appBarElevetion = 0,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          elevation: appBarElevetion,
          actions: actions,
        ),
        backgroundColor: backgroundColor,
        body: body,
        floatingActionButton: fab,
        floatingActionButtonLocation: fabLocation,
      ),
    );
  }
}
