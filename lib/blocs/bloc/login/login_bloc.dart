import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schoolproject/repositories/user_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  UserRepository _repository = UserRepository();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoggedInEvent) {
      yield* _mapLoggedInEventToState(event);
    } else if (event is LoggedOutEvent) {}
  }

  Stream<LoginState> _mapLoggedInEventToState(LoggedInEvent event) async* {
    yield LoggedInLoadingState();
    try {
      await _repository.signInWithCredentialsFunction(
          event.userName, event.password);
      yield LoggedInState();
    } catch (e) {
      print("bu bir error");
      yield LoggedInErrorState();
      print(e.toString());
    }
  }
}
