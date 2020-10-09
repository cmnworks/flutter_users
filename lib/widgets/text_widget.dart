import 'package:flutter_users/style.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextAlign textAlign;
  final TextDecoration decoration;
  final Color color;
  final double fontSize;
  final String text;
  final int maxLines;
  TextWidget(this.text, {this.fontSize: 18.0, this.color, this.decoration, this.textAlign: TextAlign.start, this.maxLines: 1});

  @override
  Widget build(BuildContext context) {
    Color color = this.color == null ? Style.colorText : this.color;
    return Text(this.text,
        textAlign: this.textAlign,
        maxLines: this.maxLines,
        style: TextStyle(fontFamily: 'Roboto', fontSize: this.fontSize, color: color, height: 1.5, letterSpacing: 0.5, decoration: this.decoration));
  }
}
