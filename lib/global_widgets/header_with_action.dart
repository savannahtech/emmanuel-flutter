import 'package:flutter/material.dart';

class HeaderWithAction extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onAction;
  final double bottomMargin;
  const HeaderWithAction({
    super.key,
    required this.title,
    this.actionText = "See all",
    this.onAction,
    this.bottomMargin = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const Spacer(),
          if (onAction != null)
            InkResponse(
              onTap: onAction,
              child: Text(
                actionText!,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
        ],
      ),
    );
  }
}
