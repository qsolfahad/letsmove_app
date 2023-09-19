
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/routes_name.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      BlocProvider.of<AuthBloc>(context).add(LoadUserDetail());
     
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isMember = prefs.getBool('isMember');

      if (isMember == false && isMember != null) {
        Navigator.pushNamedAndRemoveUntil(context, calender, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    void _onItemTapped(int index) async {
      setState(() {
        currentIndex = index;
      });
      if (index == 0) {
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
      } else if (index == 1) {
        emptyStringValuesSF();
        Navigator.pushNamedAndRemoveUntil(context, intro, (route) => false);
      }
    }

    void _onItemTappedAdmin(int index) async {
      setState(() {
        currentIndex = index;
      });
      if (index == 0) {
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
      } else if (index == 1) {
        Navigator.pushNamedAndRemoveUntil(
            context, memberList, (route) => false);
      } else if (index == 2) {
        emptyStringValuesSF();
        Navigator.pushNamedAndRemoveUntil(context, intro, (route) => false);
      }
    }

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return (state is GetUserDetails)
          ? Scaffold(
           
              body: CustomScrollView(slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  backgroundColor: Colors.orange,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Center(
                        child: Text('Hello there ${state.name}')),
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.teal[100 * (index % 9)],
                        child: Text('Grid Item $index'),
                      );
                    },
                    childCount: 11,
                  ),
                ),
              ]),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                type: BottomNavigationBarType
                    .fixed, // Set to fixed if you have more than 3 items
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: (state.isAdmin == true)
                    ? _onItemTappedAdmin
                    : _onItemTapped,
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  if (state.isAdmin == true)
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.card_membership),
                      label: 'Members',
                    ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.logout),
                    label: 'logout',
                  ),
                ],
              ),
            )
          : const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
    });
  }
}
