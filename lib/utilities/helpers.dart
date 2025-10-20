
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
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

/// Show SnackBar --------------------------------------------------------------
void showSnackBar(BuildContext context, {
  required String message,
  required Color backgroundColor,
}) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: GoogleFonts.poppins(
        color: Colors.white,
      ),
    ),
    duration: const Duration(seconds: 3),
    action: null,
    backgroundColor: backgroundColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSnackBarNormal(BuildContext context, {required String message}) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: GoogleFonts.poppins(
        color: Colors.white,
      ),
    ),
    duration: const Duration(seconds: 3),
    action: null,
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSnackBarError(BuildContext context, {required String message}) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    ),
    duration: const Duration(seconds: 3),
    action: null,
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/// Show Toast -----------------------------------------------------------------
void showToast({required String message, required Color backgroundColor}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: backgroundColor,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
  );
}

void showToastNormal({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.green,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
  );
}

void showToastError({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.red,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
  );
}