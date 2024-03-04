import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constant/app_colors.dart';
import '../../common/constant/app_text.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? inputType;
  final bool initial;
  final String? initialText;
  final bool isObscure;
  final bool alignRight;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? suffixWidget;
  final BoxConstraints? suffixConstraints;
  final bool isEnabled;
  final bool readOnly;
  final bool needAutoValidate;
  final int maxLines;

  const DefaultTextField({
    Key? key,
    required this.hintText,
    this.onSaved,
    this.controller,
    this.labelText,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.initial = false,
    this.initialText,
    this.isObscure = false,
    this.alignRight = false,
    this.onChanged,
    this.validator,
    this.suffixWidget,
    this.suffixConstraints,
    this.isEnabled = true,
    this.readOnly = false,
    this.needAutoValidate = false,
    this.maxLines = 1,
  }) : super(key: key);

  // listInputType
  // 0 : text
  // 1 : multiline
  // 2 : number
  // 3 : phone
  // 4 : datetime
  // 5 : emailAddress
  // 6 : url
  // 7 : visiblePassword
  // 8 : name
  // 9 : streetAddress
  // 10 : none

  List<TextInputFormatter> get _inputFormatters {
    List<TextInputFormatter> formatters = <TextInputFormatter>[];
    switch (inputType?.index) {
      case 0:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 3:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 6:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(" ")));
        break;
      case 9:
        break;
    }
    return formatters;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged ?? (value) {},
      textAlign: alignRight ? TextAlign.end : TextAlign.start,
      cursorColor: AppColors.primaryColor,
      initialValue: initialText,
      keyboardType: inputType,
      inputFormatters: _inputFormatters,
      obscureText: isObscure,
      style: AppText.text14.copyWith(
        color: AppColors.greyColor400,
        fontWeight: FontWeight.w600,
      ),
      maxLines: maxLines,
      autovalidateMode: needAutoValidate ? AutovalidateMode.always : null,
      decoration: InputDecoration(
        focusColor: AppColors.primaryColor,
        filled: false,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.infoColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hintText,
        hintStyle: AppText.text14.copyWith(
          color: AppColors.greyColor500,
        ),
        labelText: labelText,
        labelStyle: AppText.text14.copyWith(color: AppColors.greyColor500),
        floatingLabelStyle: AppText.text14.copyWith(
          color: AppColors.greyColor500,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: suffixWidget,
        suffixIconConstraints: suffixConstraints,
      ),
      maxLength: maxLength,
      validator: validator,
      onSaved: onSaved ?? (value) {},
    );
  }
}
