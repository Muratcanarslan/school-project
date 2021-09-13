class EducationInfo {
  final String name;
  final String to;
  final String from;
  final String educationDetails;

  EducationInfo({
    required this.name,
    required this.to,
    required this.from,
    required this.educationDetails,
  });

  EducationInfo.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        to = parsedJson['to'],
        from = parsedJson['from'],
        educationDetails = parsedJson['educationDetails'];
}

List<EducationInfo> jsonToEducationInfos(Map<String, dynamic> list) {
  List<EducationInfo> educationList = List.empty(growable: true);
/*
  for (var item in list) {
    Future.delayed(Duration.zero, () async {
      DocumentSnapshot result = await item.get();
      print(" DATA ${result.data().runtimeType}");
      educationList.add(
        EducationInfo.fromJson(result.data() as Map<String, dynamic>),
      );
    });
  }
  */
  educationList.add(EducationInfo.fromJson(list));
  return educationList;
}
