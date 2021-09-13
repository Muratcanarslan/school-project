part of 'teacher_details_bloc.dart';

abstract class TeacherDetailsState extends Equatable {
  const TeacherDetailsState();

  @override
  List<Object> get props => [];
}

class TeacherDetailsInitial extends TeacherDetailsState {}

class TeacherDetailsLoadingState extends TeacherDetailsState {}

class TeacherDetailsLoadedState extends TeacherDetailsState {
  final TeacherDetailsModel model;
  TeacherDetailsLoadedState({
    required this.model,
  });

  @override
  List<Object> get props => [model];
}

class TeacherDetailsErrorState extends TeacherDetailsState {}
