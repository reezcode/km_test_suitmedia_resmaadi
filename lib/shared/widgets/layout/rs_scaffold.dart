import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/gap_x.dart';

import '../../../core/enums/navbar_enum.dart';
import '../../models/navigation_item.dart';
import '../base/card.dart';
import '../base/screen.dart';

class RsScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final AppBar? appBar;
  final bool? useNavbar;
  final NavbarType? navbarType;
  final ImageProvider? backgroundImage;
  final EdgeInsetsGeometry? padding;
  final List<NavigationItem>? navigationItems;
  final List<Widget>? pages;
  final Function(int)? onPageChanged;
  final Widget? bottomWidget;
  final Widget body;
  final bool useSafeArea;
  const RsScaffold(
      {super.key,
      this.backgroundColor,
      this.appBar,
      required this.useSafeArea,
      this.useNavbar,
      this.padding,
      this.navbarType,
      required this.body,
      this.navigationItems,
      this.backgroundImage,
      this.onPageChanged,
      this.bottomWidget,
      this.pages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: BaseLayout(
          body: useSafeArea ? SafeArea(child: body) : body,
          useNavbar: useNavbar,
          navbarType: navbarType,
          navigationItems: navigationItems,
          pages: pages,
          padding: padding,
          backgroundImage: backgroundImage,
          onPageChanged: onPageChanged,
          bottomWidget: bottomWidget,
        ));
  }
}

class BaseLayout extends StatefulWidget {
  final ImageProvider? backgroundImage;
  final NavbarType? navbarType;
  final bool? useNavbar;
  final EdgeInsetsGeometry? padding;
  final List<NavigationItem>? navigationItems;
  final List<Widget>? pages;
  final Function(int)? onPageChanged;
  final Widget? bottomWidget;
  final Widget body;

  const BaseLayout(
      {super.key,
      this.backgroundImage,
      this.navbarType,
      this.padding,
      this.useNavbar,
      this.navigationItems,
      required this.body,
      this.onPageChanged,
      this.bottomWidget,
      this.pages});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  late int _selectedIdx;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _selectedIdx = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: RsScreen.w,
      height: RsScreen.h,
      padding: widget.padding,
      decoration: BoxDecoration(
          image: widget.backgroundImage != null
              ? DecorationImage(
                  image: widget.backgroundImage!, fit: BoxFit.cover)
              : null),
      child: Stack(
        children: [
          (widget.useNavbar ?? false)
              ? PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _selectedIdx = value;
                    });
                    widget.onPageChanged!(value);
                  },
                  children: widget.pages!,
                )
              : widget.body,
          (widget.bottomWidget != null)
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.bottomWidget,
                )
              : const SizedBox(),
          (widget.useNavbar ?? false)
              ? switch (widget.navbarType) {
                  NavbarType.google => Container(),
                  NavbarType.common => Align(
                      alignment: Alignment.bottomCenter,
                      child: RsCard(
                          color: context.colorScheme.primary,
                          margin: EdgeInsets.all(16.w),
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          radius: 100,
                          width: RsScreen.w,
                          height: 55.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: widget.navigationItems!
                                .map((e) => Expanded(
                                      flex: 1,
                                      child: RsCard(
                                          height: 40.w,
                                          radius: 100,
                                          onTap: () {
                                            setState(() {
                                              _selectedIdx = e.idx;
                                              _pageController.jumpToPage(e.idx);
                                            });
                                            widget.onPageChanged!(e.idx);
                                          },
                                          color: _selectedIdx == e.idx
                                              ? context.colorScheme.onPrimary
                                              : context.colorScheme.primary,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                e.icon,
                                                size: 21.sp,
                                                color: _selectedIdx == e.idx
                                                    ? context
                                                        .colorScheme.primary
                                                    : context
                                                        .colorScheme.onPrimary,
                                              ),
                                              1.gH,
                                              Text(e.title,
                                                  style: context
                                                      .textTheme.displaySmall!
                                                      .copyWith(
                                                          fontSize: 9.sp,
                                                          color: _selectedIdx ==
                                                                  e.idx
                                                              ? context
                                                                  .colorScheme
                                                                  .primary
                                                              : context
                                                                  .colorScheme
                                                                  .onPrimary))
                                            ],
                                          )),
                                    ))
                                .toList(),
                          ))),
                  null => const SizedBox(),
                }
              : const SizedBox()
        ],
      ),
    );
  }
}
