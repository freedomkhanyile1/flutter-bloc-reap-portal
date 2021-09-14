// @dart=2.9

import 'package:flutter/material.dart';
import 'package:mobile/locale/theme.dart';
import 'package:mobile/pages/auth/login/login_page.dart';
 
import 'app/routes.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: LoginPage.routeName,
      routes: routes,
    );
  }
}