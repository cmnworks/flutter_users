import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatefulWidget {
  static OverlayController controller = OverlayController();
  @override
  OverlayWidgetState createState() => OverlayWidgetState();
}

class OverlayWidgetState extends State<OverlayWidget> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  bool isShow = false;
  Widget child = Container();

  @override
  void initState() {
    this.setAnimationController();
    OverlayWidget.controller.addState(this);
    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  void setAnimationController() {
    this.animationController = new AnimationController(
      vsync: this,
    );
  }

  Future<void> show() async {
    await this.animationController.fling(velocity: -1.0).then((_) {
      setState(() {
        this.isShow = true;
      });
    });
  }

  Future<void> hide() async {
    await this.animationController.fling(velocity: -1.0).then((_) {
      setState(() {
        this.isShow = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return this.isShow
        ? AbsorbPointer(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.2),
                padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Center(
                  child: new CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )))
        : Container();
  }
}

class OverlayController {
  OverlayWidgetState state;

  void addState(OverlayWidgetState state) {
    this.state = state;
  }

  Future<void> show() async {
    await this.state.show();
  }

  Future<void> hide() async {
    await this.state.hide();
  }
}
