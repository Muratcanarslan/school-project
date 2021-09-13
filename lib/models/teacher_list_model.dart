import 'enums/lesson_type.dart';
import 'enums/teacher_type.dart';

class TeacherListModel {
  final int teacherId;
  final String teacherName;
  final String profilePictureUrl;
  final String country;
  final String nativeLanguage;
  final double price;
  final TeacherType teacherType;
  final List<LessonType> lessonTypes;
  final double averageRate;

  TeacherListModel({
    required this.teacherId,
    required this.teacherName,
    required this.profilePictureUrl,
    required this.country,
    required this.nativeLanguage,
    required this.price,
    required this.teacherType,
    required this.lessonTypes,
    required this.averageRate,
  });

  TeacherListModel.fromJson(Map<String, dynamic> parsedJson)
      : teacherId = parsedJson['teacherId'] as int,
        teacherName = parsedJson['teacherName'],
        profilePictureUrl = parsedJson['profilePictureUrl'],
        country = parsedJson['country'],
        nativeLanguage = parsedJson['nativeLanguage'],
        price = parsedJson['price'] as double,
        teacherType = jsonToTeacherType(parsedJson['teacherType']),
        lessonTypes = jsonToLessonType(parsedJson['lessonTypes']),
        averageRate = parsedJson['averageRate'] as double;
}
