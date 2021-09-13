import 'package:flutter/material.dart';
import 'package:schoolproject/models/enums/lesson_type.dart';
import 'package:schoolproject/models/teacher_list_model.dart';

class TeacherListSecondRowWidget extends StatelessWidget {
  const TeacherListSecondRowWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final TeacherListModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < model.lessonTypes.length; i++) ...{
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: model.lessonTypes[i]
                          .getLessonTypeIconsWithLessonTypes(),
                    )
                  }
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\$${model.price.floor().toString()}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "/Hour",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\$${(model.price / 2).round()}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "/Trial",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
