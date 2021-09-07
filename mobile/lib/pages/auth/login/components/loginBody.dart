import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/locale/constants/constants.dart';
import 'package:mobile/locale/constants/icon_constants.dart';
import 'package:mobile/pages/auth/auth_repository.dart';
import 'package:mobile/pages/auth/login/components/loginForm.dart';
import 'package:mobile/pages/auth/login/login_bloc.dart';
 
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
                children: <Widget>[
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
                  LoginForm(),
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
}
