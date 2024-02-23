import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<dynamic> data;
  final dynamic selected;
  final ValueChanged<dynamic> onChanged;
  final String hint;
  final String? label;
  final bool optional;
  final String? Function(dynamic)? validator;
  final String? itemValue;
  final String? itemLabel;
  const CustomDropdown({
    Key? key,
    required this.data,
    required this.selected,
    required this.onChanged,
    this.hint = "Select One",
    this.label,
    this.optional = false,
    this.validator,
    this.itemValue,
    this.itemLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: label != null,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Text(
                    label!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Visibility(
                    visible: optional,
                    child: Text(
                      " (optional)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                enabledBorder: outlineBorder,
                border: outlineBorder,
                focusedBorder: outlineBorder,
                // filled: true,
                // fillColor: Colors.grey.withOpacity(0.08),
                contentPadding: const EdgeInsets.all(12),
              ),
              hint: Text(
                hint,
                style: const TextStyle(fontSize: 13),
              ),
              value: selected,
              onChanged: onChanged,
              isExpanded: true,
              validator: validator,
              items: data.map((dynamic item) {
                dynamic i;
                dynamic v;
                String l;
                try {
                  i = item.toJson();
                  v = i[itemValue];
                  l = i[itemLabel];
                } catch (e) {
                  v = item;
                  l = item;
                }
                return DropdownMenuItem<dynamic>(
                  value: v,
                  child: Text(
                    l,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
