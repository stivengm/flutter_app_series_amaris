part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OpenLogin extends LoginEvent {
  final bool? openLogin;
  OpenLogin(this.openLogin);
}

class Login extends LoginEvent {
  final bool isLogged;
  Login(this.isLogged);
}

class ChangeNameLogin extends LoginEvent {
  final String name;
  ChangeNameLogin(this.name);
}

class ChangePasswordLogin extends LoginEvent {
  final String password;
  ChangePasswordLogin(this.password);
}

class LogOut extends LoginEvent {
  final String name;
  final String password;
  LogOut({ required this.name, required this.password});
}