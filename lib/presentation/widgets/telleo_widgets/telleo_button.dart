import 'package:flutter/material.dart';

import '../isolated/rounded_button.dart';

class TelleoButton extends StatelessWidget {
  const TelleoButton(
      {required this.child,
      required this.onPressed,
      required this.background,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      this.flex = false,
      Key? key})
      : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final Color background;
  final EdgeInsets padding;
  final bool flex;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      flex: flex,
      borderRadius: 15.0,
      child: child,
      color: background,
      onTap: onPressed,
      padding: padding,
    );
  }
}
