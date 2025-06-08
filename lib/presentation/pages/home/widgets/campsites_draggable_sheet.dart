import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampsitesDraggableSheet extends ConsumerWidget {
  const CampsitesDraggableSheet({
    super.key,
    required this.scrollableController,
    required this.campsites,
  });

  final DraggableScrollableController scrollableController;
  final List<Campsite> campsites;

  static const double _defaultSheetSize = 0.4;
  static const double _minSheetSize = 0.1;
  static const double _maxSheetSize = 0.9;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      controller: scrollableController,
      initialChildSize: _defaultSheetSize,
      minChildSize: _minSheetSize,
      maxChildSize: _maxSheetSize,
      snap: true,
      snapSizes: [_minSheetSize, _defaultSheetSize, _maxSheetSize],
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            color: context.colorScheme.surface,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _DragHandleHeaderDelegate(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.separated(
                    itemCount: campsites.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final campsite = campsites[index];
                      return CampsiteCard(campsite: campsite);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DragHandleHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: context.colorScheme.surface,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            color: context.colorScheme.outline,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 28;

  @override
  double get minExtent => 28;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
