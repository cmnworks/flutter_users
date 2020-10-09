import 'package:flutter_users/style.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final Function onSaved;
  final Function validator;
  final TextInputType keyboardType;
  final IconData suffixIcon;

  TextfieldWidget(
      {this.obscureText: false, this.hintText, this.onSaved, this.validator, this.keyboardType: TextInputType.name, this.suffixIcon: Icons.email});

  @override
  Widget build(BuildContext context) {
    InputBorder errorBorder =
        OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: const BorderSide(color: Colors.red, width: 0.0));

    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: TextFormField(
          keyboardType: this.keyboardType,
          validator: this.validator,
          onSaved: this.onSaved,
          initialValue: '',
          style: TextStyle(fontSize: 17.0, fontFamily: 'Roboto'),
          obscureText: this.obscureText,
          decoration: InputDecoration(
            suffixIcon: new Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: new Icon(
                this.suffixIcon,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
            hintText: this.hintText,
            hintStyle: TextStyle(color: Style.colorBlack.withOpacity(0.3)),
            fillColor: Style.colorBackground.withOpacity(0.85),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            ),
            focusedErrorBorder: errorBorder,
            errorBorder: errorBorder,
          ),
        ));
  }
}
