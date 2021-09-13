part of 'new_lesson_bloc.dart';

abstract class NewLessonState extends Equatable {
  const NewLessonState();

  @override
  List<Object> get props => [];
}

class NewLessonInitial extends NewLessonState {}

class NewLessonLoadingState extends NewLessonState {}

class NewLessonFailedState extends NewLessonState {}

class NewLessonSuccessState extends NewLessonState {}
