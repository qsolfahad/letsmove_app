import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'option_event.dart';
part 'option_state.dart';

class OptionBloc extends Bloc<OptionEvent, OptionState> {
  OptionBloc() : super(OptionInitial()) {
    on<OptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
