part of 'member_bloc.dart';

@immutable
abstract class MemberEvent {}

class LoadMemberData extends MemberEvent {}

class AddMember extends MemberEvent {
  String id;
  AddMember(this.id);
}

class RemoveMember extends MemberEvent {
   String id;
  RemoveMember(this.id);
}

