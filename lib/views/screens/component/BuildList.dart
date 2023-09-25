import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:intl/intl.dart';

import '../../../model/data/constant.dart';

Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3, color: secondary),
              image: DecorationImage(
                  image: NetworkImage(SocietyLists[index]['logoText']),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  SocietyLists[index]['name'],
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: secondary,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(SocietyLists[index]['location'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: secondary,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(SocietyLists[index]['type'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildEventsCard(
      {String? title,
      String? subject,
      String? time,
      List<String>? imageList,
      int? count}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: subject,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.timer,
                      size: 16,
                    )),
                    TextSpan(
                        text: "  ${time!}",
                        style: const TextStyle(color: Colors.black, fontSize: 12))
                  ]),
                ),
                ImageStack(
                  imageList: imageList!,
                  totalCount: count!,
                  imageRadius: 25,
                  imageCount: 4,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget buildUnresolvedCard(
      {String? title,
      String? subject,
      String? text,
      List<String>? imageList,
      String? me,
      String? meeting,
      String? meeting2}) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: subject,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: text,
                              style:
                                  const TextStyle(color: Colors.black, fontSize: 12))
                        ]),
                      ),
                      ImageStack(
                        imageList: imageList!,
                        totalCount: 20,
                        imageRadius: 25,
                        imageCount: 4,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: me,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))
                        ]),
                      ),
                      TextButton(
                        child: Text(meeting!),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: Text(meeting2!),
                        onPressed: () {},
                      )
                    ],
                  )
                ])));
  }
  Widget _buildEventCard({ String? from, String? to, String? Title,  String? location}){
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(from!),
              const SizedBox(height: 20,),
              Container(height: 1,width: 25,color: Colors.grey[300],),
              const SizedBox(height: 30,),
              Container(height: 1,width: 35,color: Colors.grey[300],),
              const SizedBox(height: 30,),
              Container(height: 1,width: 25,color: Colors.grey[300],),
              const SizedBox(height: 25,),
            ],
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 26, 51, 10),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 4.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      SizedBox(
                        height: 16,
                        child: Row(
                          children: [
                            Text("$from - ${to!}"),
                            VerticalDivider(width: 10,color: Colors.grey[700],),
                            Text(location!)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        Title!,
                        style: const TextStyle(
                          fontSize: 22
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
  Widget conditionalList(dynamic newData){
    return SizedBox(
      height: 1000,
      child: ListView.builder(itemCount: newData[dateText].length,itemBuilder: (BuildContext context, int index){
        return _buildEventCard(
            from: newData[dateText][index]["from"],
            to: newData[dateText][index]["to"],
            Title: newData[dateText][index]["title"],
            location: newData[dateText][index]["location"]
        );
      })
      ,);
  }
  