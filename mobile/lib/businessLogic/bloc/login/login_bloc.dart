import 'package:bloc/bloc.dart';
import 'package:mobile/common/bloc/form_submission_status.dart';
import 'package:mobile/data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    
    if (event is LoginUserNameChanged) {

      yield state.copyWith(username: event.username);

    } else if (event is LoginPasswordChanged) {

      yield state.copyWith(password: event.password);

    } else if (event is LoginSubmitted) {
      // submission button clicked.
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
