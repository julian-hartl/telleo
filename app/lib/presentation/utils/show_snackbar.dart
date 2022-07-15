import 'package:flutter/material.dart';

Future<void> showErrorSnackbar(BuildContext context,
    {required String message}) {
  const duration = Duration(seconds: 4);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Theme.of(context).colorScheme.onError),
    ),
    backgroundColor: Theme.of(context).colorScheme.error,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
  return Future.delayed(duration);
}
