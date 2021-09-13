import 'package:schoolproject/models/education_info.dart';
import 'package:schoolproject/models/enums/lesson_type.dart';
import 'certificate_info.dart';
import 'comment_item.dart';
import 'enums/teacher_type.dart';

class TeacherDetailsModel {
  final int teacherId;
  final String teacherName;
  final bool isFavorite;
  final String profilePictureUrl;
  final String country;
  final List<String> teachedLanguage;
  final String aboutMe;
  final List<String> alsoSpeaks;
  final List<LessonType> lessonTypes;
  final List<CommentItem> comments;
  final double averageRating;
  final Map<int, int> rateStatistics;
  final String teacherAvaibility;
  final List<CertificateInfo> certificates;
  final TeacherType teacherType;
  final List<EducationInfo> education;

  TeacherDetailsModel({
    required this.education,
    required this.teacherId,
    required this.alsoSpeaks,
    required this.teacherName,
    required this.isFavorite,
    required this.profilePictureUrl,
    required this.country,
    required this.teachedLanguage,
    required this.aboutMe,
    required this.lessonTypes,
    required this.comments,
    required this.averageRating,
    required this.rateStatistics,
    required this.teacherAvaibility,
    required this.certificates,
    required this.teacherType,
  });

  TeacherDetailsModel.fromJson(
      Map<String, dynamic> parsedJson,
      Map<String, dynamic> comments,
      Map<String, dynamic> certificates,
      Map<String, dynamic> education)
      : teacherId = parsedJson['teacherId'] as int,
        teacherName = parsedJson['teacherName'],
        isFavorite = parsedJson['isFavorite'],
        profilePictureUrl = parsedJson['profilePictureUrl'],
        country = parsedJson['country'],
        teachedLanguage = jsonToString(parsedJson['teachedLanguage']),
        aboutMe = parsedJson['aboutMe'],
        alsoSpeaks = jsonToString(parsedJson['alsoSpeaks']),
        lessonTypes = jsonToLessonType(parsedJson['lessonTypes']),
        comments = jsonToCommentItems(comments),
        averageRating = parsedJson['averageRating'] as double,
        rateStatistics = parsedJson['rateStatistics'].cast<int, int>(),
        teacherAvaibility = parsedJson['teacherAvaibility'],
        certificates = jsonToCertificateInfos(certificates),
        teacherType = jsonToTeacherType(parsedJson['teacherType']),
        education = jsonToEducationInfos(education);
}

List<String> jsonToString(List<dynamic> list) {
  List<String> stringList = List.empty(growable: true);

  for (var item in list) {
    stringList.add(item.toString());
  }
  return stringList;
}
