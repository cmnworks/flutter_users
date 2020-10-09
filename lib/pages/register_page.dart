import 'package:flutter_users/controllers/register_controller.dart';
import 'package:flutter_users/pages/login_page.dart';
import 'package:flutter_users/style.dart';
import 'package:flutter_users/widgets/button_widget.dart';
import 'package:flutter_users/widgets/overlay_widget.dart';
import 'package:flutter_users/widgets/text_widget.dart';
import 'package:flutter_users/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static BuildContext context;
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController controller = RegisterController();

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
                    'Register',
                    fontSize: 40,
                    color: Style.colorWhite,
                  ),
                  TextWidget(
                    'Now',
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
          children: <Widget>[
            TextWidget(
              "Already have an account?",
              color: Style.colorBlack.withOpacity(0.6),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 4),
                child: InkWell(
                  child: TextWidget(
                    'Log in',
                    color: Style.colorDanger,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onTap: () {
                this.controller.onClickRouteToLogin(RegisterPage.context);
              },
            )
          ],
        ));
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
                validator: this.controller.validatorPassword,
                suffixIcon: Icons.lock,
              ),
              Style.sizedH15,
              TextfieldWidget(
                hintText: 'Confirm Password',
                onSaved: this.controller.onSavedConfirmPassword,
                validator: this.controller.validatorConfirmPassword,
                obscureText: true,
                suffixIcon: Icons.lock_open,
              ),
              Style.sizedH30,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: ButtonWidget(
                    text: "Register",
                    onPressed: () {
                      this.controller.onClickRegister(context);
                    }),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    RegisterPage.context = context;
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
