part of 'third_bloc.dart';

class ThirdState extends Equatable {
  final Status status;
  final String? msg;
  final List<User>? users;
  final bool? hasReachedMax;

  const ThirdState(
      {required this.status, this.msg, this.users, this.hasReachedMax});

  static ThirdState initial() {
    return const ThirdState(
        status: Status.initial, msg: null, users: null, hasReachedMax: false);
  }

  ThirdState copyWith(
      {Status? status, String? msg, List<User>? users, bool? hasReachedMax}) {
    return ThirdState(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        users: users ?? this.users,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object?> get props => [status, msg, users, hasReachedMax];
}
