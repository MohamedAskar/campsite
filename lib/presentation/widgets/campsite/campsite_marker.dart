import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CampsiteMarker extends StatelessWidget {
  const CampsiteMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        shape: BoxShape.circle,
        border: Border.all(color: context.colorScheme.surface, width: 3),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        LucideIcons.tentTree,
        color: context.colorScheme.onPrimary,
        size: 20,
      ),
    );
  }
}
