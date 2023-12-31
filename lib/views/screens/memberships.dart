import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/data/constant.dart';
import '../blocs/members/bloc/member_bloc.dart';

class Memberships extends StatefulWidget {
  const Memberships({super.key});

  @override
  _MembershipsState createState() => _MembershipsState();
}

class _MembershipsState extends State<Memberships> {
  @override
  void initState() {
    BlocProvider.of<MemberBloc>(context).add(LoadMemberData());
    super.initState();
  }

  // Track active index
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberBloc, MemberState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Constants.scaffoldBackgroundColor,
            buttonBackgroundColor: Constants.primaryColor,
            items: [
              Icon(
                Icons.local_activity,
                size: 30.0,
                color:
                    activeIndex == 0 ? Colors.white : const Color(0xFFC8C9CB),
              ),
              Icon(
                Icons.credit_card,
                size: 30.0,
                color:
                    activeIndex == 1 ? Colors.white : const Color(0xFFC8C9CB),
              ),
            ],
            onTap: (index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          backgroundColor: Constants.primaryColor,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.35,
                  child: Image.asset(
                    //to-do
                    "images/pattern.png",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: kToolbarHeight,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 200.0,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: Constants.scaffoldBackgroundColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Text(
                                "Memberships",
                                style: TextStyle(
                                  color: Color.fromRGBO(19, 22, 33, 1),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7.0),
                            if (state is MemberStateLoading)
                              const Center(child: CircularProgressIndicator()),
                            if (state is MemberLoaded)
                              SizedBox(
                                height: 500,
                                child: (state.data.isNotEmpty)
                                    ? ListView.builder(
                                        itemCount: state.data.length,
                                        itemBuilder: (context, index) {
                                          final member = state.data[index];
                                          return Card(
                                              elevation: 3, // Card elevation
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal:
                                                          20), // Card margin
                                              child: ListTile(
                                                leading: const Icon(Icons
                                                    .person), // Icon on the left side of the card
                                                title: Text(member
                                                    .name), // Member's name
                                                subtitle: Text(member
                                                    .sub), // Member's email
                                                trailing: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    IconButton(
                                                      icon:
                                                          const Icon(Icons.add),
                                                      color: Colors.green,
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    MemberBloc>(
                                                                context)
                                                            .add(AddMember(
                                                                member.id));
                                                      },
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      color: Colors.red,
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    MemberBloc>(
                                                                context)
                                                            .add(RemoveMember(
                                                                member.id));
                                                      },
                                                    ),
                                                  ],
                                                ), // Icons on the right side of the card
                                              ));
                                        },
                                      )
                                    : const Center(
                                        child: Text(
                                            'There is no pending approvers remaining'),
                                      ),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
