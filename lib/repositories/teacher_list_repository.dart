import 'package:schoolproject/models/teacher_list_model.dart';
import 'package:schoolproject/providers/teacher_list_provider.dart';

class TeacherListRepository {
  TeacherListProvider provider = TeacherListProvider();

  Future<List<TeacherListModel>> fetchTeacherFunction() async {
    return await provider.fetchTeachersFunction();
  }
}
