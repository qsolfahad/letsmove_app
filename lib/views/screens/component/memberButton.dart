import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsmove_app/routes/routes_name.dart';

import '../../blocs/Auth/bloc/auth_bloc.dart';


void showSubscriptionDialog(BuildContext context, GetUserDetails state) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('Choose a Subscription'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              var text = '1 Month Subscription: \$300';
              BlocProvider.of<AuthBloc>(context).add(UpdateMember(state.id!,text));
              Navigator.pop(context, text);
            },
            child: Text('1 Month Subscription: \$300'),
          ),
          SimpleDialogOption(
            onPressed: () {
              var text = '1 Year Subscription: \$600';
              BlocProvider.of<AuthBloc>(context).add(UpdateMember(state.id!,text));
              Navigator.pop(context, text);
            },
            child: Text('1 Year Subscription: \$600'),
          ),
          SimpleDialogOption(
            onPressed: () {
              var text = 'Lifetime Subscription: \$1500';
              BlocProvider.of<AuthBloc>(context).add(UpdateMember(state.id!,text));
              Navigator.pop(context, text);
            },
            child: Text('Lifetime Subscription: \$1500'),
          ),
        ],
      );
    },
  ).then((value) {
    // Handle the selected subscription choice here (value is the selected subscription)

    if (value != null) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Congratulation you are member for: $value'),
      //   ),
      // );
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(context, pending, (route) => false);
      });
    }
  });
}
