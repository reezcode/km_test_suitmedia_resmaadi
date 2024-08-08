import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/core/di/service_locator.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/domain/use_cases/is_palindrome_usecase.dart';

import '../../../../core/enums/status_enum.dart';

part 'first_event.dart';
part 'first_state.dart';

class FirstBloc extends Bloc<FirstEvent, FirstState> {
  FirstBloc() : super(FirstState.initial()) {
    on<FirstEventPalindrome>(_onPalindromeCheck);
  }

  Future<void> _onPalindromeCheck(
    FirstEventPalindrome event,
    Emitter<FirstState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final res = await getIt<IsPalindromeUsecase>().call(event.text);
      res.fold((l) => emit(state.copyWith(status: Status.error, msg: l)),
          (r) => emit(state.copyWith(status: Status.loaded, isPalindrome: r)));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        msg: e.toString(),
      ));
    }
  }
}
