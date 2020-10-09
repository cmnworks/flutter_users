import 'package:flutter_users/style.dart';
import 'package:flutter_users/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'overlay_widget.dart';

class DialogWidget extends StatelessWidget {
  final String message;
  final String buttonText;
  final Function onTap;

  DialogWidget({this.message, this.buttonText: 'Try Again', this.onTap});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: this._buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2 + 60,
        child: Stack(
          children: [
            _buildBottom(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    this.onTap();
                  },
                  child: Container(padding: EdgeInsets.all(16), alignment: Alignment.centerRight, child: Icon(Icons.close, color: Style.colorText)),
                ),
                TextWidget("Hey!", color: Style.colorDanger, fontSize: 28.0),
                SizedBox(height: 24),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextWidget(this.message, fontSize: 18, maxLines: 2, textAlign: TextAlign.center),
                ),
                SizedBox(height: 30),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Container(
                  height: 70,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                  decoration: new BoxDecoration(
                    color: Style.colorDanger,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextWidget(this.buttonText, color: Colors.white, fontSize: 18),
                ),
                onTap: () {
                  this.onTap();
                },
              ),
            )
          ],
        ));
  }

  Widget _buildBottom() {
    final String assetFile = 'assets/img/dialog.png';
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: new Image.asset(
          assetFile,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
