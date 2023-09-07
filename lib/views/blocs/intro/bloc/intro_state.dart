part of 'intro_bloc.dart';

abstract class IntroState {}

class IntroInitial extends IntroState  {}
class IntroStateLoading extends IntroState {}

class IntroLoaded extends IntroState {
  final List<IntroModel> data;

  IntroLoaded(this.data);
}
