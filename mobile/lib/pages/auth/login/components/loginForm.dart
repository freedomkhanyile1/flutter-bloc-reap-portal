import 'package:flutter/material.dart';
import 'package:mobile/locale/constants/constants.dart';
import 'package:mobile/shared/widgets/formWidgets/default_button.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); // Localize Key
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildUsernameFormField(),
          SizedBox(
            height: kFieldHeightDefaultSpacing,
          ),
          _buildPasswordFormField(),
          SizedBox(
            height: kFieldHeightDefaultSpacing,
          ),
          DefaultButton(
            btnLabel: "Sign in",
            press: () {},
          ),
        ],
      ),
    );
  }

  TextFormField _buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.75),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock_outline,
        ),
      ),
    );
  }

  TextFormField _buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => username = newValue!,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter username or ID #",
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.75),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.person_outline,
        ),
      ),
    );
  }
}
