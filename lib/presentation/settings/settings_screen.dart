import '../widgets/list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/l10n.dart';
import '../../shared/app_config/bloc/app_config_bloc.dart';
import '../../shared/app_config/bloc/app_config_event.dart';
import '../../shared/extension/build_context_extension.dart';
import '../theme/themes.dart';
import 'package:flutter/material.dart';

import '../../l10n/localization_extension.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 6,
          ),
          ListItem(
            title: context.l10n.language,
            icon: Icons.language,
            onClick: () {
              _changeLanguageDialog(context);
            },
          ),
          ListItem(
            title: context.l10n.theme,
            icon: Icons.nightlight_outlined,
            onClick: () {
              _changeThemeDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _changeLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(context.l10n.language),
        children: [
          SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: L10n.all.length,
              itemBuilder: (context, index) => RadioListTile(
                value: L10n.all[index],
                groupValue:
                    context.read<AppConfigBloc>().state.appConfig.locale,
                onChanged: (value) {
                  if (value != null) {
                    context.read<AppConfigBloc>().add(UpdateLocale(value));
                    context.pop();
                  }
                },
                title: Text(
                  L10n.all[index].languageCode,
                  style: TextStyle(color: context.textTheme.bodyMedium!.color),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }

  void _changeThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(context.l10n.theme),
        children: [
          SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: CustomTheme.values.length,
              itemBuilder: (context, index) => RadioListTile(
                value: CustomTheme.values[index].name,
                groupValue:
                    context.read<AppConfigBloc>().state.appConfig.theme.name,
                onChanged: (value) {
                  if (value != null) {
                    context.read<AppConfigBloc>().add(UpdateCustomTheme(
                        CustomTheme.values
                            .firstWhere((theme) => theme.name == value)));
                    context.pop();
                  }
                },
                title: Text(
                  CustomTheme.values[index].name == CustomTheme.light.name
                      ? context.l10n.light
                      : context.l10n.dark,
                  style: TextStyle(
                    color: context.textTheme.bodyMedium!.color,
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
