import 'package:flutter/material.dart';
import 'package:schoolproject/models/arguments/teacher_calendar_argument.dart';
import 'package:schoolproject/models/enums/lesson_type.dart';
import 'package:schoolproject/models/teacher_details_model.dart';
import 'package:schoolproject/routes/routes.dart';
import 'package:schoolproject/widgets/teacher_details_widgets/main_container.dart';

class LessonTypeScreen extends StatelessWidget {
  const LessonTypeScreen({Key? key, required this.model}) : super(key: key);
  final TeacherDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson Types"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Text(
                'SELECT A LESSON TYPE',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            for (int i = 0; i < model.lessonTypes.length; i++) ...{
              MainContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        "${model.lessonTypes[i].getLessonTypeToString()} Lesson",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.indigo),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        "\$60",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: model.lessonTypes[i]
                          .getLessonTypeIconsWithLessonTypes(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.teacherCalendarScreen,
                          arguments: TeacherCalendarArgument(
                            lessonType: model.lessonTypes[i],
                            teacherId: model.teacherId,
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Take a Lesson'),
                          Icon(
                            Icons.arrow_right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
