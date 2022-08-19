// import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmissionSuccess>(_onFormSubmitted);
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        username: event.username,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  Future<void> _onFormSubmitted(
      FormSubmissionSuccess event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        username: state.username,
        password: state.password,
        // status: state.status,
      ),
    );
  }
}
