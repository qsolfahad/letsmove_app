part of 'member_bloc.dart';

@immutable
abstract class MemberEvent {}

class LoadMemberData extends MemberEvent {}

// ignore: must_be_immutable
class AddMember extends MemberEvent {
  String id;
  AddMember(this.id);
}

// ignore: must_be_immutable
class RemoveMember extends MemberEvent {
   String id;
  RemoveMember(this.id);
}

