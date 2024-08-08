// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/first_screen/domain/repositories/palindrome_repository.dart'
    as _i583;
import '../../features/first_screen/domain/use_cases/is_palindrome_usecase.dart'
    as _i838;
import '../../features/first_screen/presentation/bloc/first_bloc.dart' as _i395;
import '../../features/second_screen/presentation/bloc/second_bloc.dart'
    as _i252;
import '../../features/third_screen/domain/repositories/user_repository.dart'
    as _i30;
import '../../features/third_screen/domain/use_cases/get_users_usecase.dart'
    as _i740;
import '../../features/third_screen/presentation/bloc/third_bloc.dart' as _i487;
import '../../routes/app_router.dart' as _i974;
import '../services/context_provider.dart' as _i210;
import 'register_module.dart' as _i291;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i210.AppContext>(() => registerModule.appContext);
  gh.singleton<_i395.FirstBloc>(() => registerModule.firstBloc);
  gh.singleton<_i252.SecondBloc>(() => registerModule.secondBloc);
  gh.singleton<_i487.ThirdBloc>(() => registerModule.thirdBloc);
  gh.lazySingleton<_i583.PalindromeRepository>(
      () => registerModule.palindromeRepository);
  gh.lazySingleton<_i30.UserRepository>(() => registerModule.userRepository);
  gh.lazySingleton<_i838.IsPalindromeUsecase>(
      () => registerModule.isPalindromeUsecase);
  gh.lazySingleton<_i740.GetUsersUsecase>(() => registerModule.getUsersUsecase);
  gh.lazySingleton<_i974.AppRouter>(() => _i974.AppRouter());
  return getIt;
}

class _$RegisterModule extends _i291.RegisterModule {
  @override
  _i210.AppContext get appContext => _i210.AppContext();
}
