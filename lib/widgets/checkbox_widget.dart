import 'package:flutter_users/style.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  CheckboxWidget({Key key}) : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              checkboxValue = !checkboxValue;
            });
          },
          child: checkboxValue
              ? Icon(
                  Icons.radio_button_checked,
                  color: Style.colorDanger,
                  size: 30,
                )
              : Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.grey,
                  size: 30,
                ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
