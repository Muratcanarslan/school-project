import 'package:schoolproject/models/enums/lesson_type.dart';

class TeacherCalendarArgument {
  final LessonType lessonType;
  final int teacherId;

  TeacherCalendarArgument({required this.lessonType, required this.teacherId});
}
