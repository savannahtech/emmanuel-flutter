import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  final Widget loader;
  final bool isLoading;
  final Color? primaryColor;
  final Color? secondaryColor;
  const LoadingWidget({
    Key? key,
    required this.child,
    required this.loader,
    this.isLoading = false,
    this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      replacement: child,
      child: VxShimmer(
        primaryColor: primaryColor ?? Colors.grey.shade300,
        secondaryColor: secondaryColor ?? Colors.grey.shade50,
        child: loader,
      ),
    );
  }
}
