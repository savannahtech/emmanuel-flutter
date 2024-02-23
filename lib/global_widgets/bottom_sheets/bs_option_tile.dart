import 'package:flutter/material.dart';

class BsOptionTile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String title;
  final bool visible;

  const BsOptionTile({
    Key? key,
    this.onTap,
    required this.icon,
    required this.title,
    this.visible = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: ListTile(
        onTap: () {
          Navigator.pop(context);
          onTap?.call();
        },
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}
