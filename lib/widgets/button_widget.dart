import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonWidget({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: this.onPressed,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[Color(0xFF82BCE0), Color(0xFFBCB4D8)]),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                this.text,
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
