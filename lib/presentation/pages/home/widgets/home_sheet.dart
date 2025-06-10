import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';

import '../../../widgets/campsite/campsite_card.dart';
import 'home_sheet_container.dart';
import 'home_sheet_drag_handle.dart';

class HomeSheet extends StatefulWidget {
  const HomeSheet({
    super.key,
    required this.campsites,
    required this.draggableController,
  });

  final List<Campsite> campsites;
  final DraggableScrollableController draggableController;

  @override
  State<HomeSheet> createState() => _HomeSheetState();
}

class _HomeSheetState extends State<HomeSheet> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    widget.draggableController.addListener(_onDraggableChanged);
  }

  @override
  void dispose() {
    widget.draggableController.removeListener(_onDraggableChanged);
    super.dispose();
  }

  void _onDraggableChanged() {
    final currentSize = widget.draggableController.size;

    if (currentSize <= 0.4 && (_scrollController?.position.pixels ?? 0) > 0) {
      _scrollController!.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final campsitesApproxCount = ((widget.campsites.length) ~/ 10) * 10;

    return DraggableScrollableSheet(
      controller: widget.draggableController,
      initialChildSize: 0.4,
      minChildSize: 0.15,
      maxChildSize: 0.925,
      snap: true,
      shouldCloseOnMinExtent: false,
      snapSizes: const [0.15, 0.4, 0.925],
      builder: (context, scrollController) {
        _scrollController = scrollController;

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
                  itemCount: widget.campsites.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final campsite = widget.campsites[index];
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
