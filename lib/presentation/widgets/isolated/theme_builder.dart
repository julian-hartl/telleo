import 'package:flutter/material.dart';

typedef ThemeBuilder = Widget Function(BuildContext context, ThemeData theme);

class ThemeProvider extends StatelessWidget {
  const ThemeProvider({required this.builder, Key? key}) : super(key: key);

  final ThemeBuilder builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, Theme.of(context));
  }
}
