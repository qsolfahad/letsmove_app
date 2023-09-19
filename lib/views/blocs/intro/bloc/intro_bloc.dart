import 'package:bloc/bloc.dart';
import 'package:letsmove_app/model/data/intro.dart';
import 'package:letsmove_app/model/data/firebaseServices.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroState(counter: 0)) {
  
    on<CounterPage>((event, emit) async {
      emit(IntroState(counter: state.counter));
      
    });
  }
}
