
import 'package:flutter/material.dart';

import '../../utilities/_utils.dart';
import '../../utilities/colors.dart';

class LoadCircleAvatar extends StatelessWidget {
  const LoadCircleAvatar({
    super.key,
    required this.imageUrl,
    this.errorBGColor,
    this.iconColor,
    this.radius,
    this.visible = true,
    this.margin = EdgeInsets.zero,
  });

  final String imageUrl;
  final Color? errorBGColor;
  final Color? iconColor;
  final double? radius;
  final bool visible;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: margin,
        child: CircleAvatar(
          radius: radius,
          backgroundImage: imageUrl.isNotEmpty
              ? NetworkImage(imageUrl)
              : null,
          child: imageUrl.isEmpty
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: errorBGColor ?? primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    color: iconColor ?? Colors.white,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
