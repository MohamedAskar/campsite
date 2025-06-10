import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';

import '../../../widgets/campsite/campsite_card.dart';
import 'home_sheet_container.dart';
import 'home_sheet_drag_handle.dart';

class HomeSheet extends StatelessWidget {
  const HomeSheet({
    super.key,
    required this.campsites,
    required this.draggableController,
  });

  final List<Campsite> campsites;
  final DraggableScrollableController draggableController;

  @override
  Widget build(BuildContext context) {
    final campsitesApproxCount = ((campsites.length) ~/ 10) * 10;

    return DraggableScrollableSheet(
      controller: draggableController,
      initialChildSize: 0.4,
      minChildSize: 0.15,
      maxChildSize: 0.925,
      snap: true,
      shouldCloseOnMinExtent: false,
      snapSizes: const [0.15, 0.4, 0.925],
      builder: (context, scrollController) {
        return HomeSheetContainer(
          child: CustomScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              // Handle
              SliverToBoxAdapter(child: HomeSheetDragHandle()),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Around $campsitesApproxCount results available',
                    style: context.textTheme.titleSmall?.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverSafeArea(
                top: false,
                sliver: SliverList.separated(
                  itemCount: campsites.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final campsite = campsites[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CampsiteCard(campsite: campsite),
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
