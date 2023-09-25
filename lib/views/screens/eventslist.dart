import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import '../../model/data/constant.dart';
import 'component/BuildList.dart';
import 'component/nullCondition.dart';

class EventsTimeline extends StatefulWidget{
  const EventsTimeline({super.key});

  @override
  EventsTimelineScreen createState() => EventsTimelineScreen();
}

class EventsTimelineScreen extends State<EventsTimeline>{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(0, 26, 51, 10),
                padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {Navigator.of(context).pop();},
                            icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white,size: 20,)
                        ),
                        RichText(text: TextSpan(
                          text: "${DateFormat.MMMM().format(now)} ${DateFormat('yyyy').format(now)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19
                          )
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.search, color: Colors.white,size: 20,)
                        ),
                      ],
                    ),
                    DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.grey.shade700,
                      selectedTextColor: Colors.white,
                      monthTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 0
                      ),
                      dateTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14
                      ),
                      dayTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          pickedDate = date;
                          dateText = DateFormat('dd-MM-yyyy').format(pickedDate).toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
              FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .load('lib/screens/events.json'),
                builder: (context, snapshot){
                  var newData = json.decode(jsonData);
                  return Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) => newData[dateText] != null,
                      widgetBuilder: (BuildContext context) => conditionalList(newData),
                      fallbackBuilder: (BuildContext context) => conditionalNull()
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }

 
 
}