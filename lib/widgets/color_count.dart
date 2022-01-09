import 'package:color_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color defaultColorlight = const Color(0xff7165e3);

class ColorCount extends StatelessWidget {
  const ColorCount({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      fillColor: Colors.white,
      onPressed: onPressed,
      child: TextWidget(
        text: text,
        fontsize: 15,
        color: defaultColorlight,
      ),
    );
  }
}
