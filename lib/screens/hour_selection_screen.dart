import 'package:flutter/material.dart';
import 'package:schoolproject/models/arguments/hour_selection_arguments.dart';
import 'package:schoolproject/models/arguments/payment_screen_arguments.dart';
import 'package:schoolproject/routes/routes.dart';
import 'package:schoolproject/widgets/teacher_details_widgets/main_container.dart';

class HourSelectionScreen extends StatelessWidget {
  const HourSelectionScreen({Key? key, required this.arguments})
      : super(key: key);
  final HourSelectionArguments arguments;

  @override
  Widget build(BuildContext context) {
    print("${arguments.date} ${arguments.lessonType}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Hour Selection Screen"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: 24,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.paymentScreen,
                arguments: PaymentScreenArguments(
                  teacherId: arguments.teacherId,
                  date: arguments.date,
                  hour: index.toString(),
                  lessonType: arguments.lessonType,
                ),
              );
            },
            child: MainContainer(
              child: Center(
                child: Text(
                  "$index-${index + 1}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
