import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/datasource/local_shared.dart';
import 'package:km_test_suitmedia_resmaadi/core/enums/status_enum.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/completer_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/gap_x.dart';
import 'package:km_test_suitmedia_resmaadi/features/second_screen/presentation/bloc/second_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/base/button.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/base/card.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/base/screen.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/layout/rs_scaffold.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../routes/router.dart';

@RoutePage()
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? name;
  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  void initData() async {
    const SecondEventLoadUsers().runAsync(SecondBloc());
    final user = await LocalDS().getUser();
    setState(() {
      name = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RsScaffold(
      useSafeArea: false,
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: Text(
          "Dashboard",
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
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            const Text('Welcome'),
            Text(
              name ?? 'Loading',
              style: context.textTheme.displaySmall!.copyWith(fontSize: 18.sp),
            ),
            16.gH,
            BlocBuilder<SecondBloc, SecondState>(builder: (context, state) {
              return switch (state.status) {
                Status.initial =>
                  const Center(child: CircularProgressIndicator()),
                Status.loading =>
                  const Center(child: CircularProgressIndicator()),
                Status.loaded => (state.users!.isNotEmpty)
                    ? Column(
                        children: state.users!
                            .map((e) => ListTile(
                                  shape: const Border(
                                    bottom: BorderSide(color: Colors.black12),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(e.avatar!),
                                  ),
                                  title: Text(
                                    '${e.firstName!} ${e.lastName!}',
                                    style: context.textTheme.displaySmall!
                                        .copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  subtitle: Text(e.email!),
                                  onTap: () {},
                                ))
                            .toList(),
                      )
                    : RsCard(
                        width: RsScreen.w,
                        height: 100.w,
                        radius: 15.r,
                        color: context.colorScheme.primary.withOpacity(0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Remix.database_fill,
                              color:
                                  context.colorScheme.primary.withOpacity(0.4),
                            ),
                            Text(
                              'No Data',
                              style: context.textTheme.headlineSmall!.copyWith(
                                  fontSize: 12.sp,
                                  color: context.colorScheme.primary
                                      .withOpacity(0.4)),
                            )
                          ],
                        ),
                      ),
                Status.error => const Center(child: Text('Error')),
              };
            })
          ],
        ),
      ),
      bottomWidget: Padding(
        padding: EdgeInsets.all(16.w),
        child: RsButton(
            width: RsScreen.w,
            buttonColor: context.colorScheme.primary,
            child: Text(
              'Choose a User',
              style: context.textTheme.headlineMedium!
                  .copyWith(fontSize: 14.sp, color: Colors.white),
            ),
            onTap: () async {
              router.pushNamed('/third');
            }),
      ),
    );
  }
}
