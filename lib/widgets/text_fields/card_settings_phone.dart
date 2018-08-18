// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../card_settings.dart';

/// This is a phone number field. It's designed for US numbers
class CardSettingsPhone extends StatelessWidget {
  CardSettingsPhone({
    Key key,
    this.label: 'Label',
    this.labelAlign,
    this.contentAlign,
    this.initialValue,
    this.maxLength,
    this.icon,
    this.requiredIndicator,
    this.visible: true,
    this.enabled: true,
    this.autofocus: false,
    this.obscureText: false,
    this.autocorrect: false,
    this.autovalidate: false,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.style,
    this.maxLengthEnforced: true,
    this.onFieldSubmitted,
    this.inputFormatters,
  });

  final String label;
  final TextAlign labelAlign;
  final TextAlign contentAlign;
  final int initialValue;
  final String inputMask = '(000) 000-0000';
  final int maxLength;
  final Icon icon;
  final Widget requiredIndicator;
  final bool visible;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final bool autovalidate;
  final FormFieldValidator<int> validator;
  final FormFieldSetter<int> onSaved;
  final ValueChanged<int> onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextStyle style;
  final bool maxLengthEnforced;
  final ValueChanged<String> onFieldSubmitted;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return CardSettingsText(
      key: key,
      label: label,
      labelAlign: labelAlign,
      contentAlign: contentAlign,
      initialValue: initialValue.toString(),
      inputMask: inputMask,
      maxLength: maxLength,
      icon: icon,
      requiredIndicator: requiredIndicator,
      visible: visible,
      enabled: enabled,
      autofocus: autofocus,
      obscureText: obscureText,
      autocorrect: autocorrect,
      autovalidate: autovalidate,
      validator: _safeValidator,
      onSaved: _safeOnSaved,
      onChanged: _safeOnChanged,
      controller: controller,
      focusNode: focusNode,
      keyboardType:
          keyboardType ?? TextInputType.numberWithOptions(decimal: false),
      style: style,
      maxLengthEnforced: maxLengthEnforced,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
    );
  }

  String _safeValidator(String value) {
    if (validator == null) return null;
    String unmasked = unmaskValue(inputMask, value);
    return validator(intelligentCast<int>(unmasked));
  }

  void _safeOnSaved(String value) {
    if (onSaved == null) return;
    String unmasked = unmaskValue(inputMask, value);
    onSaved(intelligentCast<int>(unmasked));
  }

  void _safeOnChanged(String value) {
    if (onChanged == null) return;
    String unmasked = unmaskValue(inputMask, value);
    onChanged(intelligentCast<int>(unmasked));
  }
}
