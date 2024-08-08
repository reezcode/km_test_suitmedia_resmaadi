import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/config/form_config.dart';
import 'package:km_test_suitmedia_resmaadi/core/datasource/local_shared.dart';
import 'package:km_test_suitmedia_resmaadi/core/enums/form_action.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/completer_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/gap_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/types/fold.dart';
import 'package:km_test_suitmedia_resmaadi/features/first_screen/presentation/bloc/first_bloc.dart';
import 'package:km_test_suitmedia_resmaadi/routes/router.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/base/button.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/base/card.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/base/dialog.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/base/screen.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/form/form_builder.dart';
import 'package:km_test_suitmedia_resmaadi/shared/widgets/layout/rs_scaffold.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../core/enums/status_enum.dart';

@RoutePage()
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RsScaffold(
        useSafeArea: false,
        backgroundImage: const AssetImage('assets/images/img_bg_first.png'),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: ListView(
            children: [
              100.gH,
              Column(
                children: [
                  RsCard(
                    width: 100.w,
                    height: 100.w,
                    radius: 100.r,
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    child: Center(
                      child: Icon(Remix.user_add_fill,
                          size: 35.sp, color: Colors.white),
                    ),
                  ),
                  42.gH,
                  RsFormContainer(
                      action: FormAction.create,
                      config: FormConfig().firstForm,
                      buttonText: Fold(left: 'Check', right: 'Next'),
                      onCreate: Fold(left: (val) async {
                        await FirstEventPalindrome(val['palindrome'])
                            .runAsync(FirstBloc());
                      }, right: (val) async {
                        LocalDS().saveUser(val['name']);
                        router.pushNamed('/second');
                      }),
                      stickyButton: false),
                  BlocListener<FirstBloc, FirstState>(
                    listener: (context, state) {
                      if (state.status == Status.loaded) {
                        context.showDialog(title: 'Is Palindrome?', children: [
                          Text(
                            state.isPalindrome!
                                ? 'Yes, it is a palindrome'
                                : 'No, it is not a palindrome',
                            style: context.textTheme.headlineSmall!
                                .copyWith(fontSize: 14.sp),
                          ),
                          16.gH,
                          RsButton(
                              width: RsScreen.w,
                              buttonColor: context.colorScheme.primary,
                              child: Text("Close",
                                  style: context.textTheme.displaySmall!
                                      .copyWith(
                                          fontSize: 14.sp,
                                          color: Colors.white)),
                              onTap: () async {
                                router.maybePop();
                              })
                        ]);
                      }
                    },
                    child: const SizedBox(),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
