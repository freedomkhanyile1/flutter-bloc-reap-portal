import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/auth/login/components/loginView.dart';
  
class LoginPage extends StatelessWidget {
  static String routeName = "/log_in";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: LoginView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,
    );
  }
}
