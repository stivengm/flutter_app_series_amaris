part of 'login_bloc.dart';

class LoginState {
  final bool? openLogin;
  final bool? isLogged;
  final String? name;
  final String? password;

  LoginState({
    this.openLogin = false,
    this.isLogged = false,
    this.name = '',
    this.password = '',
  });

  LoginState copyWith({
    bool? openLogin,
    bool? isLogged,
    String? name,
    String? password,
  }) => LoginState(
    openLogin: openLogin ?? this.openLogin,
    isLogged: isLogged ?? this.isLogged,
    name: name ?? this.name,
    password: password ?? this.password
  );
}



class LoginInitial extends LoginState { }
