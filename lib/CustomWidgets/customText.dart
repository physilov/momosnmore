import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String family;
  final double size;
  final Color colors;
  final FontWeight weight;

  CustomText({@required this.text, this.size, this.colors, this.weight, this.family});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? null, style: TextStyle(fontFamily: family ?? 'Poppins',fontSize: size ?? 14, color: colors ?? Colors.green[800], fontWeight: weight ?? FontWeight.normal),);
  }
}