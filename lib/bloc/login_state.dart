part of 'login_bloc.dart';

class LoginState {
  final String username;
  final String password;
  // final FormzStatus status;

  const LoginState({
    this.username = "",
    this.password = "",
    // this.status = FormzStatus.pure,
  });

  LoginState copyWith({
    String? username,
    String? password,
    // FormzStatus? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      // status: status ?? this.status,
    );
  }
}
