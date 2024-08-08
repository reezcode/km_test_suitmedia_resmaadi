part of 'second_bloc.dart';

class SecondState extends Equatable {
  final Status status;
  final String? msg;
  final List<User>? users;
  final List<int>? selectedUsers;

  const SecondState(
      {required this.status, this.msg, this.users, this.selectedUsers});

  static SecondState initial() {
    return const SecondState(
        status: Status.initial, msg: null, users: null, selectedUsers: null);
  }

  SecondState copyWith(
      {Status? status,
      String? msg,
      List<User>? users,
      List<int>? selectedUsers}) {
    return SecondState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      users: users ?? this.users,
      selectedUsers: selectedUsers ?? this.selectedUsers,
    );
  }

  @override
  List<Object?> get props => [status, msg, users, selectedUsers];
}
