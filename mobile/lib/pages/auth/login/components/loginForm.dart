import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/locale/constants/constants.dart';
import 'package:mobile/locale/constants/theme_constants.dart';
import 'package:mobile/pages/auth/login/login_bloc.dart';
import 'package:mobile/pages/auth/login/login_event.dart';
import 'package:mobile/pages/auth/login/login_state.dart';
import 'package:mobile/shared/widgets/formWidgets/default_button.dart';

import '../../form_submission_status.dart';

class LoginForm extends StatefulWidget {
  LoginForm({key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); // Localize Key
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
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
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? LinearProgressIndicator(
                color: kPrimaryColor,
                backgroundColor: Colors.white,
              )
            : DefaultButton(
                btnLabel: "Sign in",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
              );
      },
    );
  }

  Widget _buildPasswordFormField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.75),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(
              Icons.lock_outline,
              color: kPrimaryColor,
            ),
          ),
          validator: (value) =>
              state.isValidPassword ? null : 'Password is too short',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(password: value),
              ),
        );
      },
    );
  }

  Widget _buildUsernameFormField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Username",
            hintText: "Enter username or ID #",
            labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.75),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(
              Icons.person_outline,
              color: kPrimaryColor,
            ),
          ),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is to short',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginUsernameChanged(username: value),
              ),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
