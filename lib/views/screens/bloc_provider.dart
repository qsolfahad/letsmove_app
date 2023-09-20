import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/data/firebaseServices.dart';
import '../blocs/Auth/bloc/auth_bloc.dart';
import '../blocs/intro/bloc/intro_bloc.dart';
import '../blocs/members/bloc/member_bloc.dart';

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
