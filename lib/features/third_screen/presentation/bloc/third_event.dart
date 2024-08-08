part of 'third_bloc.dart';

@immutable
abstract class ThirdEvent extends Equatable {
  const ThirdEvent();

  @override
  List<Object> get props => [];
}

class ThirdEventLoadUsers extends ThirdEvent {
  const ThirdEventLoadUsers();

  @override
  List<Object> get props => [];
}

class ThirdEventResetUsers extends ThirdEvent {
  const ThirdEventResetUsers();

  @override
  List<Object> get props => [];
}
