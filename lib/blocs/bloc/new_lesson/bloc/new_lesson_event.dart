part of 'new_lesson_bloc.dart';

abstract class NewLessonEvent extends Equatable {
  const NewLessonEvent();

  @override
  List<Object> get props => [];
}

class AddNewLessonEvent extends NewLessonEvent {
  final PaymentScreenArguments argument;

  AddNewLessonEvent({required this.argument});
}
