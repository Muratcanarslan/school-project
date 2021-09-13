import 'package:flutter/material.dart';
import 'package:schoolproject/models/enums/teacher_type.dart';
import 'package:schoolproject/models/teacher_list_model.dart';
import 'package:schoolproject/routes/routes.dart';
import 'package:schoolproject/widgets/teacher_list_widgets/teacher_list_second_row_widget.dart';
import 'package:schoolproject/widgets/teacher_list_widgets/teahcer_list_first_row_widget.dart';

class TeacherListMainWidget extends StatelessWidget {
  const TeacherListMainWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final TeacherListModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(context, Routes.teacherDetails,
            arguments: model.teacherId);
      },
      child: ClipRect(
        child: Banner(
          location: BannerLocation.topEnd,
          color: model.teacherType == TeacherType.community
              ? Colors.blue
              : Colors.purple,
          message: model.teacherType.teacherTypeToString(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Theme.of(context).canvasColor,
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: TeacherListScreenFirstRowWidget(model: model),
                  ),
                ),
                TeacherListSecondRowWidget(model: model),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
