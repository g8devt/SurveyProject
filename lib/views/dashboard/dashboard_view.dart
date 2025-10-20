import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:survey_project/utilities/import.dart';
import 'package:survey_project/views/survey_form/survery_view.dart';
import 'package:survey_project/views/widgets/_widget.dart';

import '../../utilities/assets.dart';
import '../../utilities/colors.dart';
import '../../utilities/helpers.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Assets.icProfile, width: 30, height: 30, fit: BoxFit.fill),
                      CustomText(title: 'User Name', fontSize: 13),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ],
            ),
            const Gap(10),
            Image.asset(Assets.appLogo, width: 120, height: 25, fit: BoxFit.fill),
            const Gap(10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  width: width(context) * .45,
                  height: 100,
                  decoration: BoxDecoration(color: dashboardBox1Color, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: '0', fontSize: 18, fontWeight: FontWeight.bold),
                      CustomText(title: 'Surveys', fontSize: 11, fontWeight: FontWeight.normal),
                      CustomText(title: 'Synced Today', fontSize: 11, fontWeight: FontWeight.normal),
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  width: width(context) * .45,
                  height: 100,
                  decoration: BoxDecoration(color: dashboardBox2Color, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: '0', fontSize: 18, fontWeight: FontWeight.bold),
                      CustomText(title: 'Surveys', fontSize: 11, fontWeight: FontWeight.normal),
                      CustomText(title: 'Unsynced Today', fontSize: 11, fontWeight: FontWeight.normal),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            CustomText(title: 'Quick Actions', fontSize: 18, fontWeight: FontWeight.w600),
            const Gap(10),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      routes.pushNav(context, widget: SurveryView());
                    },
                    child: Image.asset(Assets.icDashNew, width: width(context) * .9, height: 100, fit: BoxFit.fill),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(Assets.icDashDisaster, width: width(context) * .9, height: 100, fit: BoxFit.fill),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(Assets.icDashSync, width: width(context) * .9, height: 100, fit: BoxFit.fill),
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
