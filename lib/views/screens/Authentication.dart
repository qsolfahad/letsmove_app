import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/data/constant.dart';
import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  Auth auth;
  AuthenticationPage(this.auth);
  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  showDialogbox(
    cntxt,
  ) {
    showDialog(
      context: cntxt,
      builder: (ctx) => AlertDialog(
        title: (widget.auth == Auth.LOGIN)
            ? Text("Error logging in")
            : Text("Error Signing up"),
        content: const Text(
            "Could not log you in. Please check if you entered the correct email address and password."),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("okay")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    final _authBloc = AuthBloc();
    return BlocProvider(
      create: (context) => _authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginValidation) {
            Navigator.pop(context);
            showDialogbox(context);
          }

          if (state is LoginLoaded) {
            Navigator.pushNamedAndRemoveUntil(
                context, option, (route) => false);
          }
          if (state is SignupValidation) {
            Navigator.pop(context);
            showDialogbox(context);
          }
          if (state is SignupLoading) {
            // You can add loading indicators or actions here
          }
          if (state is SignupLoaded) {
            // If successfully created user, navigate to HomeScreen

            Navigator.pop(context);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  new ClipRect(
                    child: new BackdropFilter(
                        filter:
                            new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.5)),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ),
                                  if (widget.auth == Auth.SIGNUP)
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.grey[200],
                                      keyboardType: TextInputType.name,
                                      controller: fullNameController,
                                      decoration: InputDecoration(
                                        labelText: 'Name',
                                        labelStyle:
                                            TextStyle(color: Colors.black38),
                                        hintText: 'Full name',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  if (widget.auth == Auth.SIGNUP)
                                    SizedBox(
                                      height: 30,
                                    ),
                                  TextField(
                                    cursorColor: Colors.grey[200],
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.black38),
                                      hintText: 'abc@company.com',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle:
                                          TextStyle(color: Colors.black38),
                                      hintText: '*******',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  if (state is LoginLoading)
                                    SizedBox(
                                      height: 30,
                                    ),
                                  if (state is LoginLoading)
                                    CircularProgressIndicator(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(16),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (widget.auth == Auth.LOGIN) {
                                            _authBloc.add(GetLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ));
                                          } else {
                                            _authBloc.add(GetSignup(
                                                email: emailController.text,
                                                fullname:
                                                    fullNameController.text,
                                                password:
                                                    passwordController.text,
                                                isMemberShipAllow: false,
                                                isPending: false,
                                                isAdmin: false));
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 15,
                                        ),
                                        child: Text(
                                          (widget.auth == Auth.LOGIN)
                                              ? 'Log in'
                                              : 'Sign up',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'By using this app you agree to the:',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                  Center(
                                    child: Text(
                                      'Virtuagym Privacy Statement - Virtuagym Terms & Conditions',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ))),
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
