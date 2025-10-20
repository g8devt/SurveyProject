import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text.dart'; // keep this if you use CustomText

// ─────────────────────────────────────────────
// 1. Underline Text Field
// ─────────────────────────────────────────────
class UnderlineTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const UnderlineTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2.0),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 2. Bordered Text Field
// ─────────────────────────────────────────────
class BorderedTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final IconData? icon;
  final Color backgroundColor;
  final Color borderColor;

  const BorderedTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: borderColor,  fontSize: 15, ),
        filled: true,
        fillColor: backgroundColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        prefixIcon: icon != null ? Icon(icon, color: borderColor) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: borderColor, width: .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 3. Labeled Text Field (uses BorderedTextField inside)
// ─────────────────────────────────────────────
class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hint;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: label,
          fontSize: 12,
          textColor: Colors.grey,
          fontWeight: FontWeight.w500,
          margin: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 5),
        ),
        BorderedTextField(
          hint: hint ?? label,
          controller: controller,
        ),
      ],
    );
  }
}
