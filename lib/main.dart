import 'package:flutter_users/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.generate,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(body: LoginPage()),
      ),
    );
  }
}
