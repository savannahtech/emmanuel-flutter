import 'package:flutter/material.dart';

class CustomSwitcher extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final List<String> options;
  final String initialValue;
  const CustomSwitcher({
    Key? key,
    required this.onChanged,
    required this.options,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  String activeMenu = "";

  @override
  void initState() {
    super.initState();
    activeMenu = widget.initialValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        children: widget.options.map((e) => _buildWidget(e)).toList(),
      ),
      // child: ,
    );
  }

  Widget _buildWidget(String title) {
    bool active = title == activeMenu;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          activeMenu = title;
          setState(() {});
          widget.onChanged(activeMenu);
        },
        child: Container(
          decoration: BoxDecoration(
            color: active ? Colors.white : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: active
                    ? Theme.of(context).textTheme.bodyLarge!.color
                    : Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
