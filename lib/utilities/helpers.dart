
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '_utils.dart';

void printDebug(Object? message, {String? title}) {
  if (kDebugMode) {
    if (!isProduction) {
      if (title != null) {
        print('****$title: $message');
      } else {
        print('***$message');
      }
    }
  }
}

/// Screen Size ----------------------------------------------------------------
double height(BuildContext context) {
  final prefHeight = MediaQuery.sizeOf(context).height;
  return prefHeight;
}

double width(BuildContext context) {
  final prefWidth = MediaQuery.sizeOf(context).width;
  return prefWidth;
}

bool get isTablet {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalShortestSide = firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  return logicalShortestSide > 600;
}
