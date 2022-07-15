import 'package:flutter/material.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({
    Key? key,
    required this.pages,
    required this.currentPage,
  }) : super(key: key);

  final List<Widget> pages;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return pages[currentPage];
  }
}
