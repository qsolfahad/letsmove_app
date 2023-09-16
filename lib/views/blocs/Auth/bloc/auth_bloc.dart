import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:letsmove_app/model/data/firebaseServices.dart';
import 'package:letsmove_app/model/data/userInfo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<GetLogin>((event, emit) async {
      if (event is GetLogin) {
        print('login triggered');
        String value = validationLogin(event);

        if (value != '') {
          emit(LoginValidation(value.toString()));
        } else {
          emit(LoginLoading());
          var checkUser = FirestoreService().checkAuth(event);
          bool isAuthenticated = false;
          String name = '';
          bool isMember = false;
          String sub = '';
          bool isPending = false;
          bool isAdmin = false;
          checkUser.then((querySnapshot) async {
            isAuthenticated = querySnapshot.docs.isNotEmpty;
            print(isAuthenticated);
            querySnapshot.docs.forEach((element) {
              name = element.data()['name'];
              isMember = element.data()['isMemberShipAllow'];
              sub = element.data()['subscription'];
              isPending = element.data()['isPending'];
              isAdmin = element.data()['isAdmin'];
            });
            setUserValuesSF(event, querySnapshot.docs.first.id, name, isMember,
                sub, isPending, isAdmin);
          }).catchError((error) {
            print(error);
            isAuthenticated = false;
          });
          await Future.delayed(const Duration(seconds: 3), () async {
            print(isAuthenticated);
            if (isAuthenticated) {
              emit(LoginLoaded());
              print('emiited');
            } else {
              emit(LoginValidation(value.toString()));
            }
            //if credentials matches then loaded state emitted
          }).onError((error, stackTrace) {
            emit(LoginError(error.toString()));
          });
        }
      }
    });
    on<GetSignup>((event, emit) async {
      if (event is GetSignup) {
        print('Signup triggered');
        String value = validationSignup(event);
        if (value != '') {
          emit(SignupValidation(value));
        } else {
          emit(SignupLoading());
//holds the user for below given time
          await Future.delayed(const Duration(seconds: 0), () async {
            //storing data in SharedPreferences
            print('set');
            FirestoreService().setUser(event);
            emit(SignupLoaded());
          }).onError((error, stackTrace) {
            emit(SignupError(error.toString()));
          });
        }
      }
    });
    on<LoadUserDetail>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String name = prefs.getString('name')!;
      String id = prefs.getString('id')!;
      String email = prefs.getString('email')!;
      bool isMember = prefs.getBool('isMember')!;
      bool? isPending = prefs.getBool('isPending')!;
      bool? isAdmin = prefs.getBool('isAdmin');
      emit(GetUserDetails(
          id: id,
          email: email,
          name: name,
          isMember: isMember,
          isPending: isPending,
          isAdmin: isAdmin));
    });
    on<UpdateMember>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isMember', false);
      prefs.setBool('isPending', true);
      String name = prefs.getString('name')!;
      String id = prefs.getString('id')!;
      String email = prefs.getString('email')!;
      bool isMember = prefs.getBool('isMember')!;
      bool isPending = prefs.getBool('isPending')!;
      bool isAdmin = prefs.getBool('isAdmin')!;
      FirestoreService().updateMember(event.id, event.sub);
      emit(GetUserDetails(
          id: id,
          email: email,
          name: name,
          isMember: isMember,
          isPending: isPending,
          sub: event.sub,
          isAdmin: isAdmin));
    });
  }
}

String validationLogin(GetLogin data) {
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email-id';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }

  return '';
}

String validationSignup(GetSignup data) {
  if (data.fullname?.isEmpty == true) {
    return 'Please Enter Your Fullname';
  }
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email-id';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }

  return '';
}

emptyStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

setUserValuesSF(
    GetLogin event, String id, name, ismember, sub, isPending, isAdmin) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isPending', isPending);
  prefs.setString('sub', sub);
  prefs.setString('id', id);
  prefs.setString('name', name);
  prefs.setBool('isMember', ismember);
  prefs.setString('email', event.email.toString());
  prefs.setString('password', event.password.toString());
  prefs.setBool('isAdmin', isAdmin);
}
