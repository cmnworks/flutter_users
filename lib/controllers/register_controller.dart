import 'dart:convert';
import 'package:flutter_users/pages/register_page.dart';
import 'package:flutter_users/routes.dart';
import 'package:flutter_users/services/api_service.dart';
import 'package:flutter_users/services/validation_service.dart';
import 'package:flutter_users/widgets/dialog_widget.dart';
import 'package:flutter_users/widgets/overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  ApiService apiService = ApiService();
  ValidationService validationService = ValidationService();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _confirmPassword;

  void onClickRouteToLogin(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.loginPage);
  }

  void onSavedEmail(String value) {
    this._email = value;
  }

  void onSavedPassword(String value) {
    this._password = value;
  }

  void onSavedConfirmPassword(String value) {
    this._confirmPassword = value;
  }

  String validatorEmail(String value) {
    return this.validationService.email(value) ? null : 'Invalid email address';
  }

  String validatorPassword(String value) {
    return this.validationService.password(value) ? null : 'Should have special characters and digits';
  }

  String validatorConfirmPassword(String value) {
    return this.validationService.confirmPassword(value, password: this._password) ? null : "Confirm password doesn't match";
  }

  void onClickRegister(BuildContext context) {
    this.formKey.currentState.save();
    if (!this.formKey.currentState.validate()) {
      return;
    }
    OverlayWidget.controller.show();
    this.apiService.register(email: this._email, password: this._password, onRegister: this.onRegister);
  }

  void onRegister(http.Response response) {
    Map<dynamic, dynamic> body = json.decode(response.body);
    if (body['id'] == null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        showDialog(
          context: RegisterPage.context,
          builder: (BuildContext context) => DialogWidget(
            message: body['message'],
            buttonText: 'Login Now',
            onTap: this.onTap,
          ),
        );
      });
    } else {}
  }

  void onTap() {
    OverlayWidget.controller.hide();
    Navigator.pop(RegisterPage.context);
    Navigator.of(RegisterPage.context).pushNamed(Routes.loginPage);
  }
}
