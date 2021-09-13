import 'package:flutter/material.dart';
import 'package:schoolproject/blocs/bloc/new_lesson/bloc/new_lesson_bloc.dart';
import 'package:schoolproject/models/arguments/payment_screen_arguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.arguments}) : super(key: key);

  final PaymentScreenArguments arguments;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewLessonBloc>()
      ..add(
        AddNewLessonEvent(argument: widget.arguments),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Screen"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder(
        bloc: context.read<NewLessonBloc>(),
        builder: (context, state) {
          if (state is NewLessonLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewLessonSuccessState) {
            return Center(
              child: Text(
                "New Lesson Successfull",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.green),
              ),
            );
          } else if (state is NewLessonFailedState) {
            return Center(
              child: Text(
                "New Lesson Failed",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.red),
              ),
            );
          } else {
            return Text("");
          }
        },
      ),
    );
  }
}
