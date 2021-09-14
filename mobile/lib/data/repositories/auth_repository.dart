import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class AuthRepository {
// TODO move all the KEYS to .env file
  static final Config config = new Config(
    tenant: "d27737c1-e825-4d09-8b4c-0b5571fb6010",
    clientId: "8f60de46-8e70-429f-b016-8810752b2cd2",
    scope: "openid profile offline_access",
    redirectUri: "https://login.live.com/oauth20_desktop.srf ",
  );

  final AadOAuth oauth = AadOAuth(config);
  Future<void> login() async {
    try {
      await oauth.login();
      var accessToken = await oauth.getAccessToken();
      print(accessToken);
      print("Logged in");
    } catch (e) {
      print(e);
      throw Exception("Failed to login");
    }
  }
}
