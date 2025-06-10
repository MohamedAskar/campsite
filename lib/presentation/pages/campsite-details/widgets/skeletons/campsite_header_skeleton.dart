import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CampsiteHeaderSkeleton extends StatelessWidget {
  const CampsiteHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 240,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: CircleAvatar(
          backgroundColor: context.colorScheme.surface,
          child: const Icon(LucideIcons.arrowLeft),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
          child: Container(
            color: context.colorScheme.surfaceContainerLow,
            child: const Center(
              child: SkeletonLoader(
                width: double.infinity,
                height: double.infinity,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
