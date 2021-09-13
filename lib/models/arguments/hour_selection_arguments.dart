import 'package:schoolproject/models/enums/lesson_type.dart';

class HourSelectionArguments {
  final int teacherId;
  final DateTime date;
  final LessonType lessonType;

  HourSelectionArguments({
    required this.teacherId,
    required this.date,
    required this.lessonType,
  });
}
