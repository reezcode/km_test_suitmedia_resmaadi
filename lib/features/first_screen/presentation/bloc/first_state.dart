part of 'first_bloc.dart';

class FirstState extends Equatable {
  final Status status;
  final String? msg;
  final bool? isPalindrome;

  const FirstState({required this.status, this.msg, this.isPalindrome});

  static FirstState initial() {
    return const FirstState(
        status: Status.initial, msg: null, isPalindrome: null);
  }

  FirstState copyWith({Status? status, String? msg, bool? isPalindrome}) {
    return FirstState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      isPalindrome: isPalindrome ?? this.isPalindrome,
    );
  }

  @override
  List<Object?> get props => [status, msg, isPalindrome];
}
