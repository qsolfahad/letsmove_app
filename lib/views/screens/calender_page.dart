import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';
import 'component/memberButton.dart';
import 'component/ringPaint.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  
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
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                    title: Text(
                      // 'Hi ' + sfName.toString() + ',',
                      '',

                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3 - 11,
                        height: 200, // Set the width of your card
                        padding:
                            EdgeInsets.all(16), // Add padding inside the card
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // Add rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ], // Add shadow for a raised effect
                          color: Colors
                              .white, // Set the background color of the card
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: CustomPaint(
                                painter: RingPainter(
                                  color: Colors.grey
                                      .shade300, // Grey shade color for the ring
                                  thickness: 10, // Ring thickness
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.health_and_safety,
                                  color: Colors.redAccent,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Steps',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '7 X 10,000',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 3 - 11,
                        height: 200, // Set the width of your card
                        padding:
                            EdgeInsets.all(16), // Add padding inside the card
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // Add rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ], // Add shadow for a raised effect
                          color: Colors
                              .white, // Set the background color of the card
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: CustomPaint(
                                painter: RingPainter(
                                  color: Colors.grey
                                      .shade300, // Grey shade color for the ring
                                  thickness: 10, // Ring thickness
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.health_and_safety,
                                  color: Colors.redAccent,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Cardio',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '3 X 20 min',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 3 - 11,
                        height: 200, // Set the width of your card
                        padding:
                            EdgeInsets.all(16), // Add padding inside the card
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // Add rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ], // Add shadow for a raised effect
                          color: Colors
                              .white, // Set the background color of the card
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: CustomPaint(
                                  painter: RingPainter(
                                    color: Colors.grey
                                        .shade300, // Grey shade color for the ring
                                    thickness: 10, // Ring thickness
                                  ),
                                  child: Icon(
                                    Icons.health_and_safety,
                                    color: Colors.redAccent,
                                  )),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Strength',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '2 X 8 sets',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Sorry, you can't see your dashboard until you become a member.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                if (state is GetUserDetails)
                  if (state.isMember == false)
                    ElevatedButton(
                      onPressed: () {
                        showSubscriptionDialog(context, state);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,

                        elevation: 3, // Elevation of the button
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Button border radius
                        ),
                      ),
                      child: Text(
                        'Click Me to become Member',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
