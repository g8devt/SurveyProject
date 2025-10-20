import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_project/views/dashboard/dashboard_view.dart';

import '../../bloc/common/loading_cubit.dart';
import '../../bloc/post_bloc/post_bloc.dart';
import '../../utilities/import.dart';

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key});

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController suffixController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController residenceController = TextEditingController();

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();


  String? _selectedProvince;
  String? _selectedRegion;
  String? _selectedCity;
  String? _selectedBarangay;
  bool _isAgreed = false;


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
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              if (currentStep == 2) {
                setState(() => currentStep = 1);
              } else {
                routes.pushAndRemoveUntilNav(context, widget: DashboardView());
              }
            },
            icon: const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: Colors.black,
              ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                child: Expanded(
                  child: currentStep == 1
                      ? SafeArea(
                    child: Container(),
                  )
                      : Container(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
