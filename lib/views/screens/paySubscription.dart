import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsmove_app/views/screens/subscription.dart';
import 'package:page_transition/page_transition.dart';

import '../../model/data/constant.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';
import 'component/header.dart';
import 'component/memberButton.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key, this.title});
  final title;
  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(LoadUserDetail());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            header(widget.title),
            const SizedBox(
              height: 10,
            ),
            Image.network(
                'https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?cs=srgb&dl=pexels-anush-gorak-1229356.jpg&fm=jpg'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: points.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text(points[index]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (state is GetUserDetails)
              if (state.isMember == false)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child:  memberButton(context)
                ),
          ],
        );
      },
    );
  }
}
