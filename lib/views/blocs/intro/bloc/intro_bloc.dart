import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsmove_app/model/data/intro.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final FirestoreService _firestoreService;
  IntroBloc(this._firestoreService) : super(IntroInitial()) {
    on<LoadIntroData>((event, emit) async {
      emit(IntroStateLoading());
      final todos = await _firestoreService.getIntro().first;
      emit(IntroLoaded(todos));
    });
  }
}

class FirestoreService {
  Stream<List<IntroModel>> getIntro() {
    final CollectionReference _introCollection =
        FirebaseFirestore.instance.collection('intro');
    return _introCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print(data['title']);
        return IntroModel(
            title: data['title'], body: data['body'], image: data['image']);
      }).toList();
    });
  }
}
