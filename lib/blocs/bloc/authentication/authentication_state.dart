part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}

class AuthenticatedLoadingState extends AuthenticationState {}

class NonAuthenticatedState extends AuthenticationState {}
