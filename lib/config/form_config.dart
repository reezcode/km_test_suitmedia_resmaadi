import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:remixicon/remixicon.dart';

import '../core/enums/form_type.dart';
import '../shared/models/form_model.dart';

class FormConfig {
  List<RsFormModel> get firstForm => [
        RsFormModel(
            formType: FormType.text,
            field: 'name',
            props: FieldProps(hint: 'Name', fieldType: FieldType.filled),
            modifier: FieldModifier(
                controller: TextEditingController(),
                icon: Remix.user_line,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]))),
        RsFormModel(
            formType: FormType.text,
            field: 'palindrome',
            props: FieldProps(hint: 'Palindrome', fieldType: FieldType.filled),
            modifier: FieldModifier(
                controller: TextEditingController(),
                icon: Remix.code_line,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]))),
      ];
}
