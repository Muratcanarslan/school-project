import 'package:flutter/material.dart';
import 'package:schoolproject/blocs/bloc/register/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
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
                      controller: passWordController,
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        emailController.text != "" &&
                                passWordController.text != ""
                            ? context.read<RegisterBloc>().add(
                                  NewRegisterEvent(
                                      email: emailController.text,
                                      password: passWordController.text),
                                )
                            : Text("");
                      },
                      child: Text('Register'),
                    ),
                  ),
                  BlocBuilder(
                    bloc: context.read<RegisterBloc>(),
                    builder: (context, state) {
                      if (state is RegisterLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is RegisterSuccessState) {
                        return Center(
                          child: Text(
                            "Register is Successful",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.green),
                          ),
                        );
                      } else if (state is RegisterFailedState) {
                        return Center(
                          child: Text(
                            "Register is Failed",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.red),
                          ),
                        );
                      } else {
                        return Text("");
                      }
                    },
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
