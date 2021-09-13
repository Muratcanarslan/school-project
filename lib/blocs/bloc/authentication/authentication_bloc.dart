import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schoolproject/repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  UserRepository _repository = UserRepository();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is IsAuthenticatedEvent) {
      yield* _mapIsAuthenticatedEventToState();
    }
  }

  Stream<AuthenticationState> _mapIsAuthenticatedEventToState() async* {
    yield AuthenticatedLoadingState();
    bool? response = await _repository.isAuthenticatedFunction();
    print("respnst $response");

    if (response) {
      yield AuthenticatedState();
    } else if (response == false) {
      yield NonAuthenticatedState();
    } else {
      print("keke");
      yield AuthenticatedLoadingState();
    }
  }
}
