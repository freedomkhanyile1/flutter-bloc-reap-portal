class AuthRepository {
  Future<void> login() async {
    // TODO Integration with Azure B2C for App Authentication.
    await Future.delayed(Duration(seconds: 5));

    print("Logged in");
  }
}
