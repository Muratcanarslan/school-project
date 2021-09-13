import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolproject/models/teacher_list_model.dart';

class TeacherListProvider {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<List<TeacherListModel>> fetchTeachersFunction() async {
    final result = await _fireStore.collection('teachers').get();
    List<TeacherListModel> list = List.empty(growable: true);
    for (int i = 0; i < result.docs.length; i++) {
      list.add(TeacherListModel.fromJson(result.docs[i].data()));
    }
    return list;
  }

  void function() async {
    final result = await _fireStore.collection('teachers').get();
    TeacherListModel.fromJson(result.docs[0].data());

    /*
    Map<String, dynamic> muratEkle = Map();

     int teacherId;
     String teacherName;
     String profilePictureUrl;
     String country;
     String nativeLanguage;
     double price;
     TeacherType teacherType;
     List<LessonType> lessonTypes;
     double averageRate;
*/
/*
    _fireStore.collection("teachers").doc('0').set({
      'teacherId': 0,
      'teacherName': 'John Doe',
      'profilePictureUrl':
          'https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg',
      'country': 'england',
      'nativeLanguage': 'english',
      'price': 25.0,
      'teacherType': 'community',
      'lessonTypes': ['writing', 'reading'],
      'averageRate': 3.7,
    });
    _fireStore.collection("teachers").doc('1').set({
      'teacherId': 1,
      'teacherName': 'Jane Doe',
      'profilePictureUrl':
          'https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg',
      'country': 'japan',
      'nativeLanguage': 'japanese',
      'price': 65.0,
      'teacherType': 'community',
      'lessonTypes': ['writing', 'reading'],
      'averageRate': 3.7,
    });
    _fireStore.collection("teachers").doc('2').set({
      'teacherId': 2,
      'teacherName': 'Angelina',
      'profilePictureUrl':
          'https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg',
      'country': 'turkey',
      'nativeLanguage': 'turkish',
      'price': 45.0,
      'teacherType': 'professional',
      'lessonTypes': [
        'writing',
        'reading',
        'listening',
      ],
      'averageRate': 4.7,
    });
    /*
    _fireStore
        .collection("teachers")
        .doc('0')
        .set(
          muratEkle,
          SetOptions(merge: true),
        )
        .then(
          (value) => print("murat eklendi"),
        ); // set olan verinin yerine yazar update işlemi için kullanılmaz.Veri kaybı yaşarsın.merge:true dediğin zaman update işlemi yapar.

    // _fireStore.collection("teachers").add({'ad': 'murat'});

    final id = _fireStore.collection("teachers").doc().id;

    _fireStore.collection("teachers/$id").add({'ad': 'murat', 'userid': "$id"});
*/
    _fireStore.collection("teachers").doc('murat').update(
      {
        'ad': "keke",
        "begeni": FieldValue.increment(1),
      },
    );
    // _fireStore.collection("teachers").add({'ad': 'murat'});
  }
  */
  }
/*
  List<TeacherListModel> teacherModelMap = [
    TeacherListModel(
      country: "england",
      lessonTypes: [
        LessonType.reading,
        LessonType.general,
        LessonType.writing,
        LessonType.listening,
      ],
      nativeLanguage: "English",
      price: 30.1,
      teacherId: 0,
      teacherName: "john doe",
      teacherType: TeacherType.community,
      profilePictureUrl:
          "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
      averageRate: 3.7,
    ),
    TeacherListModel(
      country: "england",
      lessonTypes: [
        LessonType.reading,
        LessonType.general,
        LessonType.writing,
        LessonType.listening,
      ],
      nativeLanguage: "English",
      price: 30.1,
      teacherId: 0,
      teacherName: "john doe",
      teacherType: TeacherType.community,
      profilePictureUrl:
          "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
      averageRate: 3.7,
    ),
    TeacherListModel(
      country: "england",
      lessonTypes: [
        LessonType.reading,
        LessonType.general,
        LessonType.writing,
        LessonType.listening,
      ],
      nativeLanguage: "English",
      price: 30.1,
      teacherId: 0,
      teacherName: "john doe",
      teacherType: TeacherType.community,
      profilePictureUrl:
          "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
      averageRate: 3.7,
    ),
    TeacherListModel(
      country: "england",
      lessonTypes: [
        LessonType.reading,
        LessonType.general,
        LessonType.writing,
        LessonType.listening,
      ],
      nativeLanguage: "English",
      price: 30.1,
      teacherId: 0,
      teacherName: "john doe",
      teacherType: TeacherType.community,
      profilePictureUrl:
          "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
      averageRate: 3.7,
    ),
    TeacherListModel(
      country: "england",
      lessonTypes: [
        LessonType.reading,
        LessonType.general,
        LessonType.writing,
        LessonType.listening,
      ],
      nativeLanguage: "English",
      price: 30.1,
      teacherId: 0,
      teacherName: "john doe",
      teacherType: TeacherType.community,
      profilePictureUrl:
          "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
      averageRate: 3.7,
    ),
    TeacherListModel(
      country: "england",
      lessonTypes: [
        LessonType.reading,
        LessonType.general,
        LessonType.writing,
        LessonType.listening,
      ],
      nativeLanguage: "English",
      price: 30.1,
      teacherId: 0,
      teacherName: "john doe",
      teacherType: TeacherType.community,
      profilePictureUrl:
          "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
      averageRate: 3.7,
    ),
    TeacherListModel(
      country: "england",
      lessonTypes: [
        LessonType.reading,
        LessonType.general,
        LessonType.writing,
        LessonType.listening,
      ],
      nativeLanguage: "English",
      price: 30.1,
      teacherId: 0,
      teacherName: "john doe",
      teacherType: TeacherType.community,
      profilePictureUrl:
          "https://1.bp.blogspot.com/-szrHwWDJkfk/VGj_bKFhiKI/AAAAAAAAD6c/EleQJHuWRjo/s1600/templatezy4.jpg",
      averageRate: 3.7,
    ),
  ];
  */
}
