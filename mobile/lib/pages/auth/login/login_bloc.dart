import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/pages/auth/auth_repository.dart';
import 'package:mobile/pages/auth/form_submission_status.dart';
import 'package:mobile/pages/auth/login/login_event.dart';
import 'package:mobile/pages/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {

      yield state.copyWith(username: event.username);
      
    } else if (event is LoginPasswordChanged) {

      yield state.copyWith(password: event.password);

    } else if (event is LoginSubmitted) {

      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepository.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
        
      }
    }
  }
}
