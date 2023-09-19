part of 'auth_bloc.dart';

@immutable
class AuthState {}

class AuthInitial extends AuthState {}

class LoginValidation extends AuthState {
  String? value;
  LoginValidation(this.value);
}

class LoginLoading extends AuthState {}

class LoginLoaded extends AuthState {}

// ignore: must_be_immutable

// ignore: must_be_immutable
class SignupValidation extends AuthState {
  String? value;
  SignupValidation(this.value);
}

// ignore: must_be_immutable
class GetUserDetails extends AuthState {
  String? id;
  String? email;
  String? name;
  String? sub;
  bool? isMember;
  bool? isPending;
  bool? isAdmin;

  GetUserDetails(
      {this.id,
      this.email,
      this.name,
      this.sub,
      this.isMember,
      this.isPending,
      this.isAdmin});

  GetUserDetails copyWith(
      {String? id,
      String? email,
      String? name,
      String? sub,
      bool? isMember,
      bool? isPending,
      bool? isAdmin}) {
    return GetUserDetails(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        sub: sub ?? this.sub,
        isMember: isMember ?? this.isMember,
        isPending: isPending ?? this.isPending,
        isAdmin: isAdmin ?? this.isAdmin);
  }
}

class SignupLoading extends AuthState {}

class SignupLoaded extends AuthState {}
