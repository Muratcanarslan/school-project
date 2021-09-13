import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schoolproject/models/teacher_details_model.dart';
import 'package:schoolproject/repositories/teacher_details_repository.dart';

part 'teacher_details_event.dart';
part 'teacher_details_state.dart';

class TeacherDetailsBloc
    extends Bloc<TeacherDetailsEvent, TeacherDetailsState> {
  TeacherDetailsBloc() : super(TeacherDetailsInitial());

  TeacherDetailsRepository repository = TeacherDetailsRepository();

  @override
  Stream<TeacherDetailsState> mapEventToState(
    TeacherDetailsEvent event,
  ) async* {
    if (event is FetchTeacherEvent) {
      yield* _mapFetchTeacherEventToState(event);
    }
  }

  Stream<TeacherDetailsState> _mapFetchTeacherEventToState(
      FetchTeacherEvent event) async* {
    yield TeacherDetailsLoadingState();
    try {
      final model =
          await repository.fetchTeacherDetailsModelFunction(event.teacherId);
      yield TeacherDetailsLoadedState(model: model);
    } catch (e) {
      yield TeacherDetailsErrorState();
      print("Teacher Details Error state $e");
    }
  }
}
