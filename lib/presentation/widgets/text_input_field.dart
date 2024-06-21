import 'package:flutter/material.dart';

import '../../shared/dimens.dart';
import '../../shared/extension/build_context_extension.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isError;
  final String? errorMessage;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnClick;

  const TextInputField({
    super.key,
    required this.controller,
    required this.isError,
    this.errorMessage,
    required this.label,
    required this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixIconOnClick,
  });

  @override
  Widget build(BuildContext context) {
    final errorWidget =
        isError && errorMessage != null ? Text(errorMessage!) : null;
    final suffixWidget = suffixIcon != null
        ? InkWell(
            borderRadius: BorderRadius.circular(Dimens.radius24),
            onTap: suffixIconOnClick,
            child: Icon(suffixIcon),
          )
        : null;
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: context.textTheme.bodyMedium,
      cursorColor: context.textTheme.bodyMedium?.color,
      decoration: InputDecoration(
        suffixIcon: suffixWidget,
        error: errorWidget,
        labelText: label,
      ),
    );
  }
}
