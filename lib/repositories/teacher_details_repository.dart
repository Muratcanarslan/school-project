import 'package:schoolproject/models/teacher_details_model.dart';
import 'package:schoolproject/providers/teacher_details_provider.dart';

class TeacherDetailsRepository {
  TeacherDetailsProvider provider = TeacherDetailsProvider();

  Future<TeacherDetailsModel> fetchTeacherDetailsModelFunction(
      int teacherId) async {
    return await provider.fetchTeacherDetailsFunction(teacherId);
  }
}
