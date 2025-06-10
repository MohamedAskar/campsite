import 'package:flutter/material.dart';

import 'skeleton_loader.dart';

class CampsiteCardSkeleton extends StatelessWidget {
  const CampsiteCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: SkeletonLoader(borderRadius: BorderRadius.circular(12)),
        ),

        SizedBox(height: 12),
        SkeletonLoader(
          width: 180,
          height: 16,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        SizedBox(height: 8),
        SkeletonLoader(
          width: 120,
          height: 14,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        SizedBox(height: 8),

        // Amenities row
        Wrap(
          spacing: 12,
          children: [
            SkeletonLoader.circular(size: 24),
            SkeletonLoader.circular(size: 24),
          ],
        ),
      ],
    );
  }
}
