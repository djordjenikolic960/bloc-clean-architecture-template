import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../shared/extension/build_context_extension.dart';
import '../../shared/auth/bloc/auth_bloc.dart';
import '../../shared/auth/bloc/auth_state.dart';
import '../router/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (_, state) =>
          state is Authenticated || state is Unauthenticated,
      listener: (context, state) {
        if (state is Authenticated) {
          context.go(Routes.bottomNavigation.path);
        } else {
          context.go(Routes.login.path);
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(
            "splash screen",
            style: context.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
