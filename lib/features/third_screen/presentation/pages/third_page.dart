import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/di/service_locator.dart';
import 'package:km_test_suitmedia_resmaadi/core/enums/status_enum.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/completer_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:km_test_suitmedia_resmaadi/features/second_screen/presentation/bloc/second_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/presentation/bloc/third_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../shared/widgets/layout/rs_scaffold.dart';

@RoutePage()
class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final ScrollController _scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    initData();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void initData() {
    const ThirdEventLoadUsers().runAsync(getIt<ThirdBloc>());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    const ThirdEventResetUsers().runAsync(getIt<ThirdBloc>());
    super.dispose();
  }

  void onRefresh() async {
    initData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

  void _onScroll() {
    if (_isBottom && !getIt<ThirdBloc>().state.hasReachedMax!) {
      initData();
      _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent + 100);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return RsScaffold(
        useSafeArea: false,
        backgroundColor: context.colorScheme.surfaceContainerLowest,
        appBar: AppBar(
          title: Text(
            "Choose User",
            style: context.textTheme.displaySmall!.copyWith(fontSize: 16.sp),
          ),
          backgroundColor: context.colorScheme.surfaceContainerLowest,
          foregroundColor: context.colorScheme.primary,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: Colors.black12,
                height: 1.0,
              )),
        ),
        body: BlocListener<ThirdBloc, ThirdState>(
          listener: (context, state) {
            if (state.hasReachedMax!) {
              _scrollController.removeListener(_onScroll);
            }
          },
          child: BlocBuilder<ThirdBloc, ThirdState>(
            builder: (context, state) => switch (state.status) {
              Status.initial => const Center(
                  child: CircularProgressIndicator(),
                ),
              Status.loading => const Center(
                  child: CircularProgressIndicator(),
                ),
              Status.loaded => (state.users!.isNotEmpty)
                  ? SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: false,
                      header: BezierHeader(
                        bezierColor: context.colorScheme.primary,
                      ),
                      controller: refreshController,
                      onRefresh: onRefresh,
                      onLoading: onLoading,
                      child: ListView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: state.users!.length,
                        itemBuilder: (context, index) {
                          final user = state.users![index];
                          return BlocBuilder<SecondBloc, SecondState>(
                              builder: (context, state) => ListTile(
                                    selected:
                                        state.selectedUsers!.contains(user.id),
                                    selectedTileColor: context
                                        .colorScheme.primary
                                        .withOpacity(0.2),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 2.h),
                                    shape: const Border(
                                      bottom: BorderSide(color: Colors.black12),
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(user.avatar!),
                                    ),
                                    title: Text(
                                      '${user.firstName!} ${user.lastName!}',
                                      style: context.textTheme.displaySmall!
                                          .copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    subtitle: Text(user.email!),
                                    onTap: () {
                                      getIt<SecondBloc>()
                                          .add(SecondEventAddUser(user));
                                    },
                                  ));
                        },
                      ),
                    )
                  : const Center(
                      child: Text('No data found'),
                    ),
              Status.error => Center(
                  child: Text(state.msg!),
                ),
            },
          ),
        ));
  }
}
