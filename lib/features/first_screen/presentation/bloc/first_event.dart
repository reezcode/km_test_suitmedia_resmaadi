part of 'first_bloc.dart';

@immutable
abstract class FirstEvent extends Equatable {
  const FirstEvent();

  @override
  List<Object> get props => [];
}

class FirstEventPalindrome extends FirstEvent {
  final String text;
  const FirstEventPalindrome(this.text);

  @override
  List<Object> get props => [text];
}
