import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';

class RsButton extends StatefulWidget {
  const RsButton({
    super.key,
    required this.child,
    required this.onTap,
    this.buttonColor,
    this.splashColor,
    this.height = 50,
    this.radius = 40,
    this.width = 200,
    this.margin = const EdgeInsets.all(0),
    this.isDisabled,
    this.disabledColor,
  });

  final Widget child;
  final Future<void> Function() onTap;
  final Color? buttonColor, splashColor;
  final double height, radius, width;
  final EdgeInsets margin;
  final bool? isDisabled;
  final Color? disabledColor;

  @override
  State<RsButton> createState() => _RsButtonState();
}

class _RsButtonState extends State<RsButton> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleTap() async {
    setState(() {
      isLoading = true;
    });
    try {
      await widget.onTap();
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.height.w,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.isDisabled ?? false
            ? widget.disabledColor ?? context.colorScheme.onPrimaryContainer
            : widget.buttonColor,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.radius),
          splashColor: widget.splashColor,
          onTap: widget.isDisabled ?? false ? null : _handleTap,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: context.colorScheme.surfaceContainerLowest,
                    )
                  : widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
