import 'package:flutter/material.dart';

import 'header_with_action.dart';

class GroupTile extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final double bottomMargin;
  final EdgeInsetsGeometry? padding;
  final double? separatorHeight;
  final String? actionText;
  final VoidCallback? onAction;

  const GroupTile({
    super.key,
    this.title,
    required this.children,
    this.bottomMargin = 20,
    this.padding = EdgeInsets.zero,
    this.separatorHeight = 4,
    this.actionText = "See all",
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final br = BorderRadius.circular(18.0);
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            HeaderWithAction(
              title: title!,
              actionText: actionText,
              onAction: onAction,
            ),
          Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: br,
              color: Colors.white,
            ),
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: children.length,
              itemBuilder: (_, i) => children[i],
              separatorBuilder: (_, i) => SizedBox(height: separatorHeight),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
