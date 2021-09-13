class CommentItem {
  final String profilePictureUrl;
  final String date;
  final String userName;
  final String comment;
  final int rate;

  CommentItem({
    required this.profilePictureUrl,
    required this.date,
    required this.userName,
    required this.comment,
    required this.rate,
  });

  CommentItem.fromJson(Map<String, dynamic> parsedJson)
      : profilePictureUrl = parsedJson['profilePictureUrl'],
        date = parsedJson['date'],
        userName = parsedJson['userName'],
        comment = parsedJson['comment'],
        rate = parsedJson['rate'] as int;
}

List<CommentItem> jsonToCommentItems(Map<String, dynamic> list) {
  List<CommentItem> commentList = List.empty(growable: true);
/*
  for (DocumentReference item in list) {
    Future.delayed(Duration.zero, () async {
      DocumentSnapshot result = await item.get();
      print(" DATA ${result.data().runtimeType}");
      commentList.add(
        CommentItem.fromJson(result.data() as Map<String, dynamic>),
      );
    });
  }*/
  commentList.add(CommentItem.fromJson(list));
  return commentList;
}
