import 'package:flutter/material.dart';
import 'package:letsmove_app/views/screens/component/profile_list_item.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItems extends StatefulWidget {
  const ProfileListItems({super.key});

  @override
  _ProfileListItemsState createState() => _ProfileListItemsState();
}

class _ProfileListItemsState extends State<ProfileListItems> {
  @override
  var arr = [true, true, true, true];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                arr[0] = !arr[0];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.phone,
              text: arr[0] ? 'Helpline' : '+91 33333 66666',
              hasNavigation: arr[0],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                arr[1] = !arr[1];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.mail_bulk,
              text: arr[1] ? 'Mail' : 'admin@helpdesk.com',
              hasNavigation: arr[1],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                arr[2] = !arr[2];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.hospital,
              text: arr[2] ? 'Ambulance' : '108',
              hasNavigation: arr[2],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                arr[3] = !arr[3];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.user_shield,
              text: arr[3] ? 'Police' : '100',
              hasNavigation: arr[3],
            ),
          ),
        ],
      ),
    );
  }
}