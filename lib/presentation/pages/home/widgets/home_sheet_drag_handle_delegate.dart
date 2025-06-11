import 'package:flutter/material.dart';

class HomeSheetDragHandleDelegate extends SliverPersistentHeaderDelegate {
  final ColorScheme colorScheme;

  const HomeSheetDragHandleDelegate({required this.colorScheme});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: Container(
        width: 32,
        height: 4,
        margin: const EdgeInsets.only(top: 8, bottom: 4),
        decoration: BoxDecoration(
          color: colorScheme.onSurfaceVariant,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 36.0;

  @override
  double get minExtent => 36.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate is! HomeSheetDragHandleDelegate ||
        oldDelegate.colorScheme != colorScheme;
  }
}
