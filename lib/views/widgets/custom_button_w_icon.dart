
import 'package:flutter/material.dart';

import '../../utilities/_utils.dart';
import '../../utilities/colors.dart';
import 'custom_text.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color textColor;
  final Color buttonColor;
  final Color? borderColor;
  final Color? iconColor;
  final double borderRadius;
  final double fontSize;
  final double? elevation;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderWidth;
  final double? iconSize;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final EdgeInsetsGeometry? paddingButton;
  final bool isCustomFont;
  final bool visible;
  final EdgeInsets margin;
  final Function()? onTap;

  const CustomButtonWithIcon({
    super.key,
    required this.title,
    required this.icon,
    this.textColor = Colors.white,
    this.buttonColor = primaryColor,
    this.borderColor,
    this.iconColor,
    this.borderRadius = 10,
    this.fontSize = 15,
    this.elevation,
    this.buttonWidth,
    this.buttonHeight,
    this.borderWidth,
    this.iconSize,
    this.fontWeight = FontWeight.bold,
    this.fontStyle,
    this.fontFamily,
    this.paddingButton,
    this.isCustomFont = true,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  const CustomButtonWithIcon.border({
    super.key,
    required this.title,
    required this.icon,
    this.textColor = primaryColor,
    this.buttonColor = Colors.white,
    this.borderColor = primaryColor,
    this.iconColor,
    this.borderRadius = 10,
    this.fontSize = 15,
    this.elevation,
    this.buttonWidth,
    this.buttonHeight,
    this.borderWidth,
    this.iconSize,
    this.fontWeight = FontWeight.bold,
    this.fontStyle,
    this.fontFamily,
    this.paddingButton,
    this.isCustomFont = true,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: margin,
        child: SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: onTap ?? () {},
            style: ElevatedButton.styleFrom(
              padding: paddingButton,
              backgroundColor: buttonColor,
              elevation: elevation,
              minimumSize: Size(0, 0),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor ?? Colors.white,
                  size: iconSize,
                ),
                SizedBox(width: 5,),
                CustomText(
                  title: title,
                  fontSize: fontSize,
                  textColor: textColor,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                  fontFamily: fontFamily,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  isCustomFont: isCustomFont,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
