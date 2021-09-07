import 'package:mobile/pages/auth/form_submission_status.dart';

class LoginState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  // constructor
  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  // copy with constructor ensures that we always carry over other fields
  //when we deal with a particular field event see (login_event.dart)

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
