import 'package:flutter/material.dart';

class TwoOverlappingWidgets extends StatelessWidget {
  const TwoOverlappingWidgets({
    required List<Widget> options,
    Key? key,
  })  : assert(options.length >= 2),
        this.options = options,
        super(key: key);

  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        Align(alignment: Alignment.centerRight, child: options[1]),
        Align(alignment: Alignment.centerLeft, child: options[0]),
      ],
    );
  }
}
