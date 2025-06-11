import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/presentation/pages/home/controller/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/campsite/campsite_card.dart';
import 'campsite_result_text.dart';
import 'home_sheet_container.dart';
import 'home_sheet_drag_handle_delegate.dart';

class HomeSheet extends ConsumerStatefulWidget {
  const HomeSheet({super.key, required this.campsites});

  final List<Campsite> campsites;

  @override
  ConsumerState<HomeSheet> createState() => _HomeSheetState();
}

class _HomeSheetState extends ConsumerState<HomeSheet> {
  late final DraggableScrollableController _draggableController;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _draggableController = ref.read(
      homeControllerProvider.select((state) => state.draggableController),
    );
    _draggableController.addListener(_onDraggableChanged);
  }

  @override
  void dispose() {
    _draggableController.removeListener(_onDraggableChanged);
    super.dispose();
  }

  void _onDraggableChanged() {
    final currentSize = _draggableController.size;

    if (currentSize <= 0.4 && (_scrollController?.position.pixels ?? 0) > 0) {
      _scrollController!.jumpTo(0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    const minChildSize = 0.15;
    const defaultInitialChildSize = 0.4;
    const maxChildSize = 0.925;

    return DraggableScrollableSheet(
      controller: _draggableController,
      initialChildSize: kIsWeb ? maxChildSize : defaultInitialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      snap: true,
      shouldCloseOnMinExtent: false,
      snapSizes: const [minChildSize, defaultInitialChildSize, maxChildSize],
      builder: (context, scrollController) {
        _scrollController = scrollController;

        return HomeSheetContainer(
          child: CustomScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              // Handle
              SliverPersistentHeader(
                pinned: true,
                delegate: HomeSheetDragHandleDelegate(
                  colorScheme: context.colorScheme,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverToBoxAdapter(
                  child: CampsiteResultText(count: widget.campsites.length),
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
