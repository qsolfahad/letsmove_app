 import 'package:flutter/material.dart';

Widget conditionalNull(){
    return const Center(
      child:Padding(
        padding: EdgeInsets.only(top: 50),
        child: Text("You have no events on this day",
        style: TextStyle(
          fontSize: 16,
        ),),
      )
    );
  }