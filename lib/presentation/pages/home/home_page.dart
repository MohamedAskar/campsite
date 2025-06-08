import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/presentation/controllers/campsite_filter_controller.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_card.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsitesAsync = ref.watch(filteredCampsiteListProvider);
    final filter = ref.watch(campsiteFilterControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SizedBox.square(
          dimension: 64,
          child: Image.asset(CampsiteAssets.campsite),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            sliver: SliverToBoxAdapter(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Are you ready for new ',
                      style: context.textTheme.titleLarge?.bold,
                    ),
                    TextSpan(
                      text: '\nadventure',
                      style: context.textTheme.headlineMedium?.bold.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: '?',
                      style: context.textTheme.titleLarge?.bold,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Badge(
                  isLabelVisible: filter.hasActiveFilters,
                  label: Text('${filter.activeFilterCount}'),
                  child: TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        showDragHandle: true,
                        useSafeArea: true,
                        useRootNavigator: true,
                        isScrollControlled: true,
                        builder: (context) => const CampsiteFilterSheet(),
                      );
                    },
                    icon: Icon(LucideIcons.slidersHorizontal),
                    label: Text('Filters'),
                  ),
                ),
              ),
            ),
          ),
          campsitesAsync.when(
            data: (campsites) {
              return SliverSafeArea(
                sliver: SliverList.separated(
                  itemCount: campsites.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final campsite = campsites[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CampsiteCard(campsite: campsite),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) =>
                SliverToBoxAdapter(child: Text('Error: $error')),
            loading: () => SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 56)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.5),
              blurRadius: 24,
              spreadRadius: 0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: FilledButton.icon(
          onPressed: () {},
          icon: Icon(LucideIcons.map),
          label: Text('Map'),
        ),
      ),
    );
  }
}
