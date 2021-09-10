import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/auth/login/login_page.dart';
import 'package:mobile/pages/home/home_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  HomePage.routeName: (context) => HomePage(),
};