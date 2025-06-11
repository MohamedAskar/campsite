import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';

import '../header_back_button.dart';

class CampsiteHeaderSkeleton extends StatelessWidget {
  const CampsiteHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 240,
      leading: const HeaderBackButton(),
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
