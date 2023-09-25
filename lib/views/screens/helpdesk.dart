import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../model/data/constant.dart';
import 'component/AppBarButton.dart';
import 'component/AvatarImage.dart';
import 'component/IconAndStatus.dart';
import 'component/profileList.dart';
import 'component/profile_list_item.dart';

class HelpDesk extends StatefulWidget {
  const HelpDesk({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<HelpDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const AppBarButton(
                          icon: Icons.arrow_back,
                        ),
                      ),
                    ],
                  ),
                ),
                const AvatarImage(),
                const SocialIcons(),
                const SizedBox(height: 40),
                const Text(
                  'Help Desk',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins"),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Useful Contact Information\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                ),
                const ProfileListItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}








