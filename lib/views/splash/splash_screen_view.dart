import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../utilities/_utils.dart';
import '../../utilities/import.dart';
import '../login/login_pin_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  late final FirebaseMessaging _messaging;

  // PushNotification? _notificationInfo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () async {
        routes.pushReplacementNav(context, widget: LoginPinView());
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) async {
        if (didPop) return;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Image.asset(Assets.imgBG1, fit: BoxFit.fill, width: double.infinity, height: double.infinity),
      ),
    );
  }
}
