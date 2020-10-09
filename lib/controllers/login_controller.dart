import 'dart:convert';
import 'package:flutter_users/pages/login_page.dart';
import 'package:flutter_users/pages/profile_page.dart';
import 'package:flutter_users/pages/register_page.dart';
import 'package:flutter_users/routes.dart';
import 'package:flutter_users/services/api_service.dart';
import 'package:flutter_users/services/validation_service.dart';
import 'package:flutter_users/widgets/dialog_widget.dart';
import 'package:flutter_users/widgets/overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  ApiService apiService = ApiService();
  ValidationService validationService = ValidationService();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  void onClickRouteToRegister(BuildContext context) {
    Navigator.of(LoginPage.context).pushNamed(Routes.registerPage);
  }

  void onSavedEmail(String value) {
    this._email = value;
  }

  void onSavedPassword(String value) {
    this._password = value;
  }

  String validatorEmail(String value) {
    return this.validationService.email(value) ? null : 'Invalid email address';
  }

  void onClickLogin(BuildContext context) {
    if (!this.formKey.currentState.validate()) {
      return;
    }
    OverlayWidget.controller.show();
    this.formKey.currentState.save();
    this.apiService.authenticate(email: this._email, password: this._password, onAuth: this.onAuth);
  }

  void onAuth(http.Response response) {
    Map<dynamic, dynamic> body = json.decode(response.body);
    if (body['id'] == null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        showDialog(
          context: LoginPage.context,
          builder: (BuildContext context) => DialogWidget(
            message: body['message'],
            onTap: this.onTap,
          ),
        );
      });
    } else {
      Navigator.push(
        LoginPage.context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  void onTap() {
    OverlayWidget.controller.hide();
    Navigator.pop(LoginPage.context);
  }
}
