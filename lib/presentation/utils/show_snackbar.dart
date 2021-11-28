import 'package:advance_notification/advance_notification.dart';
import 'package:flutter/material.dart';

Future<void> showErrorSnackbar(BuildContext context,
    {required String message}) {
  const duration = Duration(seconds: 4);
  AdvanceSnackBar(
    message: message,
    mode: "ADVANCE",
    duration: duration,
    type: "ERROR",
    textSize: 20,
    isIcon: true,
  ).show(context);
  return Future.delayed(duration);
}
