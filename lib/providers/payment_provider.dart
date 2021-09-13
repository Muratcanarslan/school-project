import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolproject/models/arguments/payment_screen_arguments.dart';
import 'package:schoolproject/models/enums/lesson_type.dart';

class PaymentProvider {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> addNewLessonFunction(PaymentScreenArguments arguments) async {
    await _fireStore.collection("lessons").doc().set({
      'teacherId': arguments.teacherId,
      'hour': arguments.hour,
      'date': arguments.date,
      'lessonType': arguments.lessonType.getLessonTypeToString()
    });
  }
}
