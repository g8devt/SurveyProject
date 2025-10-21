import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/form_dropdown_button.dart';

class SurveyPart2 extends StatelessWidget {

  final String? selectedHousehold;
  final String? selectedHusbandWife;
  final String? selectedDisability;
  final String? selectedHouseholdDisability;
  final ValueChanged<String?> onCivilStatusChanged;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const SurveyPart2({
    super.key,
    required this.selectedHousehold,
    required this.selectedHusbandWife,
    required this.selectedDisability,
    required this.selectedHouseholdDisability,
    required this.onCivilStatusChanged,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Tungkol sa Pamilya",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const Gap(20),

        // BACK Button
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            onTap: onBack,
            buttonColor: Colors.grey,
            title: "BACK",
            borderRadius: 10,
            buttonHeight: 40,
            fontSize: 16,
            textColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        // NEXT Button
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            onTap: onNext,
            buttonColor: tertiaryColor,
            title: "NEXT",
            borderRadius: 10,
            buttonHeight: 40,
            fontSize: 16,
            textColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
