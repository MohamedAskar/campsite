import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/widgets/common/campsite_card_skeleton.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';

import '../home_sheet_container.dart';
import '../home_sheet_drag_handle_delegate.dart';

class HomeSheetSkeleton extends StatelessWidget {
  const HomeSheetSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.15,
      maxChildSize: 0.925,
      snap: true,
      snapSizes: const [0.15, 0.4, 0.925],
      builder: (context, scrollController) {
        return HomeSheetContainer(
          child: CustomScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: HomeSheetDragHandleDelegate(
                  colorScheme: context.colorScheme,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverToBoxAdapter(
                  child: Center(child: SkeletonLoader(width: 260, height: 16)),
                ),
              ),
              SliverSafeArea(
                top: false,
                sliver: SliverList.separated(
                  itemCount: 10,
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                  itemBuilder: (_, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CampsiteCardSkeleton(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
