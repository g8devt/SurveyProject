
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utilities/_utils.dart';
import '../../utilities/colors.dart';

class CustomPinTextField extends StatelessWidget {
  final TextEditingController textController;
  final double? width;
  final double? borderRadius;
  final double? fieldWidth;
  final double? fieldHeight;
  final int length;
  final bool obscureText;
  final bool readOnly;
  final bool visible;
  final EdgeInsets margin;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;

  const CustomPinTextField({
    super.key,
    required this.textController,
    this.width,
    this.borderRadius = 15,
    this.fieldWidth = 50,
    this.fieldHeight = 50,
    this.length = 4,
    this.obscureText = true,
    this.readOnly = false,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onCompleted,
    this.onChanged,
  });

  const CustomPinTextField.otp({
    super.key,
    required this.textController,
    this.width,
    this.borderRadius = 15,
    this.fieldWidth = 45,
    this.fieldHeight = 45,
    this.length = 6,
    this.obscureText = true,
    this.readOnly = false,
    this.visible = true,
    this.margin = EdgeInsets.zero,
    this.onCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: margin,
        child: SizedBox(
          width: width,
          child: PinCodeTextField(
            autoDisposeControllers: false,
            controller: textController,
            appContext: context,
            obscureText: obscureText,
            keyboardType: TextInputType.number,
            length: length,
            readOnly: readOnly,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            enableActiveFill: true,
            cursorColor: primaryColor,
            textStyle: const TextStyle(color: primaryColor),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,

              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              fieldWidth: fieldWidth,
              fieldHeight: fieldHeight,
              activeColor:Colors.black,
              inactiveColor: Colors.black,
              selectedColor: Colors.black,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              selectedFillColor: Colors.white,

            ),
            onCompleted: onCompleted,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
