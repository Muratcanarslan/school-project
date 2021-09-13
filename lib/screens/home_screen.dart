import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolproject/blocs/bloc/teacher_list/bloc/teacher_list_bloc.dart';

import 'package:schoolproject/widgets/teacher_list_widgets/teacher_list_main_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TeacherListBloc>().add(FetchTeachersEvent());
  }

  @override
  Widget build(BuildContext context) {
    print("HOME SCREEN");
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher List"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: context.read<TeacherListBloc>(),
        builder: (context, state) {
          if (state is TeacherListLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is TeacherListLoadedState) {
            return ListView.separated(
              itemCount: state.model.length,
              itemBuilder: (context, index) {
                return TeacherListMainWidget(
                  model: state.model[index],
                );
              },
              separatorBuilder: (context, _) {
                return Divider(
                  color: Colors.black26,
                  height: 1,
                );
              },
            );
          } else if (state is TeacherListErrorState) {
            return Scaffold(
              body: Center(
                child: Text('teacherListErrorState'),
              ),
            );
          } else {
            return Text("error");
          }
        },
      ),
    );
  }
}
