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
import 'components_form/step_1.dart';
import 'components_form/step_2.dart';

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
  String? selectedHousehold;
  String? selectedHusbandWife;
  String? selectedDisability;
  String? selectedHouseholdDisability;
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
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
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
                  text: '${widget.gender == 'MALE' ? 'LALAKI' : 'BABAE'} – 18–59 YEARS OLD.',
                  style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
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
                  Text("Part $currentStep of 7", style: GoogleFonts.poppins(color: Colors.grey.shade700, fontSize: 13)),
                  const SizedBox(height: 5),

                  // ✅ Extracted Part 1 Widget
                  SingleChildScrollView(
                    child: currentStep == 1
                        ? SurveyPart1(
                            nameController: nameController,
                            ageController: ageController,
                            birthdateController: birthdateController,
                            addressController: addressController,
                            religionController: religionController,
                            weightController: weightController,
                            heightController: heightController,
                            bloodTypeController: bloodTypeController,
                            selectedCivilStatus: selectedCivilStatus,
                            onCivilStatusChanged: (value) {
                              setState(() => selectedCivilStatus = value);
                            },
                            onNext: () {
                              setState(() {
                                currentStep = 2;
                              });
                            },
                          )
                        : SurveyPart2(
                            selectedDisability: selectedDisability,
                            selectedHousehold: selectedHousehold,
                            selectedHouseholdDisability: selectedHouseholdDisability,
                            selectedHusbandWife: selectedHusbandWife,
                            onCivilStatusChanged: (value) {
                              setState(() => selectedCivilStatus = value);
                            },
                            onNext: () {
                              setState(() {
                                currentStep = 2;
                              });
                            },
                            onBack: () {
                              setState(() {
                                currentStep = 1;
                              });
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
