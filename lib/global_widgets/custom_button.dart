import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final bool isOutline;
  final bool wrap;
  final double elevation;
  final Widget? child;
  final bool disabled;
  final bool isLoading;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.isOutline = false,
    this.wrap = false,
    this.elevation = 0.0,
    this.child,
    this.disabled = false,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double btnSize = 49.0;
    final br = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    );

    final contentColor = textColor ??
        (isOutline ? Theme.of(context).primaryColor : Colors.white);

    final btnText = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: prefixIcon != null,
          child: Icon(
            prefixIcon,
            color: contentColor,
          ),
        ),
        Visibility(
          visible: prefixIcon != null,
          child: const SizedBox(width: 10.0),
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: contentColor,
            fontSize: 17,
          ),
        ),
        Visibility(
          visible: suffixIcon != null,
          child: const SizedBox(width: 10.0),
        ),
        Visibility(
          visible: suffixIcon != null,
          child: Icon(
            suffixIcon,
            color: contentColor,
          ),
        ),
      ],
    );

    final btnContent = Visibility(
      visible: !isLoading,
      replacement: const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 2,
        ),
      ),
      child: btnText,
    );

    final materialBtn = SizedBox(
      width: isLoading ? 58.0 : null,
      child: MaterialButton(
        shape: isLoading
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )
            : br,
        height: btnSize,
        color: color ?? Theme.of(context).primaryColor,
        elevation: elevation,
        onPressed: disabled
            ? null
            : isLoading
                ? null
                : onPressed,
        disabledColor: const Color(0xFFC5D8F7),
        child: child ?? btnContent,
      ),
    );

    final outlineBtn = OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color ?? Theme.of(context).primaryColor),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 49.0,
        child: child ?? btnContent,
      ),
    );

    return isOutline ? outlineBtn : materialBtn;
  }
}
