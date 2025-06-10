import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/presentation/pages/home/widgets/filters_app_bar_button.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/home_controller.dart';
import 'widgets/home_floating_button.dart';
import 'widgets/home_map.dart';
import 'widgets/home_sheet.dart';
import 'widgets/selected_campsite_card.dart';
import 'widgets/skeletons/home_page_skeleton.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsitesAsync = ref.watch(filteredCampsiteListProvider);
    final homeState = ref.watch(homeControllerProvider);
    final homeController = ref.read(homeControllerProvider.notifier);

    final mapController = homeState.mapController;
    final draggableController = homeState.draggableController;
    final showFloatingButton = homeState.showFloatingButton;
    final selectedCampsite = homeState.selectedCampsite;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 72,
        title: Row(
          spacing: 4,
          children: [
            SizedBox.square(
              dimension: 64,
              child: Image.asset(CampsiteAssets.campsite),
            ),
            Text(
              context.l10n.campsites,
              style: context.textTheme.titleLarge?.bold,
            ),
          ],
        ),
        actions: [
          campsitesAsync.whenOrNull(
                data: (campsites) => FiltersAppBarButton(),
                loading: () => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: SkeletonLoader.circular(size: 32),
                ),
              ) ??
              const SizedBox.shrink(),
        ],
      ),
      body: campsitesAsync.when(
        data: (campsites) {
          return Stack(
            children: [
              HomeMap(
                campsites: campsites,
                mapController: mapController,
                onClusterTap: homeController.fitClusterToBounds,
                onMarkerTap: homeController.selectCampsite,
              ),
              if (selectedCampsite != null)
                SelectedCampsiteCard(
                  campsite: selectedCampsite,
                  onClose: homeController.clearSelectedCampsite,
                )
              else
                HomeSheet(
                  campsites: campsites,
                  draggableController: draggableController,
                ),
            ],
          );
        },
        loading: () => const HomePageSkeleton(),
        error: (error, stackTrace) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: showFloatingButton
          ? HomeFloatingButton(
              onPressed: homeController.onFloatingButtonPressed,
            )
          : null,
    );
  }
}
