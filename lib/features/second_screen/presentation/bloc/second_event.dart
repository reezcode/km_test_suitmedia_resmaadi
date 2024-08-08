part of 'second_bloc.dart';

@immutable
abstract class SecondEvent extends Equatable {
  const SecondEvent();

  @override
  List<Object> get props => [];
}

class SecondEventLoadUsers extends SecondEvent {
  const SecondEventLoadUsers();

  @override
  List<Object> get props => [];
}

class SecondEventAddUser extends SecondEvent {
  final User user;

  const SecondEventAddUser(this.user);

  @override
  List<Object> get props => [user];
}
