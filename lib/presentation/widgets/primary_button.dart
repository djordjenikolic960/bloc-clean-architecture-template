import 'package:flutter/material.dart';

import '../../shared/dimens.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color fillColor;
  final Color titleColor;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.fillColor,
    required this.titleColor,
    this.borderRadius = Dimens.size24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: fillColor,
              foregroundColor: titleColor,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: Dimens.size16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  borderRadius,
                ),
              ),
            ),
            child: Text(label),
          ),
        ),
      ],
    );
  }
}
