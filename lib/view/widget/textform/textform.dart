import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.size,
      required this.hint,
      this.controller,
      this.readOnly,
      this.validator,
      this.maxLine,
      this.keyboardType,
      this.color,
      this.colorFilled,
      this.textCapitalization,
      this.obscureText});
  int? maxLine;
  final double size;
  final String hint;
  Color? color;
  bool? colorFilled;
  TextEditingController? controller;
  bool? readOnly;
  final String? Function(String?)? validator;
  TextInputType? keyboardType;
  TextCapitalization? textCapitalization;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: TextFormField(
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          readOnly: readOnly ?? false,
          controller: controller,
          maxLines: maxLine,
          decoration: InputDecoration(
            fillColor: color,
            filled: colorFilled,
            hintText: hint,
            contentPadding: EdgeInsetsGeometry.lerp(
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                EdgeInsets.zero,
                0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          autovalidateMode: AutovalidateMode.disabled,
          validator: validator),
    );
  }
}
