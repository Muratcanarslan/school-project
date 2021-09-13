import 'package:schoolproject/models/enums/lesson_type.dart';

class PaymentScreenArguments {
  final int teacherId;
  final DateTime date;
  final LessonType lessonType;
  final String hour;

  PaymentScreenArguments(
      {required this.teacherId,
      required this.date,
      required this.hour,
      required this.lessonType});
}
