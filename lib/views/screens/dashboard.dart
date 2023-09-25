import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_stack/image_stack.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/data/constant.dart';
import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';
import 'complaints.dart';
import 'component/BuildList.dart';
import 'eventslist.dart';
import 'helpdesk.dart';
import 'SocietyPage.dart';
import 'memberships.dart';
import 'visitorscode.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  DashboardScreen createState() => DashboardScreen();
}

class DashboardScreen extends State<DashBoard> {
 
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      BlocProvider.of<AuthBloc>(context).add(LoadUserDetail());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isMember = prefs.getBool('isMember');

      if (isMember == false && isMember != null) {
        Navigator.pushNamedAndRemoveUntil(context, request, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
            body: (state is GetUserDetails)
                ? Material(
                    color: Colors.grey[200],
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 48),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                          ),
                                        ))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    "Welcome back, ${state.name}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                )),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            emptyStringValuesSF();
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                intro,
                                                (route) => false);
                                          },
                                          child: const Text(
                                            'Logout',
                                            style: TextStyle(
                                                color: Colors.redAccent),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                            text:
                                                "You have got 3 events\nthis week!",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 190,
                                  child: PageView(
                                    controller:
                                        PageController(viewportFraction: 0.9),
                                    scrollDirection: Axis.horizontal,
                                    pageSnapping: true,
                                    children: <Widget>[
                                      buildEventsCard(
                                          title: "Residents Weekly\nMeeting",
                                          subject: "Upcoming festivals",
                                          time: "7 PM - 8 PM, Mon",
                                          imageList: images4,
                                          count: 22),
                                      buildEventsCard(
                                          title: "Grounds Maintenance\nMeeting",
                                          subject: "Cleanliness Guidelines",
                                          time: "5 PM - 6 PM,  Wed",
                                          imageList: images5,
                                          count: 17),
                                      buildEventsCard(
                                          title: "Covid-19 safety\nMeeting",
                                          subject: "Visitors schedule",
                                          time: "8 PM - 9 PM,  Thu",
                                          imageList: images6,
                                          count: 19)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                              maxHeight: double.infinity,
                            ),
                            child: Container(
                              height: 425,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.0,
                                    offset: Offset(-1.0,
                                        -1.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 15),
                                    RichText(
                                        text: const TextSpan(
                                            text: "Overview",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                    const SizedBox(height: 25),
                                    SizedBox(
                                      height: 250,
                                      child: PageView(
                                        controller: PageController(
                                            viewportFraction: 0.5,
                                            initialPage: 1),
                                        scrollDirection: Axis.horizontal,
                                        pageSnapping: false,
                                        children: <Widget>[
                                          if (state.isAdmin == true)
                                            _buildItemCard(
                                                title: "Memberships",
                                                total: "Total: 5",
                                                used: "Active: 3",
                                                totalNum: 5,
                                                usedNum: 3,
                                                color: Colors.blue,
                                                icon: FontAwesomeIcons
                                                    .addressCard,
                                                onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Memberships()),
                                                    )),
                                          _buildItemCard(
                                              title: "Events",
                                              total: "This month: 10",
                                              used: "Replied: 5",
                                              totalNum: 10,
                                              usedNum: 5,
                                              color: Colors.red,
                                              icon: FontAwesomeIcons.campground,
                                              onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const EventsTimeline()),
                                                  )),
                                          _buildItemCard(
                                              title: "My Society",
                                              total: "Available: 6",
                                              used: "Member: 2",
                                              totalNum: 6,
                                              usedNum: 2,
                                              color: Colors.indigo,
                                              icon:
                                                  FontAwesomeIcons.userFriends,
                                              onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SocietyList()),
                                                  )),
                                          _buildItemCard(
                                              title: "Complaints",
                                              total: "Unresolved: 4",
                                              used: "Resolved: 3",
                                              totalNum: 4,
                                              usedNum: 3,
                                              color: Colors.orange,
                                              icon: FontAwesomeIcons.comment,
                                              onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Complaints()),
                                                  )),
                                          _buildItemCard(
                                              title: "Visitors",
                                              total: "Approved: 4",
                                              used: "Cancelled: 1",
                                              totalNum: 4,
                                              usedNum: 1,
                                              color: Colors.cyan,
                                              icon:
                                                  FontAwesomeIcons.peopleArrows,
                                              onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const VisitorsCode()),
                                                  )),
                                          _buildItemCard(
                                              title: "Help Desk",
                                              total: "Tap to view",
                                              used: "",
                                              totalNum: 1,
                                              usedNum: 1,
                                              color: Colors.deepPurple,
                                              icon:
                                                  FontAwesomeIcons.handsHelping,
                                              onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HelpDesk()),
                                                  )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox());
      },
    );
  }

  Widget _buildItemCard(
      {String? title,
      String? total,
      String? used,
      int? totalNum,
      int? usedNum,
      Color? color,
      IconData? icon,
      GestureTapCallback? onTap}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                children: [
                  WidgetSpan(
                      child: FaIcon(
                    icon,
                    color: color,
                    size: 30,
                  )),
                ],
              )),
              const SizedBox(height: 25),
              RichText(
                  text: TextSpan(
                      text: title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ))),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
              ),
              RichText(
                  text: TextSpan(
                      text: total,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ))),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: used,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ))),
              const SizedBox(height: 20),
              LinearPercentIndicator(
                width: 115,
                lineHeight: 5,
                percent: usedNum! / totalNum!,
                backgroundColor: Colors.grey,
                progressColor: color,
              )
            ],
          ),
        ),
      ),
    );
  }

  
}
