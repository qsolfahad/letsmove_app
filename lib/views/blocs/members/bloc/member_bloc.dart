import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/data/member.dart';
import '../../../../model/data/firebaseServices.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final FirestoreService _firestoreService;
  MemberBloc(this._firestoreService) : super(MemberInitial()) {
    on<LoadMemberData>((event, emit) async {
      emit(MemberStateLoading());
      final todos = await _firestoreService.getMembers().first;
      emit(MemberLoaded(todos));
    });
    on<AddMember>((event, emit) async {
      emit(MemberStateLoading());
      await _firestoreService.addMember(event.id);
      final todos = await _firestoreService.getMembers().first;
      emit(MemberLoaded(todos));
    });
    on<RemoveMember>((event, emit) async {
      emit(MemberStateLoading());
      await _firestoreService.removeMember(event.id);
      final todos = await _firestoreService.getMembers().first;
      emit(MemberLoaded(todos));
    });
  }
}
