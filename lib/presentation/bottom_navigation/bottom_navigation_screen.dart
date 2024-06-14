import '../../l10n/localization_extension.dart';
import 'screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/service_locator.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';
import 'bloc/bottom_navigation_bloc.dart';
import 'bloc/bottom_navigation_event.dart';
import 'bloc/bottom_navigation_state.dart';

final _screens = [
  const HomeScreen(),
  const SettingsScreen(),
  const ProfileScreen(),
];

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (_) => serviceLocator.get<BottomNavigationBloc>(),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (blocContext, state) {
        final selectedScreenIndex =
            (state as BottomNavigationSelectedScreen).screen.index;
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              blocContext.read<BottomNavigationBloc>().add(
                    BottomNavigationTabChanged(
                      Screen.values[index],
                    ),
                  );
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: selectedScreenIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: context.l10n.settings,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: context.l10n.profile,
              ),
            ],
          ),
          body: SafeArea(
            bottom: true,
            top: false,
            child: _screens[selectedScreenIndex],
          ),
        );
      }),
    );
  }
}
