import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_stack/image_stack.dart';

import '../../model/data/constant.dart';
import 'component/BuildList.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  ComplaintsScreen createState() => ComplaintsScreen();
}

class ComplaintsScreen extends State<Complaints> {
  bool generated = false;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  var data = "";
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        body: Material(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.commentAlt,
                          color: generated ? Colors.black : Colors.blue,
                        ),
                        onPressed: () {
                          NavigatorState;
                        },
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: RichText(
                          text: const TextSpan(
                              text: "Complaints",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: const TextSpan(
                              text: "Unresolved Complaints",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 220,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.9),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          buildUnresolvedCard(
                              title: "Covid-19 Safety",
                              subject: "Sanitization required",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO"),
                          buildUnresolvedCard(
                              title: "Water Shortage",
                              subject: "No water in C-Block",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO"),
                          buildUnresolvedCard(
                              title: "No Cleanliness",
                              subject: "Bad odour near Park",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO"),
                          buildUnresolvedCard(
                              title: "Covid-19 Safety",
                              subject: "Visitors should not be allowed",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO")
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(height: 1),
            ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxHeight: double.infinity,
                ),
                child: Container(
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 48),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 1,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: const TextSpan(
                                      text: "Raise a Complaint",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: RichText(
                                        text: const TextSpan(
                                            text: "Title",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ))),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: titleController,
                                    // ignore: missing_return
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Title";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade200,
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText:
                                            "Enter title of your complaint"),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: RichText(
                                        text: const TextSpan(
                                            text: "Subject",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ))),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: subjectController,
                                    // ignore: missing_return
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Subject";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade200,
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText:
                                            "Enter subject of your complaint"),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints.tightFor(
                                          width: 200, height: 60),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              data =
                                                  " Name: ${"${titleController.text}\n"} Visitors: ${"${subjectController.text}\n"}";
                                              generated = true;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text('Raised')),
                                            );
                                          }
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue.shade700),
                                        ),
                                        child: const Text("Raise"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ))
                        ])))
          ],
        ),
      ),
    ));
  }

  
}
