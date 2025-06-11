import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/widgets/common/bounded_scrollable_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/common/skeleton_loader.dart';

class CampsiteDetailSkeleton extends StatelessWidget {
  const CampsiteDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return BoundedScrollableLayout(
      padding: context.isMobile
          ? EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          : EdgeInsets.symmetric(vertical: 24),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!context.isMobile) SkeletonLoader(height: 400),
          // Header Section Skeleton
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: _HeaderSectionSkeleton(),
          ),

          // Info Section Skeleton
          _InfoSectionSkeleton(),

          // Amenities Section Skeleton
          _AmenitiesSectionSkeleton(),

          // Location Section Skeleton
          _LocationSectionSkeleton(),

          // Suitability Section Skeleton
          _SuitabilitySectionSkeleton(),

          // Add bottom padding for footer
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _HeaderSectionSkeleton extends StatelessWidget {
  const _HeaderSectionSkeleton();

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Center(
        child: Column(
          spacing: 12,
          children: [_TitleSkeleton(), if (!kIsWeb) _LocationSkeleton()],
        ),
      );
    } else {
      return const Row(
        children: [
          Expanded(
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_TitleSkeleton(), if (!kIsWeb) _LocationSkeleton()],
            ),
          ),
          SkeletonLoader(
            width: 140,
            height: 20,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ],
      );
    }
  }
}

class _TitleSkeleton extends StatelessWidget {
  const _TitleSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(width: 200, height: 28);
  }
}

class _LocationSkeleton extends StatelessWidget {
  const _LocationSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(width: 150, height: 12);
  }
}

class _InfoSectionSkeleton extends StatelessWidget {
  const _InfoSectionSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitleSkeleton(),
        _ListTileSkeleton(),
        _ListTileSkeleton(),
      ],
    );
  }
}

class _AmenitiesSectionSkeleton extends StatelessWidget {
  const _AmenitiesSectionSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        // Section title
        _SectionTitleSkeleton(),
        // Amenity items
        _ListTileSkeleton(leadingSize: 48, titleHeight: 16, subtitleHeight: 12),
        _ListTileSkeleton(leadingSize: 48, titleHeight: 16, subtitleHeight: 12),
      ],
    );
  }
}

class _SuitabilitySectionSkeleton extends StatelessWidget {
  const _SuitabilitySectionSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        // Section title
        _SectionTitleSkeleton(),
        // Chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            SkeletonLoader(
              width: 80,
              height: 14,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ],
        ),
      ],
    );
  }
}

class _LocationSectionSkeleton extends StatelessWidget {
  const _LocationSectionSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        // Section title
        _SectionTitleSkeleton(),
        // Map placeholder
        AspectRatio(
          aspectRatio: 1.2,
          child: SkeletonLoader(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ],
    );
  }
}

class _SectionTitleSkeleton extends StatelessWidget {
  const _SectionTitleSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      width: 140,
      height: 18,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }
}

class _ListTileSkeleton extends StatelessWidget {
  const _ListTileSkeleton({
    this.leadingSize = 24,
    this.titleHeight = 14,
    this.subtitleHeight,
  });

  final double leadingSize;
  final double titleHeight;
  final double? subtitleHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SkeletonLoader.circular(size: leadingSize),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLoader(height: titleHeight),
              if (subtitleHeight != null)
                SkeletonLoader(height: subtitleHeight!),
            ],
          ),
        ),
      ],
    );
  }
}
