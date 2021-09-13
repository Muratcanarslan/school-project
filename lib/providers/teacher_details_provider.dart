import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolproject/models/certificate_info.dart';
import 'package:schoolproject/models/comment_item.dart';
import 'package:schoolproject/models/education_info.dart';
import 'package:schoolproject/models/enums/lesson_type.dart';
import 'package:schoolproject/models/enums/teacher_type.dart';
import 'package:schoolproject/models/teacher_details_model.dart';

FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class TeacherDetailsProvider {
  Future<TeacherDetailsModel> fetchTeacherDetailsFunction(int teacherId) async {
    final result = await _fireStore.collection('teacherDetails').get();
    //print(result.docs[0].data()['education'][0]);

    DocumentReference commentReference =
        result.docs[teacherId].data()['comments'][0];

    print(result.docs[teacherId].data()['comments'].length);

    DocumentSnapshot commentData = await commentReference.get();

    print(commentData.data());

    DocumentReference certificateReference =
        result.docs[teacherId].data()['certificates'][0];

    DocumentSnapshot certificateData = await certificateReference.get();

    DocumentReference educationReference =
        result.docs[teacherId].data()['education'][0];

    DocumentSnapshot educationData = await educationReference.get();

    return TeacherDetailsModel.fromJson(
        result.docs[teacherId].data(),
        commentData.data() as Map<String, dynamic>,
        certificateData.data() as Map<String, dynamic>,
        educationData.data() as Map<String, dynamic>);

    /*
    functions();
    return teacherDetailsMocData[0] as TeacherDetailsModel;
    */
  }
}

Future<TeacherDetailsModel> functions() async {
  final result = await _fireStore.collection('teacherDetails').get();
  print(result.docs[0].data());
  return TeacherDetailsModel.fromJson(result.docs[0].data(), {}, {}, {});

  /*final int teacherId;
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
  final comments = await _fireStore.collection('teacherDetails').get();
  DocumentReference a = comments.docs[0].data()['comments'];
  final b = await a.get();
  print(b.data());


  _fireStore.collection("teacherDetails").doc('0').set({
    'teacherId': 0,
    'teacherName': "John Doe",
    'isFavorite': false,
    'profilePictureUrl':
        'https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg',
    'country': 'england',
    'teachedLanguage': ['england', 'france'],
    'aboutMe':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'alsoSpeaks': ['turkey'],
    'lessonTypes': ['writing', 'listening'],
    'averageRating': 3.7,
    'rateStatistics': {1: 2, 2: 4, 3: 5, 4: 2, 5: 100},
    'teacherAvaibility': '',
    'teacherType': 'community',
  });
  */
}

Map<int, TeacherDetailsModel> teacherDetailsMocData = {
  0: TeacherDetailsModel(
    alsoSpeaks: [
      "english",
    ],
    aboutMe:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    averageRating: 3.4,
    certificates: [
      CertificateInfo(
          name: "This is a Certificate",
          to: "2022",
          from: "1998",
          certificateDetails:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      CertificateInfo(
          name: "This is a Certificate",
          to: "2022",
          from: "1998",
          certificateDetails:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      CertificateInfo(
          name: "This is a Certificate",
          to: "2022",
          from: "1998",
          certificateDetails:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    ],
    teacherType: TeacherType.community,
    comments: [
      CommentItem(
          profilePictureUrl:
              "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
          date: "11-11-2021",
          userName: "John Doe",
          comment:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
          rate: 4),
      CommentItem(
          profilePictureUrl:
              "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
          date: "11-11-2021",
          userName: "John Doe",
          comment:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
          rate: 4),
      CommentItem(
          profilePictureUrl:
              "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
          date: "11-11-2021",
          userName: "John Doe",
          comment:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
          rate: 4),
    ],
    country: "Germany",
    isFavorite: false,
    teacherId: 0,
    teacherName: "Jane Doe",
    lessonTypes: [
      LessonType.general,
      LessonType.reading,
      LessonType.writing,
    ],
    profilePictureUrl:
        "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
    rateStatistics: {
      1: 2,
      2: 3,
      3: 5,
      4: 2,
      5: 111,
    },
    teachedLanguage: [
      "Turkish",
    ],
    teacherAvaibility: "",
    education: [
      EducationInfo(
        name: "Mersin University Degree",
        to: "2017",
        from: "2021",
        educationDetails:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
      ),
    ],
  ),
};
