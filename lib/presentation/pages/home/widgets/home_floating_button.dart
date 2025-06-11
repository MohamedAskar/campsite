import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../controller/home_controller.dart';

class HomeFloatingButton extends ConsumerWidget {
  const HomeFloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFloatingButton = ref.watch(
      homeControllerProvider.select((state) => state.showFloatingButton),
    );

    if (!showFloatingButton) return const SizedBox.shrink();

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
        onPressed: ref
            .read(homeControllerProvider.notifier)
            .onFloatingButtonPressed,
        icon: Icon(LucideIcons.map),
        label: Text(context.l10n.map),
      ),
    );
  }
}
