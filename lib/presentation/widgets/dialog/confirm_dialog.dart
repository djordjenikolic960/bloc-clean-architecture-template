import 'package:flutter/material.dart';

import '../../../shared/constant.dart';
import '../../../shared/dimens.dart';
import '../../../shared/extension/build_context_extension.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String description;
  final String positiveButtonTitle;
  final VoidCallback? positiveActionCallback;
  final String? negativeButtonTitle;
  final VoidCallback? negativeActionCallback;

  const ConfirmDialog(
    this.title,
    this.description,
    this.positiveButtonTitle, {
    this.positiveActionCallback,
    this.negativeButtonTitle,
    this.negativeActionCallback,
    super.key,
  });

  void show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => this,
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(
        Dimens.size20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.radius8,
        ),
      ),
      actionsPadding: const EdgeInsets.all(
        Dimens.size16,
      ),
      contentPadding: EdgeInsets.zero,
      buttonPadding: const EdgeInsets.symmetric(
        horizontal: Dimens.size4,
      ),
      titlePadding: const EdgeInsets.only(
        top: Dimens.size16,
        left: Dimens.size16,
        right: Dimens.size16,
        bottom: Dimens.size4,
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          fontSize: Dimens.fontSize22,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.size16,
            ),
            child: Text(
              description,
              style: context.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          const Divider(
            height: Constant.zero,
            thickness: Dimens.size1,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            negativeActionCallback?.call();
          },
          style: TextButton.styleFrom(
            textStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          child: negativeButtonTitle != null
              ? Text(
                  negativeButtonTitle!,
                )
              : const SizedBox.shrink(),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            positiveActionCallback?.call();
          },
          style: TextButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
          ),
          child: Text(
            positiveButtonTitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
