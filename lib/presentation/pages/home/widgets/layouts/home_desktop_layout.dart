import 'package:campsite/presentation/pages/home/controller/home_controller.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../campsite_result_text.dart';
import '../home_map.dart';
import '../selected_campsite_card.dart';

class HomeDesktopLayout extends ConsumerWidget {
  const HomeDesktopLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsitesAsync = ref.watch(filteredCampsiteListProvider);

    final homeState = ref.watch(homeControllerProvider);
    final homeController = ref.read(homeControllerProvider.notifier);

    final selectedCampsite = homeState.selectedCampsite;

    return campsitesAsync.when(
      data: (campsites) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: CampsiteResultText(count: campsites.length),
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
                        itemCount: campsites.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 340,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.2,
                        ),
                        itemBuilder: (context, index) {
                          return CampsiteCard(
                            campsite: campsites[index],
                            showAmenities: false,
                          );
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
                    child: Stack(
                      children: [
                        Positioned.fill(child: HomeMap(campsites: campsites)),
                        if (selectedCampsite != null)
                          Align(
                            alignment: Alignment(0, -0.75),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 340),
                              child: SelectedCampsiteCard(
                                campsite: selectedCampsite,
                                onClose: homeController.clearSelectedCampsite,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text('Error: ${error.toString()}')),
    );
  }
}
