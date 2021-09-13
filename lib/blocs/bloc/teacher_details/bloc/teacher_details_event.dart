part of 'teacher_details_bloc.dart';

abstract class TeacherDetailsEvent extends Equatable {
  const TeacherDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchTeacherEvent extends TeacherDetailsEvent {
  final int teacherId;

  FetchTeacherEvent({required this.teacherId});

  @override
  List<Object> get props => [teacherId];
}
