import 'dart:ui';

import 'package:flutter/material.dart';

class TransparentBackgroundPage extends StatefulWidget {
  @override
  State<TransparentBackgroundPage> createState() =>
      _TransparentBackgroundPageState();
}

class _TransparentBackgroundPageState extends State<TransparentBackgroundPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: new Stack(
        children: <Widget>[
          new ClipRect(
            child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextField(
                            cursorColor: Colors.grey[200],
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.black38),
                              hintText: 'abc@company.com',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
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
                              labelStyle: TextStyle(color: Colors.black38),
                              hintText: '*******',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(6),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                // Adding event on Widget OnPressed Method
                                // _loginBloc.add(GetLogin(
                                //   email: emailController.text,
                                //   password: passwordController.text,
                                // ));
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 26),
                              ),
                            ),
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
                              'Virtuagym Privacy Statement - Virtusgym Terms & Conditions',
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
    );
  }
}
