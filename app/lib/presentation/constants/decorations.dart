import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration outlineInputDecoration(ThemeData theme,
    {required String hint}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(25),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: dimmedColor),
    ),
    focusColor: theme.colorScheme.primary,
    filled: true,
    fillColor: theme.colorScheme.surface,
    hintStyle: theme.textTheme.bodyText2!.copyWith(color: dimmedColor),
    hintText: hint,
  );
}
