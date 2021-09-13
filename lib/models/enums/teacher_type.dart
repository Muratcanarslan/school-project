enum TeacherType { professional, community }

extension TeacherTypeExtension on TeacherType {
  String teacherTypeToString() {
    switch (this) {
      case TeacherType.community:
        return "Community";
      case TeacherType.professional:
        return "Professional";
      default:
        return "";
    }
  }
}

TeacherType jsonToTeacherType(String teacherType) {
  switch (teacherType) {
    case "community":
      return TeacherType.community;
    case 'professional':
      return TeacherType.professional;
    default:
      return TeacherType.professional;
  }
}
