part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoggedInEvent extends LoginEvent {
  final String userName;
  final String password;

  LoggedInEvent({
    this.userName = '',
    this.password = '',
  });

  @override
  List<Object> get props => [userName, password];
}

class LoggedOutEvent extends LoginEvent {}
