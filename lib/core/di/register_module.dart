import 'package:injectable/injectable.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/data/repositories/palindrome_impl.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/domain/repositories/palindrome_repository.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/domain/use_cases/is_palindrome_usecase.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/presentation/bloc/first_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/features/second_screen/presentation/bloc/second_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/data/repositories/user_impl.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/domain/repositories/user_repository.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/domain/use_cases/get_users_usecase.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/presentation/bloc/third_bloc.dart';

import '../services/context_provider.dart';
import 'service_locator.dart';

@module
abstract class RegisterModule {
  // CONTEXT PROVIDER

  @singleton
  AppContext get appContext;

  // BLOC PROVIDER
  @singleton
  FirstBloc get firstBloc => FirstBloc();

  @singleton
  SecondBloc get secondBloc => SecondBloc();

  @singleton
  ThirdBloc get thirdBloc => ThirdBloc();

  // REPOSITORY
  @lazySingleton
  PalindromeRepository get palindromeRepository => PalindromeImpl();

  @lazySingleton
  UserRepository get userRepository => UserImpl();

  // USECASE
  @lazySingleton
  IsPalindromeUsecase get isPalindromeUsecase => IsPalindromeUsecase(getIt());

  @lazySingleton
  GetUsersUsecase get getUsersUsecase => GetUsersUsecase(getIt());
}
