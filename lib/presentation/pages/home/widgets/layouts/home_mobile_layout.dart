import 'package:campsite/core/constants/breakpoints.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/pages/home/controller/home_controller.dart';
import 'package:campsite/presentation/pages/home/widgets/home_map.dart';
import 'package:campsite/presentation/pages/home/widgets/home_sheet.dart';
import 'package:campsite/presentation/pages/home/widgets/selected_campsite_card.dart';
import 'package:campsite/presentation/pages/home/widgets/skeletons/home_page_skeleton.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMobileLayout extends ConsumerWidget {
  const HomeMobileLayout({super.key, required this.viewPadding});

  final EdgeInsets viewPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsitesAsync = ref.watch(filteredCampsiteListProvider);

    final homeController = ref.read(homeControllerProvider.notifier);

    final selectedCampsite = ref.watch(
      homeControllerProvider.select((state) => state.selectedCampsite),
    );

    return campsitesAsync.when(
      data: (campsites) {
        return Stack(
          children: [
            HomeMap(campsites: campsites),
            Container(
              padding: context.isMobile
                  ? EdgeInsets.zero
                  : EdgeInsets.symmetric(horizontal: 16),
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.mobileBreakpoint,
              ),
              child: Builder(
                builder: (context) {
                  if (selectedCampsite != null) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SelectedCampsiteCard(
                          campsite: selectedCampsite,
                          onClose: homeController.clearSelectedCampsite,
                        ),
                      ),
                    );
                  } else {
                    return HomeSheet(campsites: campsites);
                  }
                },
              ),
            ),
          ],
        );
      },
      loading: () => const HomePageSkeleton(),
      error: (error, stackTrace) =>
          Center(child: Text(context.l10n.error(error.toString()))),
    );
  }
}
