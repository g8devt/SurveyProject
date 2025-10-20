import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_project/utilities/colors.dart';
import 'package:survey_project/views/dashboard/dashboard_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_project/views/widgets/_widget.dart';

import '../../bloc/common/loading_cubit.dart';
import '../../bloc/post_bloc/post_bloc.dart';
import '../../utilities/import.dart';

import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/form_dropdown_button.dart';

class SurveyForm extends StatefulWidget {
  final String gender;

  const SurveyForm({required this.gender, super.key});

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();


  String? selectedCivilStatus;

  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) async {
        if (didPop) return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              if (currentStep == 2) {
                setState(() => currentStep = 1);
              } else {
                routes.pushAndRemoveUntilNav(context, widget: const DashboardView());
              }
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: RichText(
            text: TextSpan(
              text: 'Health Survey ',
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: 'RABAE – 18–59 YEARS OLD.',
                  style: GoogleFonts.poppins(color: Colors.blue.shade800, fontWeight: FontWeight.w500, fontSize: 13),
                ),
              ],
            ),
          ),
        ),

        body: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostLoginLoadingState) {
              context.read<LoadingCubit>().emitSetValue(true);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      7,
                      (index) => Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          height: 4,
                          decoration: BoxDecoration(color: index == 0 ? tertiaryColor : Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Part header
                  Text("Part 1 of 7", style: GoogleFonts.poppins(color: Colors.grey.shade700, fontSize: 13)),
                  const SizedBox(height: 5),
                  Text(
                    "Pagkakakilanlan",
                    style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  const SizedBox(height: 20),

                  // Form fields (using your stateless widgets)
                  BorderedTextField(hint: "Pangalan", controller: nameController, borderColor: Colors.grey,),
                  const Gap(10),
                  BorderedTextField(hint: "Edad", controller: ageController, borderColor: Colors.grey,),
                  const Gap(10),
                  BorderedTextField(hint: "Kaarawan (MM/DD/YY)", controller: birthdateController, borderColor: Colors.grey,),
                  const Gap(10),
                  BorderedTextField(hint: "Tirahan", controller: addressController, borderColor: Colors.grey,),
                  const Gap(10),

                  // Dropdown (status)
                  CustomText(title: "Status", fontSize: 12, textColor: Colors.grey, fontWeight: FontWeight.w500, margin: const EdgeInsets.only(top: 10, bottom: 5)),
                  FormCivilStatusPicker(
                    value: selectedCivilStatus,
                    isHideDropdownSearchData: true,
                    hasUnderline: false,
                    hasFullBorder: true,
                    buttonStylePadding: EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (value) {
                      setState(() {
                        selectedCivilStatus = value;
                      });
                    },
                  ),
                  const Gap(10),
                  BorderedTextField(hint: "Relihiyon", controller: religionController, borderColor: Colors.grey,),
                  const Gap(10),
                  BorderedTextField(hint: "Weight (kg)", controller: weightController, borderColor: Colors.grey,),
                  const Gap(10),
                  BorderedTextField(hint: "Height (ft)", controller: heightController, borderColor: Colors.grey,),
                  const Gap(10),
                  BorderedTextField(hint: "Blood Type", controller: bloodTypeController, borderColor: Colors.grey,),
                  const Gap(30),
                  // NEXT Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          currentStep = 2;
                        });
                      },
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
