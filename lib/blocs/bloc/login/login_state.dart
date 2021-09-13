part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoggedInState extends LoginState {}

class LoggedInErrorState extends LoginState {}

class LoggedInLoadingState extends LoginState {}
