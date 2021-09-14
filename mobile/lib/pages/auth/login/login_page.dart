import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/repositories/index.dart';
import 'package:mobile/pages/auth/login/components/loginBody.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/sign_in";

  static final Config config = new Config(
    tenant: "d27737c1-e825-4d09-8b4c-0b5571fb6010",
    clientId: "8f60de46-8e70-429f-b016-8810752b2cd2",
    scope: "openid profile offline_access",
    redirectUri: "https://login.live.com/oauth20_desktop.srf ",
  );

  final AadOAuth oauth = AadOAuth(config);
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

  void showError(dynamic ex, BuildContext context) {
    showMessage(ex.toString(), context);
  }

  void showMessage(String text, BuildContext context) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(BuildContext context) async {
    try {
      await oauth.login();
      var accessToken = await oauth.getAccessToken();
      showMessage(
          'Logged in successfully, your access token: $accessToken', context);
    } catch (e) {
      showError(e, context);
    }
  }

  void logout(BuildContext context) async {
    await oauth.logout();
    showMessage('Logged out', context);
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
