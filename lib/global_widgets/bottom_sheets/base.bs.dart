import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool isLoading;
  final MainAxisSize mainAxisSize;
  final bool showControl;
  final EdgeInsets padding;

  const BaseBottomSheet({
    Key? key,
    this.title,
    required this.body,
    this.isLoading = false,
    this.mainAxisSize = MainAxisSize.max,
    this.showControl = true,
    this.padding = const EdgeInsets.all(20.0),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EdgeInsets insets = MediaQuery.of(context).viewInsets;
    bool isFull = mainAxisSize == MainAxisSize.max;

    final loading = Visibility(
      visible: isLoading,
      child: SizedBox(
        height: 3,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );

    final control = Visibility(
      visible: showControl,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        height: 5.0,
        width: MediaQuery.of(context).size.width * 0.14,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );

    final header = Visibility(
      visible: title != null,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0, top: isFull ? 20.0 : 0),
        child: Text(
          title ?? "",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
        ),
      ),
    );

    return Padding(
      padding: getCurrentSize(context).height >= 400 ? EdgeInsets.zero : insets,
      // padding: EdgeInsets.all(20),
      child: Container(
        padding: padding,
        child: Column(
          mainAxisSize: mainAxisSize,
          children: [
            control,
            header,
            loading,
            Visibility(
              visible: isFull,
              replacement: body,
              child: Expanded(
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size getCurrentSize(context) {
    var rb = context.findRenderObject();
    if (rb != null) {
      rb = rb as RenderBox;
      return rb.size;
    }

    return Size.zero;
  }
}
