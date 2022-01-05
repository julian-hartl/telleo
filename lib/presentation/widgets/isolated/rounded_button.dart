import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.borderRadius = 20.0,
    this.onTap,
    this.child,
    this.padding = const EdgeInsets.all(0),
    this.color,
    required this.flex,
  }) : super(key: key);

  final double borderRadius;
  final VoidCallback? onTap;
  final Widget? child;
  final EdgeInsets padding;
  final Color? color;
  final bool flex;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(this.borderRadius);
    return InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: flex
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: _buildBody(borderRadius)),
                ],
              )
            : _buildBody(borderRadius));
  }

  Widget _buildBody(BorderRadius borderRadius) {
    return Container(
      padding: padding,
      child: child,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
      ),
    );
  }
}
