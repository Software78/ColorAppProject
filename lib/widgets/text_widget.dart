import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
    required this.fontsize,
  }) : super(key: key);

  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontsize,
        color: color,
      ),
    );
  }
}
