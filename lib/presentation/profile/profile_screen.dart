import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/localization_extension.dart';
import '../../shared/auth/bloc/auth_bloc.dart';
import '../../shared/auth/bloc/auth_event.dart';
import '../../shared/auth/bloc/auth_state.dart';
import '../router/routes.dart';
import '../widgets/list_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.go(Routes.login.path);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.profile),
        ),
        body: Column(
          children: [
            const Divider(),
            ListItem(
              title: context.l10n.sign_out,
              icon: Icons.logout_outlined,
              onClick: () {
                context.read<AuthBloc>().add(SignOut());
              },
            ),
          ],
        ),
      ),
    );
  }
}
