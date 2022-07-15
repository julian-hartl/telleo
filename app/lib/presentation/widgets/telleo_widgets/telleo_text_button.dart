import 'package:flutter/material.dart';

import '../isolated/theme_builder.dart';
import 'telleo_button.dart';

enum TelloTextButtonTheme { normal, reversed }

class TelleoTextButton extends StatelessWidget {
  const TelleoTextButton({
    required this.text,
    required this.onPressed,
    this.buttonTheme = TelloTextButtonTheme.normal,
    this.textColor,
    this.background,
    this.padding = const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    Key? key,
    this.flex = false,
    this.isLoading = false,
  }) : super(key: key);

  final TelloTextButtonTheme buttonTheme;
  final String text;
  final VoidCallback onPressed;
  final Color? background;
  final Color? textColor;
  final EdgeInsets padding;
  final bool flex;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(builder: (context, theme) {
      final background = this.background ??
          (buttonTheme == TelloTextButtonTheme.normal
              ? theme.colorScheme.primary
              : theme.colorScheme.primaryVariant);

      final textColor = this.textColor ??
          (buttonTheme == TelloTextButtonTheme.normal
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onBackground);

      return TelleoButton(
        background: background,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: theme.textTheme.button!.copyWith(color: textColor),
              ),
        onPressed: onPressed,
        padding: padding,
        flex: flex,
      );
    });
  }
}
