import 'package:flutter_users/controllers/login_controller.dart';
import 'package:flutter_users/style.dart';
import 'package:flutter_users/widgets/button_widget.dart';
import 'package:flutter_users/widgets/checkbox_widget.dart';
import 'package:flutter_users/widgets/overlay_widget.dart';
import 'package:flutter_users/widgets/text_widget.dart';
import 'package:flutter_users/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static BuildContext context;
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildHeader() {
    final String assetFile = 'assets/img/header.png';
    return Container(
      width: MediaQuery.of(LoginPage.context).size.width,
      child: new Image.asset(
        assetFile,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 30, bottom: 5),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextWidget(
                    'Welcome',
                    fontSize: 40,
                    color: Style.colorWhite,
                  ),
                  TextWidget(
                    'Login',
                    fontSize: 36,
                    color: Style.colorWhite,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption() {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextWidget(
            "Don't have an account?",
            color: Style.colorBlack.withOpacity(0.6),
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 4),
              child: InkWell(
                child: TextWidget(
                  'Register',
                  color: Style.colorDanger,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            onTap: () {
              this.controller.onClickRouteToRegister(context);
            },
          )
        ],
      ),
    );
  }

  Widget _buildRememberMe() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[CheckboxWidget(), TextWidget('Remember me')],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: this.controller.formKey,
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 45),
            transform: Matrix4.translationValues(0.0, -40.0, 0.0),
          ),
          TextfieldWidget(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            onSaved: this.controller.onSavedEmail,
            validator: this.controller.validatorEmail,
          ),
          Style.sizedH15,
          TextfieldWidget(
            hintText: 'Password',
            obscureText: true,
            onSaved: this.controller.onSavedPassword,
            suffixIcon: Icons.lock,
          ),
          Style.sizedH20,
          this._buildRememberMe(),
          Style.sizedH20,
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: ButtonWidget(
                text: "Log In",
                onPressed: () {
                  this.controller.onClickLogin(context);
                }),
          ),
          Style.sizedH15,
          TextWidget('Forgot Password?'),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginPage.context = context;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              this._buildHeader(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [this._buildWelcomeText(), this._buildForm(), this._buildOption()],
              ),
              OverlayWidget()
            ],
          ),
        )),
      ),
    );
  }
}
