import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolproject/blocs/bloc/login/login_bloc.dart';
import 'package:schoolproject/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<LoginBloc>(),
      builder: (context, state) {
        if (state is LoginInitial) {
          return LoginMainWidget(
              emailController: emailController,
              passwordController: passwordController);
        } else if (state is LoggedInLoadingState) {
          print("loggedInLoadingState");
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoggedInErrorState) {
          print("loggedINErrorState");
          return Text("");
        } else if (state is LoggedInState) {
          Future.delayed(Duration.zero, () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.homeScreen, (route) => false);
          });
          return Text("");
        } else {
          return Text("");
        }
      },
    );
  }
}

class LoginMainWidget extends StatelessWidget {
  const LoginMainWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "User Mail",
                        focusColor: Colors.blue,
                        icon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        icon: Icon(
                          Icons.vpn_key,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        passwordController.text != '' &&
                                emailController.text != ''
                            ? context.read<LoginBloc>().add(
                                  LoggedInEvent(
                                      password: passwordController.text,
                                      userName: emailController.text),
                                )
                            : print("error");
                      },
                      child: Text('Login'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerScreen);
                      },
                      child: Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
