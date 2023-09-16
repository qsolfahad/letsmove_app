part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class GetLogin extends AuthEvent {
  String? email;
  String? password;
  GetLogin({this.email, this.password});
}

class LoadUserDetail extends AuthEvent {}

class UpdateMember extends AuthEvent {
  String id;
  String sub;
  UpdateMember(this.id, this.sub);
}

class GetSignup extends AuthEvent {
  String? fullname;
  String? email;
  String? password;
  bool? isPending;
  bool? isAdmin;
  bool? isMemberShipAllow;
  GetSignup(
      {this.email,
      this.password,
      this.fullname,
      this.isMemberShipAllow,
      this.isAdmin,
      this.isPending});
}
