import 'package:flutter/material.dart';

class BsButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BsButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      height: 70.0,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
