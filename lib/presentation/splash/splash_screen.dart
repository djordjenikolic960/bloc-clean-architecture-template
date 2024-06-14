import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/extension/build_context_extension.dart';
import '../router/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // todo add logic for user state change and is onboarding completed
    Future.delayed(const Duration(seconds: 1))
        .then((_) => context.go(Routes.bottomNavigation.path));
    return Scaffold(
      body: Center(
        child: Text(
          "splash screen",
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
