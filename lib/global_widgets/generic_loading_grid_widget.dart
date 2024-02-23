import 'package:flutter/material.dart';

import '../utils/utils.dart';

class GenericLoadingGridWidget extends StatelessWidget {
  const GenericLoadingGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils.lightDarkColor(
      light: Colors.grey,
      dark: Colors.grey.withOpacity(0.1),
    );

    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
        ),
        const SizedBox(height: 10),
        Container(
          height: 15,
          width: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 15,
          width: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
