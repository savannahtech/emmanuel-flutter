import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? url;
  final String placeholder;
  final double? radius;
  final String? letter;
  final Color? backgroundColor;
  final double? textSize;

  const CustomCircleAvatar({
    Key? key,
    required this.url,
    this.placeholder = AppImages.placeholder,
    this.radius,
    this.letter,
    this.backgroundColor = Colors.grey,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor:
          url != null && url != "" ? Colors.grey[200] : backgroundColor,
      child: url != null
          ? CachedNetworkImage(
              imageUrl: url!,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => replacement(),
            )
          : letter != null
              ? Center(
                child: Text(
                    letter!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textSize ?? 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              )
              : replacement(),
    );
  }

  Widget replacement() {
    return letter != null
        ? Center(
          child: Text(
              letter!,
              style: TextStyle(
                color: Colors.white,
                fontSize: textSize ?? 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        )
        : Image.asset(placeholder);
  }
}
