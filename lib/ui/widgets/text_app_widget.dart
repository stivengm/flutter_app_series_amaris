import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  const TextApp({ Key? key, this.text, this.color, this.fontWeight, this.fontSize, this.textAlign }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
      textAlign: textAlign,
    );
  }
}