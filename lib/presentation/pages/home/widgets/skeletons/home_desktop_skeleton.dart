import 'package:campsite/presentation/widgets/common/campsite_card_skeleton.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';

class HomeDesktopSkeleton extends StatelessWidget {
  const HomeDesktopSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Center(child: SkeletonLoader(width: 200, height: 20)),
                ),
              ),
              SliverSafeArea(
                top: false,
                sliver: SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  sliver: SliverGrid.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 340,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return CampsiteCardSkeleton(showAmenities: false);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SkeletonLoader(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
