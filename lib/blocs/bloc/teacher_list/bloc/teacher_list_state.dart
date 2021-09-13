part of 'teacher_list_bloc.dart';

abstract class TeacherListState extends Equatable {
  const TeacherListState();

  @override
  List<Object> get props => [];
}

class TeacherListInitial extends TeacherListState {}

class TeacherListLoadingState extends TeacherListState {}

class TeacherListLoadedState extends TeacherListState {
  final List<TeacherListModel> model;

  TeacherListLoadedState({required this.model});

  @override
  List<Object> get props => [model];
}

class TeacherListErrorState extends TeacherListState {}
