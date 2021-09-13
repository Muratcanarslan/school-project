import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schoolproject/models/teacher_list_model.dart';
import 'package:schoolproject/repositories/teacher_list_repository.dart';

part 'teacher_list_event.dart';
part 'teacher_list_state.dart';

class TeacherListBloc extends Bloc<TeacherListEvent, TeacherListState> {
  TeacherListBloc() : super(TeacherListInitial());

  TeacherListRepository repository = TeacherListRepository();

  @override
  Stream<TeacherListState> mapEventToState(
    TeacherListEvent event,
  ) async* {
    if (event is FetchTeachersEvent) {
      yield* _mapFetchTeachersEventToState();
    }
  }

  Stream<TeacherListState> _mapFetchTeachersEventToState() async* {
    yield TeacherListLoadingState();
    try {
      final result = await repository.fetchTeacherFunction();
      yield TeacherListLoadedState(model: result);
    } catch (e) {
      print(e);
      yield TeacherListErrorState();
    }
  }
}
