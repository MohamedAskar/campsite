import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSearchBar extends ConsumerWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: context.colorScheme.onSurface),
          const SizedBox(width: 12),
          Text('Campsites in Paris', style: context.theme.textTheme.bodyMedium),
          const Spacer(),
          Icon(Icons.tune_outlined, color: context.colorScheme.onSurface),
        ],
      ),
    );
  }
}
