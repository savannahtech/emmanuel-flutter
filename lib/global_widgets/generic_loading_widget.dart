import 'package:flutter/material.dart';

import '../utils/utils.dart';

class GenericLoadingWidget extends StatelessWidget {
  const GenericLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils.lightDarkColor(
      light: Colors.grey,
      dark: Colors.grey.withOpacity(0.1),
    );
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: color,
      ),
      title: Container(
        margin: const EdgeInsets.only(right: 50),
        height: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(right: 100, top: 5),
        height: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      trailing: Column(
        children: [
          Container(
            // margin: EdgeInsets.only(top: 12),
            height: 20,
            width: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
