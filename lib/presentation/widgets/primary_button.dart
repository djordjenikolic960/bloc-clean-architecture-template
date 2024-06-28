import 'package:flutter/material.dart';

import '../../shared/dimens.dart';
import '../../shared/extension/build_context_extension.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? fillColor;
  final Color? labelColor;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.fillColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: fillColor ?? context.colorScheme.primary,
              foregroundColor: labelColor ?? Colors.white,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.size16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Dimens.size24,
                ),
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: labelColor ?? Colors.white,
                fontSize: Dimens.fontSize16,
                fontFamily: "SemiBold",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
