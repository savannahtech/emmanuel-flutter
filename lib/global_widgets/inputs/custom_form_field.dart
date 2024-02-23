import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? label;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final TextEditingController? controller;
  final bool enabled;
  final double? height;
  final int maxLines;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool isOutlineBorder;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final double bottomPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int? maxLength;
  final Iterable<String>? autofillHints;
  final Color? fillColor;
  final bool? filled;

  const CustomFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.label,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.isPasswordField = false,
    this.controller,
    this.enabled = true,
    this.height,
    this.maxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.isOutlineBorder = false,
    this.inputFormatters = const [],
    this.validator,
    this.onChanged,
    this.bottomPadding = 20.0,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.maxLength,
    this.autofillHints,
    this.fillColor,
    this.filled = true,
  });
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.grey.shade100,
      ),
    );

    final underlineBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.grey.shade100,
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.bottomPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.label != null,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                "${widget.label}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          TextFormField(
            autofillHints: widget.autofillHints,
            validator: widget.validator,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              labelText: widget.labelText,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.withOpacity(0.7),
                fontSize: 14,
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFFA8ADB7),
                fontSize: 14,
              ),
              prefixIcon: widget.prefixIcon ??
                  (widget.icon != null
                      ? Icon(
                          widget.icon,
                        )
                      : null),
              enabledBorder:
                  widget.isOutlineBorder ? outlineBorder : underlineBorder,
              disabledBorder:
                  widget.isOutlineBorder ? outlineBorder : underlineBorder,
              border: widget.isOutlineBorder ? outlineBorder : underlineBorder,
              focusedBorder:
                  widget.isOutlineBorder ? outlineBorder : underlineBorder,
              errorBorder:
                  widget.isOutlineBorder ? outlineBorder : underlineBorder,
              focusedErrorBorder:
                  widget.isOutlineBorder ? outlineBorder : underlineBorder,
              suffixIcon: widget.isPasswordField
                  ? _buildPasswordFieldVisibilityToggle()
                  : widget.suffixIcon,
              filled: widget.filled ?? true,
              fillColor: widget.fillColor ?? Colors.grey.withOpacity(0.15),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            keyboardType: widget.keyboardType,
            cursorColor: Theme.of(context).primaryColor,
            obscureText: widget.isPasswordField ? _obscureText : false,
            controller: widget.controller,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            focusNode: widget.focusNode,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
