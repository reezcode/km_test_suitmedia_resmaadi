// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/gap_x.dart';
import 'package:toastification/toastification.dart';

import '../../../core/enums/form_action.dart';
import '../../../core/enums/form_type.dart';
import '../../../core/types/fold.dart';
import '../../models/form_model.dart';
import '../base/button.dart';
import '../base/screen.dart';
import '../base/toast.dart';
import 'text_field.dart';

class RsFormBuilder extends StatelessWidget {
  final RsFormModel config;
  final Function(dynamic) onChanged;
  final TextEditingController controller;
  const RsFormBuilder({
    super.key,
    required this.config,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (config.formType == FormType.text) {
      return RsTextField(
          name: config.field,
          controller: controller,
          hint: config.props.hint,
          label: config.props.label,
          fieldType: config.props.fieldType,
          onChanged: onChanged,
          maxLines: config.props.maxLines,
          validator: config.modifier?.validator,
          bottomMargin: config.modifier?.marginBottom,
          keyboardType: config.props.keyboardType,
          isRequired: config.props.required,
          icon: config.modifier?.icon);
    } else {
      return const SizedBox();
    }
  }
}

class RsFormContainer extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final FormAction action;
  final Fold<Future<void> Function(Map<String, dynamic>)>? onCreate;
  final Fold<Future<void> Function(Map<String, dynamic>)>? onUpdate;
  final Fold<Future<void> Function(Map<String, dynamic>)>? onRead;
  final List<RsFormModel> config;
  final Fold<String>? buttonText;
  final Fold<IconData>? icon;
  final String? title;
  final bool stickyButton;
  const RsFormContainer({
    super.key,
    this.margin,
    this.padding,
    required this.action,
    this.onCreate,
    this.onUpdate,
    this.onRead,
    required this.config,
    this.buttonText,
    this.icon,
    required this.stickyButton,
    this.title,
  });

  @override
  State<RsFormContainer> createState() => _RsFormContainerState();
}

class _RsFormContainerState extends State<RsFormContainer> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  late bool isValid;
  late bool isVerified;
  late bool isRemember;
  Map<String, TextEditingController> controllers = {};
  Map<String, dynamic> data = {};

  @override
  void initState() {
    isValid = false;
    isVerified = false;
    isRemember = false;
    initController();
    super.initState();
  }

  void formKeyChecker() {
    setState(() {
      isValid = _formKey.currentState?.validate(
              focusOnInvalid: false, autoScrollWhenFocusOnInvalid: true) ??
          false;
    });
  }

  void initController() {
    for (var element in widget.config) {
      controllers[element.field] =
          element.modifier?.controller ?? TextEditingController();
    }
  }

  @override
  void dispose() {
    controllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  Widget buildFieldForm() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...widget.config.map((e) => Visibility(
            visible: e.dependency != null
                ? e.dependency!.visibility.validator(controllers)
                : true,
            child: RsFormBuilder(
              config: e,
              controller: controllers[e.field] ?? TextEditingController(),
              onChanged: (p) {
                e.modifier?.onChanged?.call(p);
                formKeyChecker();
              },
            ),
          )),
      8.gH,
    ]);
  }

  Widget buildButton() {
    return Column(
      children: [
        RsButton(
            radius: 12.w,
            width: RsScreen.w,
            buttonColor: isValid
                ? context.colorScheme.primary
                : context.colorScheme.surface,
            splashColor: context.colorScheme.secondary,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(widget.buttonText!.left ?? '',
                  style: context.textTheme.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    color: isValid
                        ? context.colorScheme.surfaceContainerLowest
                        : context.colorScheme.surfaceContainerHighest,
                  )),
              if (widget.icon != null)
                Row(
                  children: [
                    8.gW,
                    Icon(
                      widget.icon!.left,
                      color: isValid
                          ? context.colorScheme.surfaceContainerLowest
                          : context.colorScheme.surfaceContainerHighest,
                    ),
                  ],
                ),
            ]),
            onTap: () async {
              if (_formKey.currentState!.saveAndValidate()) {
                data.addAll(_formKey.currentState!.value);
                switch (widget.action) {
                  case FormAction.create:
                    await widget.onCreate!.left!(data);
                    break;
                  case FormAction.update:
                    await widget.onUpdate!.left!(data);
                    break;
                  case FormAction.read:
                    await widget.onRead!.left!(data);
                    break;
                  default:
                    await widget.onRead!.left!(data);
                }
              } else {
                RsToast.show(ToastificationType.error, 'Warning ⚠️',
                    'There are some invalid fields');
              }
            }),
        16.gH,
        RsButton(
            radius: 12.w,
            width: RsScreen.w,
            buttonColor: isValid
                ? context.colorScheme.primary
                : context.colorScheme.surface,
            splashColor: context.colorScheme.secondary,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(widget.buttonText!.right ?? '',
                  style: context.textTheme.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    color: isValid
                        ? context.colorScheme.surfaceContainerLowest
                        : context.colorScheme.surfaceContainerHighest,
                  )),
              if (widget.icon != null)
                Row(
                  children: [
                    8.gW,
                    Icon(
                      widget.icon!.right,
                      color: isValid
                          ? context.colorScheme.surfaceContainerLowest
                          : context.colorScheme.surfaceContainerHighest,
                    ),
                  ],
                ),
            ]),
            onTap: () async {
              if (_formKey.currentState!.saveAndValidate()) {
                data.addAll(_formKey.currentState!.value);
                switch (widget.action) {
                  case FormAction.create:
                    await widget.onCreate!.right!(data);
                    break;
                  case FormAction.update:
                    await widget.onUpdate!.right!(data);
                    break;
                  case FormAction.read:
                    await widget.onRead!.right!(data);
                    break;
                  default:
                    await widget.onRead!.right!(data);
                }
              } else {
                RsToast.show(ToastificationType.error, 'Warning ⚠️',
                    'There are some invalid fields');
              }
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.margin,
        padding: widget.padding,
        child: FormBuilder(
          key: _formKey,
          child: widget.stickyButton
              ? Stack(
                  children: [
                    if (widget.title != null)
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          widget.title!,
                          style: context.textTheme.displayMedium!
                              .copyWith(fontSize: 16.sp),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: widget.title != null ? 32.w : 0),
                      child: buildFieldForm(),
                    ),
                    if (widget.buttonText != null)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 8.w),
                            child: buildButton()),
                      )
                  ],
                )
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  buildFieldForm(),
                  16.gH,
                  if (widget.buttonText != null) buildButton()
                ]),
        ));
  }
}
