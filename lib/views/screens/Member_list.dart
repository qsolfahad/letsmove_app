import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsmove_app/views/blocs/members/bloc/member_bloc.dart';

import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';

class MemberList extends StatefulWidget {
  const MemberList({super.key});

  @override
  State<MemberList> createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  void initState() {
    BlocProvider.of<MemberBloc>(context).add(LoadMemberData());
    super.initState();
  }

  int _currentIndex = 1;
  void _onItemTapped(int index) async {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
    } else if (index == 1) {
      Navigator.pushNamedAndRemoveUntil(context, memberList, (route) => false);
    } else if (index == 2) {
      emptyStringValuesSF();
      Navigator.pushNamedAndRemoveUntil(context, intro, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is MemberStateLoading) {
            return const Center(
                child: CircularProgressIndicator()); // Loading indicator
          } else if (state is MemberLoaded) {
            final data = state.data;
            return (data.length != 0)
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final member = data[index];
                      return Card(
                          elevation: 3, // Card elevation
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20), // Card margin
                          child: ListTile(
                            leading: Icon(Icons
                                .person), // Icon on the left side of the card
                            title: Text(member.name), // Member's name
                            subtitle: Text(member.sub), // Member's email
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add),
                                  color: Colors.green,
                                  onPressed: () {
                                    BlocProvider.of<MemberBloc>(context)
                                        .add(AddMember(member.id));
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    BlocProvider.of<MemberBloc>(context)
                                        .add(RemoveMember(member.id));
                                  },
                                ),
                              ],
                            ), // Icons on the right side of the card
                          ));
                    },
                  )
                : Center(
                    child: Text('There is no pending approvers remaining'),
                  );
          }
          return SizedBox();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType
            .fixed, // Set to fixed if you have more than 3 items
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'logout',
          ),
        ],
      ),
    );
  }
}
