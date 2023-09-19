import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/data/constant.dart';
import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  Auth auth;
  AuthenticationPage(this.auth, {super.key});
  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  showDialogbox(
    cntxt,
   state
  ) {
    showDialog(
      context: cntxt,
      builder: (ctx) => AlertDialog(
        title: (widget.auth == Auth.LOGIN)
            ? const Text("Error logging in")
            : const Text("Error Signing up"),
        content:  Text(
            state.value.toString()),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("okay")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    final authBloc = AuthBloc();
    return BlocProvider(
      create: (context) => authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginValidation) {
            Navigator.pop(context);
            showDialogbox(context,state);
          }

          if (state is LoginLoaded) {
            Navigator.pushNamedAndRemoveUntil(
                context, option, (route) => false);
          }
          if (state is SignupValidation) {
            Navigator.pop(context);
            showDialogbox(context,state);
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
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  ClipRect(
                    child: BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: const Icon(Icons.cancel),
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
                                            const TextStyle(color: Colors.black38),
                                        hintText: 'Full name',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  if (widget.auth == Auth.SIGNUP)
                                    const SizedBox(
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
                                          const TextStyle(color: Colors.black38),
                                      hintText: 'abc@company.com',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
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
                                          const TextStyle(color: Colors.black38),
                                      hintText: '*******',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  if (state is LoginLoading)
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  if (state is LoginLoading)
                                    const CircularProgressIndicator(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
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
                                            authBloc.add(GetLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ));
                                          } else {
                                            authBloc.add(GetSignup(
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
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 15,
                                        ),
                                        child: Text(
                                          (widget.auth == Auth.LOGIN)
                                              ? 'Log in'
                                              : 'Sign up',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'By using this app you agree to the:',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                  const Center(
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
