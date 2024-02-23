import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart' as lo;

class LoadingOverlay extends StatefulWidget {
  final bool isLoading;
  final Widget child;
  const LoadingOverlay({
    Key? key,
    this.isLoading = false,
    required this.child,
  }) : super(key: key);

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return lo.LoadingOverlay(
      color: Colors.black.withOpacity(0.3),
      isLoading: widget.isLoading,
       progressIndicator: Container(
        padding: const EdgeInsets.all(15),
        child: const SizedBox(
          height: 40,
          width: 40,
          child: Center(
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}
