import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:survey_project/utilities/import.dart';
import 'package:survey_project/views/dashboard/dashboard_view.dart';
import 'package:survey_project/views/widgets/_widget.dart';

import '../../bloc/login_bloc/login_bloc.dart';
import '../../utilities/_utils.dart';
import '../../utilities/colors.dart';
import '../widgets/custom_pin_textfield.dart';
import '../widgets/custom_text.dart';

class LoginPinView extends StatefulWidget {
  const LoginPinView({super.key});

  @override
  State<LoginPinView> createState() => _LoginPinViewState();
}

class _LoginPinViewState extends State<LoginPinView> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) async {
        if (didPop) return;
      },
      child: Stack(
        children: [
          Image.asset(Assets.imgBG2, fit: BoxFit.fill, width: double.infinity, height: double.infinity),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {},
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: true, // allow scrolling when keyboard pops
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SafeArea(
                  child: Column(
                    children: [
                      // scrollable content
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.8),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height(context) * .35),
                                  Expanded(
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Gap(50),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                            child: CustomText(title: 'Enter PIN', fontSize: 18, textColor: Colors.black, fontWeight: FontWeight.normal),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                CustomPinTextField(textController: _pinController, width: isTablet ? 200.r : 220.r, onCompleted: (String? value) {}),
                                                const SizedBox(height: 20),
                                              ],
                                            ),
                                          ),
                                          CustomButton(
                                            title: 'LOGIN',
                                            buttonColor: secondaryColor,
                                            borderRadius: 25,
                                            onTap: () {
                                              routes.pushAndRemoveUntilNav(context, widget: DashboardView());
                                            },
                                            buttonWidth: width(context) * .4,
                                          ),
                                          SizedBox(height: height(context) * .1),
                                          CustomText(title: 'Security Notice', fontSize: 12, textColor: Colors.red, fontWeight: FontWeight.bold),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 45.0),
                                            child: CustomText(
                                              title: 'This is a government-secured portal. Access by unauthorized users is strictly prohibited and actively monitored',
                                              fontSize: 12,
                                              textColor: Colors.red,
                                              fontWeight: FontWeight.normal,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
