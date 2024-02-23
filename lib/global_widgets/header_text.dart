import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final bool isBig;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;

  const HeaderText({
    Key? key,
    required this.text,
    this.isBig = true,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fontSizeVal = fontSize ?? (isBig ? 30.0 : 15.0);
    final fontWeightVal =
        fontWeight ?? (isBig ? FontWeight.w700 : FontWeight.w500);
    final colorVal = color ??
        (isBig
            ? Theme.of(context).textTheme.bodyLarge!.color
            : Theme.of(context).textTheme.bodyMedium!.color);

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSizeVal,
        fontWeight: fontWeightVal,
        color: colorVal,
      ),
      textAlign: textAlign,
    );
  }
}
