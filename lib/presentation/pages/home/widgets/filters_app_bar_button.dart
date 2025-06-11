import 'package:campsite/presentation/controllers/campsite_filter_controller.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart'
    show filteredCampsiteListProvider;
import 'package:campsite/presentation/widgets/campsite/campsite_filter_sheet.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FiltersAppBarButton extends ConsumerWidget {
  const FiltersAppBarButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsitesAsync = ref.watch(filteredCampsiteListProvider);
    final filter = ref.watch(campsiteFilterControllerProvider);

    return campsitesAsync.whenOrNull(
          loading: () => SkeletonLoader.circular(size: 32),
          data: (campsites) => IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                useSafeArea: true,
                isScrollControlled: true,
                builder: (context) => const CampsiteFilterSheet(),
              );
            },
            icon: Badge(
              isLabelVisible: filter.hasActiveFilters,
              offset: const Offset(5, -10),
              label: Text('${filter.activeFilterCount}'),
              child: Icon(LucideIcons.listFilter),
            ),
          ),
        ) ??
        const SizedBox.shrink();
  }
}
