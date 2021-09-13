import 'package:flutter/material.dart';

enum LessonType { listening, reading, writing, general }

extension LessonTypeExtension on LessonType {
  Container getLessonTypeIconsWithLessonTypes() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/lesson_type_assets/${this.getLessonTypeToString().toLowerCase()}.png",
            width: 20,
          ),
          Text(
            this.getLessonTypeToString(),
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  String getLessonTypeToString() {
    switch (this) {
      case LessonType.general:
        return "General";
      case LessonType.reading:
        return "Reading";
      case LessonType.listening:
        return "Listening";
      case LessonType.general:
        return "General";
      case LessonType.writing:
        return "Writing";
    }
  }
}

LessonType stringToLessonType(String lessonType) {
  switch (lessonType) {
    case "general":
      return LessonType.general;
    case "writing":
      return LessonType.writing;
    case "listening":
      return LessonType.listening;
    case "reading":
      return LessonType.reading;
    default:
      return LessonType.listening;
  }
}

List<LessonType> jsonToLessonType(List<dynamic> parsedJson) {
  List<LessonType> list = List.empty(growable: true);

  for (var item in parsedJson) {
    list.add(stringToLessonType(item.toString()));
  }
  return list;
}
