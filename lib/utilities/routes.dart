
import 'package:flutter/material.dart';

class Routes {

  Future<void> pushNav(BuildContext context, {required Widget widget}) async {
    Future.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
        ),
      );
    });
  }

  Future<void> pushReplacementNav(BuildContext context, {required Widget widget}) async {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
        ),
      );
    });
  }

  Future<void> pushAndRemoveUntilNav(BuildContext context, {required Widget widget}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widget),
            (route) => false,
      );
    });
  }

  // Future<dynamic> rootViewEnd(BuildContext context) {
  //   return Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(
  //       builder: (context) => const RootView(selectedIndex: 0),
  //     ), (_) => false,
  //   );
  // }

}