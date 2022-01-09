import 'package:color_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
    required this.width,
    required this.onPressed,
    required this.height,
    required this.color,
    required this.istapped,
  }) : super(key: key);
  final double width;
  final double height;
  final Function() onPressed;
  final Color? color;
  final bool istapped;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: MaterialButton(
        color: widget.color,
        onPressed: widget.onPressed,
        child: const TextWidget(text: 'Pick a color', fontsize: 20),
      ),
    );
  }
}
