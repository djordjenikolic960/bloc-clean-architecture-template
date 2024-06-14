import 'package:flutter/material.dart';
import '../../shared/extension/build_context_extension.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      title: Text(
        title,
        style: context.textTheme.bodyMedium,
      ),
      leading: Icon(icon),
    );
  }
}
