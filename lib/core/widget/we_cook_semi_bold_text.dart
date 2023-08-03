import 'package:flutter/material.dart';

class WeCookSemiBoldText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final TextAlign align;
  const WeCookSemiBoldText({
    super.key,
    required this.title,
    this.fontSize = 14,
    this.color = const Color(0xFF272727),
    this.align = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: fontSize, color: color),
    );
  }
}
