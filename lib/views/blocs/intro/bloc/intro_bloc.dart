import 'package:bloc/bloc.dart';
import 'package:letsmove_app/model/data/intro.dart';
import 'package:letsmove_app/model/data/firebaseServices.dart';

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
    on<CounterPage>((event, emit) async {
      emit(IntroState(counter: state.counter));
    });
  }
}
