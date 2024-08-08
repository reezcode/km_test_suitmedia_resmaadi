// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/gap_x.dart';

import '../../../core/enums/form_type.dart';
import '../../../utils/decoration.dart';

class RsTextField extends StatefulWidget {
  final String? label;
  final String name;
  final String? hint;
  final IconData? icon;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextEditingController controller;
  final FieldType? fieldType;
  final int? maxLines;
  final double? bottomMargin;
  final TextInputType? keyboardType;
  final bool? isRequired;
  const RsTextField({
    super.key,
    this.label,
    required this.name,
    this.hint,
    this.icon,
    this.validator,
    this.onChanged,
    this.fieldType,
    this.maxLines,
    this.bottomMargin,
    required this.controller,
    this.keyboardType,
    this.isRequired,
  });

  @override
  State<RsTextField> createState() => _RsTextFieldState();
}

class _RsTextFieldState extends State<RsTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: widget.bottomMargin ?? 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widget.label != null)
                ? Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.label ?? '',
                            style: context.textTheme.displaySmall!
                                .copyWith(fontSize: 12.sp),
                          ),
                          if (widget.isRequired ?? false)
                            Text(
                              ' *',
                              style: context.textTheme.displaySmall!
                                  .copyWith(fontSize: 12.sp, color: Colors.red),
                            ),
                        ],
                      ),
                      12.gH,
                    ],
                  )
                : const SizedBox(),
            FormBuilderTextField(
              name: widget.name,
              style: context.textTheme.bodyMedium,
              onChanged: widget.onChanged,
              validator: widget.validator,
              cursorColor: context.colorScheme.primary,
              maxLines: widget.maxLines ?? 1,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              decoration: switch (widget.fieldType ?? FieldType.outline) {
                FieldType.outline => RsInputDecoration.defaultDecoration(
                    hint: widget.hint,
                    icon: widget.icon,
                    label: widget.label ?? ""),
                FieldType.filled => RsInputDecoration.filledDecoration(
                    hint: widget.hint,
                    icon: widget.icon,
                    label: widget.label ?? ""),
                FieldType.rounded => RsInputDecoration.filledRoundedDecoration(
                    hint: widget.hint,
                    icon: widget.icon,
                    label: widget.label ?? ""),
              },
            ),
          ],
        ));
  }
}
