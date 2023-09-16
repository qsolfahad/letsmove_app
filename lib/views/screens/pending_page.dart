import 'package:flutter/material.dart';

import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';

class PendingPage extends StatefulWidget {
  const PendingPage({super.key});

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          ListTile(
              title: Text(
                // 'Hi ' + sfName.toString() + ',',
                '',

                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Your weekly goals',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              trailing: GestureDetector(
                onTap: () {
                  emptyStringValuesSF();
                  Navigator.pushNamedAndRemoveUntil(
                      context, intro, (route) => false);
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.redAccent),
                ),
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            "Your Request is in panding please deposit your cash to become member.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ]),
      ),
    );
  }
}
