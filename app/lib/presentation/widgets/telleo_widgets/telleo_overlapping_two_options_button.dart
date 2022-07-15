import 'package:flutter/material.dart';

import '../isolated/theme_builder.dart';
import 'telleo_text_button.dart';

class TelleoOverlappingTwoOptionsButton extends StatelessWidget {
  const TelleoOverlappingTwoOptionsButton(
      {required this.onOption1,
      required this.onOption2,
      required this.options,
      Key? key})
      : super(key: key);

  final List<String> options;
  final VoidCallback onOption1;
  final VoidCallback onOption2;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(builder: (context, theme) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TelleoTextButton(
            text: options[0],
            onPressed: onOption1,
          ),
          Transform.translate(
            offset: const Offset(20, 0),
            child: TelleoTextButton(
              text: options[1],
              onPressed: onOption2,
              buttonTheme: TelloTextButtonTheme.reversed,
            ),
          ),
        ],
      );
    });
  }
}
