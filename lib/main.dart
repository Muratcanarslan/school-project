import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolproject/blocs/bloc/authentication/authentication_bloc.dart';
import 'package:schoolproject/blocs/bloc/new_lesson/bloc/new_lesson_bloc.dart';
import 'package:schoolproject/blocs/bloc/teacher_details/bloc/teacher_details_bloc.dart';
import 'package:schoolproject/blocs/bloc/teacher_list/bloc/teacher_list_bloc.dart';
import 'package:schoolproject/models/arguments/hour_selection_arguments.dart';
import 'package:schoolproject/models/arguments/payment_screen_arguments.dart';
import 'package:schoolproject/models/arguments/teacher_calendar_argument.dart';
import 'package:schoolproject/models/teacher_details_model.dart';
import 'package:schoolproject/providers/login_provider.dart';
import 'package:schoolproject/routes/routes.dart';
import 'package:schoolproject/screens/home_screen.dart';
import 'package:schoolproject/screens/hour_selection_screen.dart';
import 'package:schoolproject/screens/lesson_type_screen.dart';
import 'package:schoolproject/screens/login_screen.dart';
import 'package:schoolproject/screens/payment_screen.dart';
import 'package:schoolproject/screens/register_screen.dart';
import 'package:schoolproject/screens/teacher_calendar_screen.dart';
import 'package:schoolproject/screens/teacher_details_screen.dart';
import 'blocs/bloc/login/login_bloc.dart';
import 'blocs/bloc/register/register_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  LoginProvider provider = LoginProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.homeScreen:
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => TeacherListBloc(),
                child: HomeScreen(),
              ),
            );
          case Routes.loginScreen:
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => LoginBloc(),
                child: LoginScreen(),
              ),
            );
          case Routes.registerScreen:
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => RegisterBloc(),
                child: RegisterScreen(),
              ),
            );
          case Routes.appWidget:
            return MaterialPageRoute(builder: (context) => AppWidget());
          case Routes.teacherDetails:
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => TeacherDetailsBloc(),
                child: TeacherDetailsScreen(
                  teacherId: settings.arguments as int,
                ),
              ),
            );
          case Routes.lessonType:
            return MaterialPageRoute(
              builder: (context) => LessonTypeScreen(
                model: settings.arguments as TeacherDetailsModel,
              ),
            );
          case Routes.teacherCalendarScreen:
            return MaterialPageRoute(
              builder: (context) => TeacherCalendarScreen(
                arguments: settings.arguments as TeacherCalendarArgument,
              ),
            );
          case Routes.hourSelectionScreen:
            return MaterialPageRoute(
              builder: (context) => HourSelectionScreen(
                arguments: settings.arguments as HourSelectionArguments,
              ),
            );
          case Routes.paymentScreen:
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => NewLessonBloc(),
                child: PaymentScreen(
                  arguments: settings.arguments as PaymentScreenArguments,
                ),
              ),
            );
        }
      },
      home: AppWidget(),
    );
  }
}

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

bool a = false;

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(IsAuthenticatedEvent());
  }

  @override
  Widget build(BuildContext context) {
    print("appwidget");
    return BlocBuilder(
      bloc: context.read<AuthenticationBloc>(),
      builder: (context, state) {
        if (state is NonAuthenticatedState) {
          print("NONAUTHETİCATED");
          Future.delayed(Duration.zero, () {
            Navigator.pushNamed(context, Routes.loginScreen);
          });
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AuthenticatedLoadingState) {
          print("LOADİNG");
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        } else if (state is AuthenticatedState) {
          print("AUTHETİCATED");
          if (a == false) {
            Future.delayed(Duration.zero, () {
              Navigator.pushNamed(context, Routes.homeScreen);
            });
            a = true;
          }

          return BlocProvider(
            create: (context) => TeacherListBloc(),
            child: HomeScreen(),
          );
        } else {
          return Text(
            "error",
            style: Theme.of(context).textTheme.headline1,
          );
        }
      },
    );
  }
}
