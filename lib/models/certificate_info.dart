class CertificateInfo {
  final String name;
  final String to;
  final String from;
  final String certificateDetails;

  CertificateInfo({
    required this.name,
    required this.to,
    required this.from,
    required this.certificateDetails,
  });

  CertificateInfo.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        to = parsedJson['to'],
        from = parsedJson['from'],
        certificateDetails = parsedJson['certificateDetails'];
}

List<CertificateInfo> jsonToCertificateInfos(Map<String, dynamic> list) {
  List<CertificateInfo> certificateList = List.empty(growable: true);
  /*
  for (DocumentReference item in list) {
    Future.delayed(Duration.zero, () async {
      DocumentSnapshot result = await item.get();
      print(" DATA ${result.data().runtimeType}");
      certificateList.add(
        CertificateInfo.fromJson(result.data() as Map<String, dynamic>),
      );
    });
  }*/
  certificateList.add(CertificateInfo.fromJson(list));
  return certificateList;
}
