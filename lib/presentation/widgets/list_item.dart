import 'package:flutter/material.dart';
import '../../shared/extension/build_context_extension.dart';

class ListItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onClick;

  const ListItem({
    super.key,
    required this.title,
    required this.onClick,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onClick,
          title: Text(
            title,
            style: context.textTheme.bodyMedium,
          ),
          leading: icon != null ? Icon(icon) : null,
        ),
        const Divider(),
      ],
    );
  }
}
