import 'package:flutter/services.dart';
import 'package:rccg_jp/lib.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? emptyTextError;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? enabled;
  final bool? readOnly;
  final void Function()? onTap;
  final void Function(String? value)? onChanged;
  final Widget? suffixIcon;

  const DefaultTextFormField(
      {super.key,
      this.controller,
      this.label,
      this.validator,
      this.hint,
      this.helperText,
      this.maxLines,
      this.emptyTextError,
      this.keyboardType,
      this.autofillHints,
      this.inputFormatters,
      this.maxLength,
      this.enabled,
      this.onTap,
      this.readOnly = false,
      this.onChanged,
      this.minLines,
      this.suffixIcon,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      /*
      maxLines: maxLines,
      minLines: minLines,*/
      onTap: onTap,
      readOnly: readOnly!,
      onChanged: onChanged,
      enabled: enabled,
      controller: controller,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return emptyTextError;
            }
            return null;
          },
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
          hintText: hint,
          labelText: label,
          helperText: helperText,
          suffixIcon: suffixIcon,),
    );
  }
}
