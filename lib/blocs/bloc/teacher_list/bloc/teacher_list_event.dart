part of 'teacher_list_bloc.dart';

abstract class TeacherListEvent extends Equatable {
  const TeacherListEvent();

  @override
  List<Object> get props => [];
}

class FetchTeachersEvent extends TeacherListEvent {}
