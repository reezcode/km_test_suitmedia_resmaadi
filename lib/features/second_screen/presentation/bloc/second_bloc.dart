import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/shared/models/user_model.dart';

import '../../../../core/enums/status_enum.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  final List<User> users = [];
  final List<int> selectedUsers = [];

  SecondBloc() : super(SecondState.initial()) {
    on<SecondEventLoadUsers>(_onLoadUsers);
    on<SecondEventAddUser>(_onAddUser);
  }

  Future<void> _onLoadUsers(
    SecondEventLoadUsers event,
    Emitter<SecondState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      emit(state.copyWith(
          status: Status.loaded, users: users, selectedUsers: selectedUsers));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        msg: e.toString(),
      ));
    }
  }

  Future<void> _onAddUser(
    SecondEventAddUser event,
    Emitter<SecondState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      if (selectedUsers.contains(event.user.id)) {
        selectedUsers.remove(event.user.id);
        users.remove(
          users.firstWhere((element) => element.id == event.user.id),
        );
      } else {
        selectedUsers.add(event.user.id!);
        users.add(event.user);
      }
      emit(state.copyWith(
        status: Status.loaded,
        users: users,
        selectedUsers: selectedUsers,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        msg: e.toString(),
      ));
    }
  }
}
