import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utilities/assets.dart';
import '../../utilities/helpers.dart';
import '../../utilities/import.dart';
import '../widgets/custom_text.dart';
import 'form.dart';

class SurveryView extends StatefulWidget {
  const SurveryView({super.key});

  @override
  State<SurveryView> createState() => _SurveryViewState();
}

class _SurveryViewState extends State<SurveryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Image.asset(Assets.appLogo, width: 120, height: 25, fit: BoxFit.fill),
            const Gap(10),
            CustomText(title: 'Health Survey', fontSize: 18, fontWeight: FontWeight.w600),
            const Gap(10),
            CustomText(title: 'Select Gender', fontSize: 15, fontWeight: FontWeight.w600),
            const Gap(10),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      routes.pushNav(context, widget: SurveyForm(gender: 'MALE',));
                    },
                    child: Image.asset(Assets.icSurveyMale, width: width(context) * .9, fit: BoxFit.fill),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {
                      routes.pushNav(context, widget: SurveyForm(gender: 'FEMALE',));
                    },
                    child: Image.asset(Assets.icSurveyFemale, width: width(context) * .9, fit: BoxFit.fill),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
