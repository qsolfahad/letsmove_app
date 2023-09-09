import 'package:flutter/material.dart';
import 'package:letsmove_app/model/data/userInfo.dart';
import 'package:letsmove_app/views/blocs/login/bloc/login_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ' + sfName.toString()),
      ),
    );
  }
}
