import 'package:flutter_users/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/profile_page.dart';
import 'pages/register_page.dart';

class Routes {
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String profilePage = '/profilePage';

  static Route<dynamic> generate(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case loginPage:
        return RouterTransition(builder: (_) => LoginPage());
      case registerPage:
        return RouterTransition(builder: (_) => RegisterPage());
      case profilePage:
        return RouterTransition(builder: (_) => ProfilePage());
    }
    return null;
  }
}

class RouterTransition<T> extends MaterialPageRoute<T> {
  RouterTransition({WidgetBuilder builder, RouteSettings settings}) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse) return super.buildTransitions(context, animation, secondaryAnimation, child);
    return FadeTransition(opacity: animation, child: child);
  }
}
