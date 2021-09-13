import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schoolproject/models/arguments/payment_screen_arguments.dart';
import 'package:schoolproject/repositories/payment_repository.dart';

part 'new_lesson_event.dart';
part 'new_lesson_state.dart';

class NewLessonBloc extends Bloc<NewLessonEvent, NewLessonState> {
  NewLessonBloc() : super(NewLessonInitial());

  PaymentRepository repository = PaymentRepository();

  @override
  Stream<NewLessonState> mapEventToState(
    NewLessonEvent event,
  ) async* {
    if (event is AddNewLessonEvent) {
      yield* _mapAddNewLessonEventToState(event);
    }
  }

  Stream<NewLessonState> _mapAddNewLessonEventToState(
      AddNewLessonEvent event) async* {
    yield NewLessonLoadingState();

    try {
      await repository.addNewLessonFunction(event.argument);
      yield NewLessonSuccessState();
    } catch (e) {
      print("new lesson $e");
      yield NewLessonFailedState();
    }
  }
}
