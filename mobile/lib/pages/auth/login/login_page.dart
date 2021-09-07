import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/pages/auth/auth_repository.dart';
import 'package:mobile/pages/auth/login/components/loginBody.dart';
import 'package:mobile/pages/auth/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/log_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Sign in",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
