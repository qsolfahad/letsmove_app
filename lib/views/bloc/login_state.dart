part of 'login_bloc.dart';
@immutable
abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginValidation extends LoginState {
String? value;
LoginValidation(this.value);
}
class LoginLoading extends LoginState {}
class LoginLoaded extends LoginState {}
class LoginError extends LoginState {
String? error;
LoginError(this.error);
}