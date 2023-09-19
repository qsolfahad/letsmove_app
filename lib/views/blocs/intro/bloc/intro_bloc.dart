import 'package:bloc/bloc.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroState(counter: 0)) {
  
    on<CounterPage>((event, emit) async {
      emit(IntroState(counter: state.counter));
      
    });
  }
}
