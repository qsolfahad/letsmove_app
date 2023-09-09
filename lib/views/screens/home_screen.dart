import 'package:flutter/material.dart';
import 'package:letsmove_app/model/data/userInfo.dart';
import 'package:letsmove_app/views/blocs/login/bloc/login_bloc.dart';

import '../../routes/routes_name.dart';

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
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'logout') {
              emptyStringValuesSF();
              Navigator.pushNamedAndRemoveUntil(context, intro, (route) => false);
            }
          },
          icon: Icon(Icons.settings),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ];
          },
        ),
      ],
    ));
  }
}
