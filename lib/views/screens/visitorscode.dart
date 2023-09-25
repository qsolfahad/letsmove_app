import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

import 'component/QRCode.dart';

class VisitorsCode extends StatefulWidget {
  const VisitorsCode({super.key});


  @override
  _VisitorsCodeState createState() => _VisitorsCodeState();
}

class _VisitorsCodeState extends State<VisitorsCode> {
  bool generated = false;
  final controller = ScreenshotController();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final visitorsController = TextEditingController();
  final timeController = TextEditingController();
  var data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                        icon: FaIcon(FontAwesomeIcons.shareAlt, color: generated ? Colors.black : Colors.grey,),
                        onPressed: () async {
                          if(generated){
                            final image = await controller.captureFromWidget(qrCard(context,data));
                            saveAndShare(image);
                          }else{
                            return;
                          }
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: RichText(text:const TextSpan(
                        text: "Visitors Code",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        )
                    )),
                  ),
                  const SizedBox(height: 20,),
                  qrCard(context,data),
                  const SizedBox(height: 20,),
                  RichText(text:const TextSpan(
                      text: "Details",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      )
                  )),
                  const SizedBox(height: 20,),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(text:const TextSpan(
                                text: "Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                )
                            )),
                          ),
                          const SizedBox(height: 5,),
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Please Enter name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:  BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
                                  borderRadius:  BorderRadius.circular(20),
                                ),
                                hintText: "Visitors Name"
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(text:const TextSpan(
                                text: "Visitors",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                )
                            )),
                          ),
                          const SizedBox(height: 5,),
                          TextFormField(
                            controller: visitorsController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Please Enter No: of visitors";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:  BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
                                  borderRadius:  BorderRadius.circular(20),
                                ),
                                hintText: "Enter No: of visitors"
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(text:const TextSpan(
                                text: "Time",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                )
                            )),
                          ),
                          const SizedBox(height: 5,),
                          TextFormField(
                            controller: timeController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Please Enter the time";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:  BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
                                  borderRadius:  BorderRadius.circular(20),
                                ),
                                hintText: "Enter Time eg: (7 pm)"
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(width: 200, height: 60),
                              child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    setState(() {
                                      data = " Name: ${"${nameController.text}\n"} Visitors: ${"${visitorsController.text}\n"} Time: ${"${timeController.text}\n"}";
                                      generated = true;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Processing Data')),
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade700),
                                ),
                                child: const Text("Generate"),),
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  

  Future saveAndShare(Uint8List bytes) async{
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);

    await Share.shareFiles([image.path]);
  }

  Future<String> saveImage(Uint8List image) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'Screenshot_$time';
    final result = await ImageGallerySaver.saveImage(image, name: name);
    return result['filepath'];
  }
}
