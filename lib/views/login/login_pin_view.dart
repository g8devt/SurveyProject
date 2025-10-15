import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../bloc/login_bloc/login_bloc.dart';
import '../../utilities/_utils.dart';
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
                                  SizedBox(height: height(context) * .05),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(title: 'Enter PIN', fontSize: 25, textColor: Colors.white, fontWeight: FontWeight.bold),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 50.0),
                                                child: CustomText(title: 'Enter your pin code for authentication', fontSize: 13, textColor: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Gap(50),
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
                                      ],
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
