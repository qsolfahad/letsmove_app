import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    on<GetLogin>(_getLogin);
    on<GetSignup>(_getSignUp);
    on<LoadUserDetail>(_loadData);
    on<UpdateMember>(_updateMember);
  }
}

_loadData(LoadUserDetail event, Emitter emit) async {
  _requestPermission();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.getString('name')!;
  String id = prefs.getString('id')!;
  String email = prefs.getString('email')!;
  bool isMember = prefs.getBool('isMember')!;
  bool? isPending = prefs.getBool('isPending')!;
  bool? isAdmin = prefs.getBool('isAdmin');
  _getToken(id);
  emit(GetUserDetails(
      id: id,
      email: email,
      name: name,
      isMember: isMember,
      isPending: isPending,
      isAdmin: isAdmin));
}

_updateMember(UpdateMember event, Emitter emit) async {
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
}

_getSignUp(GetSignup event, Emitter emit) async {
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
        emit(SignupValidation(error.toString()));
      });
    }
  }
}

_requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('user granted Permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('user granted Provisional Permission');
  } else {
    print('user declined');
  }
}

_getToken(id) async {
  await FirebaseMessaging.instance
      .getToken()
      .then((value) => _saveToken(value, id));
}

_saveToken(token, id) async {
  FirebaseFirestore.instance
      .collection('userToken')
      .doc(id)
      .set({'token': token});
}

_getLogin(GetLogin event, Emitter emit) async {
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
        setUserValuesSF(event, querySnapshot.docs.first.id, name, isMember, sub,
            isPending, isAdmin);
      }).catchError((error) {
        print(error);
        isAuthenticated = false;
      });
      await Future.delayed(const Duration(seconds: 3), () async {
        print('delay check'+isAuthenticated.toString());
        if (isAuthenticated) {
          emit(LoginLoaded());
          print('emiited');
        } else {
          emit(LoginValidation("There is no user exist"));
        }
        //if credentials matches then loaded state emitted
      }).onError((error, stackTrace) {
        emit(LoginValidation(error.toString()));
      });
    }
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
