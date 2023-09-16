part of 'member_bloc.dart';

@immutable
abstract class MemberState {}

 class MemberInitial extends MemberState {}
class MemberStateLoading extends MemberState {}

class MemberLoaded extends MemberState {
  final List<MemberModel> data;

  MemberLoaded(this.data);
}

