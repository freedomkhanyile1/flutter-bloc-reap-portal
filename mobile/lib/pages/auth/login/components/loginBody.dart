import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/businessLogic/bloc/login/index.dart';
import 'package:mobile/common/bloc/index.dart';
import 'package:mobile/data/index.dart';
import 'package:mobile/locale/constants/constants.dart';
import 'package:mobile/locale/constants/icon_constants.dart';
import 'package:mobile/locale/constants/theme_constants.dart';
import 'package:mobile/pages/home/index.dart';
import 'package:mobile/shared/widgets/widgets.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kFieldWidthDefaultSpacing,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            LogoConstants.signinLogo,
                          ),
                        ),
                      ),
                      height: 104,
                    ),
                  ),
                  SizedBox(height: kFieldDefaultSpacing),
                  Text(
                    "Sign in using Active Directory",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: kFieldDefaultSpacing),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      final formStatus = state.formStatus;
                      if (formStatus is SubmissionFailed) {
                        _showSnackBar(context, formStatus.exception.toString());
                      }
                    },
                    builder: (context, state) => _buildLoginBlocButton(),
                  ),
                  SizedBox(height: kFieldDefaultSpacing),
                  SizedBox(
                    height: kFieldHeightDefaultSpacing,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginBlocButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? LinearProgressIndicator(
                color: kPrimaryColor,
                backgroundColor: Colors.white,
              )
            : DefaultButton(
                btnLabel: "Continue",
                press: () {
                  context.read<LoginBloc>().add(LoginSubmitted());
                  Navigator.pushNamed(context, HomePage.routeName);
                },
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
