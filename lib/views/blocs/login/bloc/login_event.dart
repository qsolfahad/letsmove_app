part of 'login_bloc.dart';
@immutable
abstract class LoginEvent {}
//event for GetUserLogin
class GetLogin extends LoginEvent {
String? email;
String? password;
GetLogin({this.email, this.password});
}