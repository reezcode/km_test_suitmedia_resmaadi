import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../core/enums/form_type.dart';

class RsFormModel {
  final FormType formType;
  final String field;
  final FieldModifier? modifier;
  final FieldProps props;
  final FieldDependency? dependency;

  RsFormModel(
      {required this.formType,
      required this.field,
      this.modifier,
      required this.props,
      this.dependency});
}

class FieldModifier {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? icon;
  final bool? obscureText;
  final void Function(dynamic)? onChanged;
  final void Function(dynamic)? onSuccess;
  final bool? forgotPassword;
  final void Function()? onForgotPassword;
  final double? marginBottom;

  FieldModifier({
    this.validator,
    this.controller,
    this.icon,
    this.obscureText,
    this.onChanged,
    this.forgotPassword,
    this.marginBottom,
    this.onSuccess,
    this.onForgotPassword,
  });
}

class FieldProps {
  final double? width;
  final double? height;
  final String? hint;
  final String? label;
  final FileType? fileType;
  final List<String>? allowedExtensions;
  final String? getAPI;
  final String? description;
  final List<String>? fields;
  final List<String>? fieldAlias;
  final DateTime? initDateValue;
  final FieldType? fieldType;
  final String? initialValue;
  final int? maxLines;
  final bool? isMulti;
  final TextInputType? keyboardType;
  final OptionsOrientation? optionsOrientation;
  final bool? required;

  FieldProps(
      {this.required,
      this.hint,
      this.label,
      this.fileType,
      this.initialValue,
      this.allowedExtensions,
      this.getAPI,
      this.fields,
      this.maxLines,
      this.fieldType,
      this.fieldAlias,
      this.description,
      this.width,
      this.isMulti,
      this.height,
      this.optionsOrientation,
      this.keyboardType,
      this.initDateValue});
}

class FieldDependency {
  final List<String> field;
  final FieldVisibility visibility;

  FieldDependency({required this.field, required this.visibility});
}

class FieldVisibility {
  final bool Function(Map<String, TextEditingController>) validator;

  FieldVisibility({required this.validator});
}
