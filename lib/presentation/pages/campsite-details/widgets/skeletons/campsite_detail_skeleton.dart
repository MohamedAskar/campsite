import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/common/skeleton_loader.dart';

class CampsiteDetailSkeleton extends StatelessWidget {
  const CampsiteDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ),

        // Footer Skeleton
        Align(alignment: Alignment.bottomCenter, child: _FooterSkeleton()),
      ],
    );
  }
}

class _HeaderSectionSkeleton extends StatelessWidget {
  const _HeaderSectionSkeleton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 12,
        children: [
          SkeletonLoader(width: 200, height: 28),
          SkeletonLoader(width: 150, height: 12),
        ],
      ),
    );
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

class _FooterSkeleton extends StatelessWidget {
  const _FooterSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: const Row(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 4,
                children: [
                  SkeletonLoader(
                    width: 80,
                    height: 20,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  SkeletonLoader(
                    width: 60,
                    height: 14,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ],
              ),
            ),
            SkeletonLoader(
              width: 140,
              height: 42,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ],
        ),
      ),
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
