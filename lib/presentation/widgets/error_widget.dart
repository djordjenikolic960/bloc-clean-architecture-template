import 'package:flutter/material.dart';

import '../../l10n/localization_extension.dart';

class ErrorWidget extends StatelessWidget {
  final String? errorMessage;

  const ErrorWidget({
    super.key,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final message = errorMessage ?? context.l10n.generic_error_message;
    return Center(
      child: Text(message),
    );
  }
}
