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
      final todos = await _firestoreService.mapEventToState().first;
    });
  }
}

class FirestoreService {
  Stream<IntroState> mapEventToState() async* {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    print('ins');
    //if (event is IntroLoaded) {
    yield IntroStateLoading();
    try {
      final querySnapshot = await firestore.collection('intro').get();
      // yield IntroLoaded(querySnapshot.docs.map((doc) {
      //   final data = doc.data() as Map<String, dynamic>;
      //   // print('ins'+data['title']);
      //   //return IntroModel(
      //   //   title: data['title'], body: data['body'], image: data['image']);
      //   return IntroModel(title: 'hello', body: 'word', image: 'dsja');
      // }).toList());
      yield IntroLoaded([IntroModel(title: 'hello', body: 'word', image: 'dsja')]);
    } catch (e) {
      // Handle errors
    }
    //}
  }
}
