import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/presentation/bloc/first_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/features/second_screen/presentation/bloc/second_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/presentation/bloc/third_bloc.dart';
import 'package:toastification/toastification.dart';

import 'core/di/service_locator.dart';
import 'core/services/context_provider.dart';
import 'routes/app_router.dart';
import 'utils/fonts.dart';
import 'utils/loader.dart';
import 'utils/theme.dart';

class BaseApp extends StatelessWidget {
  final appRouter = getIt<AppRouter>();
  final appContext = getIt<AppContext>();
  BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    Loader.init(context);
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<FirstBloc>(create: (_) => getIt<FirstBloc>()),
          BlocProvider<SecondBloc>(create: (_) => getIt<SecondBloc>()),
          BlocProvider<ThirdBloc>(create: (_) => getIt<ThirdBloc>())
        ],
        child: ToastificationWrapper(
          child: MaterialApp.router(
            title: 'KM Test Suitmedia',
            debugShowCheckedModeBanner: false,
            theme: theme.light(),
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [AutoRouteObserver()],
            ),
            routeInformationParser: appRouter.defaultRouteParser(),
            builder: (context, child) {
              appContext.context = context;
              return child!;
            },
          ),
        ),
      ),
    );
  }
}
