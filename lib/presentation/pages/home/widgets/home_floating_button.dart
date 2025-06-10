import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.5),
            blurRadius: 24,
            spreadRadius: 0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(LucideIcons.map),
        label: Text(context.l10n.map),
      ),
    );
  }
}
