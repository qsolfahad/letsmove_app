import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';
import 'component/memberButton.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  
  @override
  void initState() {
     Future.delayed(const Duration(milliseconds: 0), () async {
      BlocProvider.of<AuthBloc>(context).add(LoadUserDetail());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isPending = prefs.getBool('isPending');

      if (isPending == true && isPending != null) {
        Navigator.pushNamedAndRemoveUntil(context, pending, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                    title: const Text(
                      // 'Hi ' + sfName.toString() + ',',
                      '',

                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Your weekly goals',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                         emptyStringValuesSF();
                        Navigator.pushNamedAndRemoveUntil(
                            context, intro, (route) => false);
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    )),
               
                const Text(
                  "Sorry, you can't see your dashboard until you become a member.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state is GetUserDetails)
                  if (state.isMember == false)
                   memberButton(context)
              ],
            ),
          ),
        );
      },
    );
  }
}
