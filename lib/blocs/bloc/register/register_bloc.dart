import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schoolproject/repositories/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());
  UserRepository repository = UserRepository();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is NewRegisterEvent) {
      yield* _mapNewRegisterEventToState(event);
    }
  }

  Stream<RegisterState> _mapNewRegisterEventToState(
      NewRegisterEvent event) async* {
    try {
      yield RegisterLoadingState();
      await repository.signUpFunction(event.email, event.password);
      yield RegisterSuccessState();
    } catch (e) {
      print("regsiter $e");
      yield RegisterFailedState();
    }
  }
}
