import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/form_dropdown_button.dart';

class SurveyPart1 extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController birthdateController;
  final TextEditingController addressController;
  final TextEditingController religionController;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController bloodTypeController;
  final String? selectedCivilStatus;
  final ValueChanged<String?> onCivilStatusChanged;
  final VoidCallback onNext;

  const SurveyPart1({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.birthdateController,
    required this.addressController,
    required this.religionController,
    required this.weightController,
    required this.heightController,
    required this.bloodTypeController,
    required this.selectedCivilStatus,
    required this.onCivilStatusChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pagkakakilanlan",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),

        // Form fields
        BorderedTextField(hint: "Pangalan", controller: nameController, borderColor: Colors.grey),
        const Gap(10),
        BorderedTextField(hint: "Edad", controller: ageController, borderColor: Colors.grey),
        const Gap(10),
        BorderedTextField(hint: "Kaarawan (MM/DD/YY)", controller: birthdateController, borderColor: Colors.grey),
        const Gap(10),
        BorderedTextField(hint: "Tirahan", controller: addressController, borderColor: Colors.grey),
        const Gap(10),

        // Civil Status dropdown
        FormCivilStatusPicker(
          value: selectedCivilStatus,
          isHideDropdownSearchData: true,
          hasUnderline: false,
          hasFullBorder: true,
          buttonStylePadding: const EdgeInsets.symmetric(horizontal: 0),
          onChanged: onCivilStatusChanged,
        ),
        const Gap(10),
        BorderedTextField(hint: "Relihiyon", controller: religionController, borderColor: Colors.grey),
        const Gap(10),
        BorderedTextField(hint: "Weight (kg)", controller: weightController, borderColor: Colors.grey),
        const Gap(10),
        BorderedTextField(hint: "Height (ft)", controller: heightController, borderColor: Colors.grey),
        const Gap(10),
        BorderedTextField(hint: "Blood Type", controller: bloodTypeController, borderColor: Colors.grey),
        const Gap(30),

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
