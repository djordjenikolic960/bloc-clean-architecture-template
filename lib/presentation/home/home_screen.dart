import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/auth/bloc/auth_bloc.dart';
import '../../shared/auth/bloc/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Text(state.user.name ?? ".");
            } else {
              return const Text("name is empty");
            }

          }
        ),
      ),
    );
  }
}
