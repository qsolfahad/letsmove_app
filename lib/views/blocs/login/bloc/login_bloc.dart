import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_event.dart';
part 'login_state.dart';

String? sfEmail;
String? sfPassword;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
//calling function to get value by SharedPreferences 
 getStringValuesSF();
    on((event, emit) async {
      if (event is GetLogin) {
        String value = validation(event);
        if (value != '') {
          emit(LoginValidation(value.toString()));
        } else {
          emit(LoginLoading());
//holds the user for below given time
          await Future.delayed(const Duration(seconds: 3), () async {
            //if credentials matches then loaded state emitted
            if (event.email == sfEmail && event.password == sfPassword) {
              emit(LoginLoaded());
            }
          }).onError((error, stackTrace) {
            emit(LoginError(error.toString()));
          });
        }
      }
    });
  }
}

//validation for text fields
String validation(GetLogin data) {
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email-id';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }
  print(sfEmail);
  if (data.email != sfEmail) {
    return 'Please enter your valid email id';
  }
  if (data.password != sfPassword) {
    return 'wrong password';
  }
  return '';
}

//function for getting value from SharedPreferences
getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  sfEmail = prefs.getString('email').toString();
  print(sfEmail);
  sfPassword = prefs.getString('password').toString();
}
