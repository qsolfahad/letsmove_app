part of 'intro_bloc.dart';

 class IntroState {
  int counter = 0;
  IntroState({this.counter = 0});
}

class IntroInitial extends IntroState {}

class IntroStateLoading extends IntroState {}

class IntroLoaded extends IntroState {
  final List<IntroModel> data;

  IntroLoaded(this.data);
}
