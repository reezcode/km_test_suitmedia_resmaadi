import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/core/di/service_locator.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/domain/use_cases/get_users_usecase.dart';
import 'package:km_test_suitmedia_resmaadi/shared/models/user_model.dart';

import '../../../../core/enums/status_enum.dart';

part 'third_event.dart';
part 'third_state.dart';

class ThirdBloc extends Bloc<ThirdEvent, ThirdState> {
  List<User> users = [];
  int page = 1;
  bool hasReachedMax = false;

  ThirdBloc() : super(ThirdState.initial()) {
    on<ThirdEventLoadUsers>(_onLoadUsers);
    on<ThirdEventResetUsers>(_onResetUsers);
  }

  Future<void> _onLoadUsers(
    ThirdEventLoadUsers event,
    Emitter<ThirdState> emit,
  ) async {
    if (state.status == Status.loading || hasReachedMax) return;
    emit(state.copyWith(status: Status.loading));
    try {
      final res = await getIt<GetUsersUsecase>().call(page: page, perPage: 10);
      res.fold((l) => emit(state.copyWith(status: Status.error, msg: l)), (r) {
        if (r.isEmpty) {
          hasReachedMax = true;
          emit(state.copyWith(
              status: Status.loaded,
              users: users,
              hasReachedMax: hasReachedMax));
        } else {
          users.addAll(r);
          page++;
          emit(state.copyWith(
              status: Status.loaded,
              users: users,
              hasReachedMax: r.length < 10));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        msg: e.toString(),
      ));
    }
  }

  Future<void> _onResetUsers(
    ThirdEventResetUsers event,
    Emitter<ThirdState> emit,
  ) async {
    users = [];
    page = 1;
    hasReachedMax = false;
    emit(state.copyWith(
        status: Status.initial, users: users, hasReachedMax: hasReachedMax));
  }
}
