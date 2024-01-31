import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final int maxLines;
  final bool obscureText;
  final bool isPhone;
  final TextInputType inputType;
  final TextAlign textAlign;
  final Widget? suffix;
  final Widget? prefix;
  final String? prefixText;
  final FocusNode? focusNode;
  final Function(String value)? onChangeCallback;
  final Function(String? value)? onValidate;
  final VoidCallback? onTap;
  final Function(String)? onSelected;
  final EdgeInsets contentPadding;

  final bool readOnly;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.focusNode,
    this.hintText,
    this.maxLines = 1,
    this.obscureText = false,
    this.isPhone = false,
    this.inputType = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.suffix,
    this.prefix,
    this.prefixText,
    this.onChangeCallback,
    this.onValidate,
    this.onTap,
    this.onSelected,
    this.readOnly = false,
    this.contentPadding = const EdgeInsets.fromLTRB(16.0, 15.0, 20.0, 15.0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.h,
      child: TextFormField(
        focusNode: focusNode,
        obscureText: obscureText,
        controller: controller,
        maxLines: maxLines,
        cursorColor: const Color(0xFF9DB7CB),
        style: TextStyle(
          color: const Color(0xFF9DB7CB),
          fontSize: 18.sp,
          fontWeight: FontWeight.w300,
        ),
        keyboardType: inputType,
        textInputAction: TextInputAction.done,
        readOnly: readOnly,
        decoration: inputDecoration(),
        validator: (value) => onValidate != null ? onValidate!(value) : _validator(value),
        onChanged: (value) => onChangeCallback != null ? onChangeCallback!(value) : null,
        onTap: onTap,
        textAlign: textAlign,
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFEDF2F6),
      labelText: label,
      labelStyle: TextStyle(
        color: const Color(0xFF9DB7CB),
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      isDense: true,
      alignLabelWithHint: maxLines != 1,
      hintText: hintText,
      prefixText: prefixText,
      hintStyle: TextStyle(
        color: const Color(0xFF9DB7CB),
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
      ),
      prefixIcon: prefix,
      suffixIcon: suffix,
      errorStyle: TextStyle(
        fontSize: 12.sp,
        color: Colors.red,
      ),
      suffixIconConstraints: const BoxConstraints(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      contentPadding: contentPadding,
    );
  }

  String? _validator(String? value) {
    if (obscureText) {
      return (value == null || value.trim().length < 6) ? 'validation_min_6_char'.tr : null;
    }
    if (isPhone) {
      final phone = value?.replaceAll(RegExp(r'\D+'), '');
      return (phone == null || phone.trim().length < 8) ? 'filed_empty'.tr : null;
    }

    return (value == null || value.trim().isEmpty) ? '$label ${'validation_is_required'.tr}' : null;
  }
}
