import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/core/enums/status_enum.dart';

import '../di/service_locator.dart';

extension CompleterX on Equatable {
  Future<void> runAsync<T extends Bloc>(T bloc) async {
    final completer = Completer<void>();
    final subscription = getIt<T>().stream.listen((state) {
      if (state.status == Status.loaded || state.status == Status.error) {
        completer.complete();
      }
    });
    getIt<T>().add(this);
    await completer.future;
    await subscription.cancel();
  }
}
