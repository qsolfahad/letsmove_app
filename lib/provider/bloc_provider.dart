import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/data/firebaseServices.dart';
import '../views/blocs/Auth/bloc/auth_bloc.dart';
import '../views/blocs/intro/bloc/intro_bloc.dart';
import '../views/blocs/members/bloc/member_bloc.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider<IntroBloc>(create: (context) => IntroBloc()),
        BlocProvider<MemberBloc>(
            create: (context) => MemberBloc(FirestoreService())),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ];
}
