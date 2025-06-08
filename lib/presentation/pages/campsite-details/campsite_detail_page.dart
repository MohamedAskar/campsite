import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../l10n/app_localizations.dart';
import '../../providers/campsite_providers.dart';
import 'widgets/campsite_amenities_section.dart';
import 'widgets/campsite_footer.dart';
import 'widgets/campsite_header_section.dart';
import 'widgets/campsite_info_widget.dart';
import 'widgets/campsite_location_section.dart';
import 'widgets/campsite_suitablility_section.dart';

class CampsiteDetailPage extends ConsumerWidget {
  final String campsiteId;

  const CampsiteDetailPage({super.key, required this.campsiteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final campsiteAsync = ref.watch(campsiteDetailsProvider(campsiteId));

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            campsiteAsync.when(
              data: (campsite) => SliverAppBar(
                pinned: true,
                expandedHeight: 240,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: CircleAvatar(
                    backgroundColor: context.colorScheme.surface,
                    child: Icon(LucideIcons.arrowLeft),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                    child: CampsiteImage(imageUrl: campsite.photo, height: 300),
                  ),
                ),
              ),
              loading: () => const SliverToBoxAdapter(),
              error: (error, stack) => const SliverToBoxAdapter(),
            ),
          ];
        },
        body: campsiteAsync.when(
          data: (campsite) => Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CampsiteHeaderSection(
                        label: campsite.label,
                        geoLocation: campsite.geoLocation,
                      ),
                    ),
                    CampsiteInfoSection(
                      yearsOfHosting: campsite.yearsOfHosting,
                      hostLanguages: campsite.hostLanguages,
                    ),
                    CampsiteAmenitiesSection(
                      campFireAllowed: campsite.isCampFireAllowed,
                      closeToWater: campsite.isCloseToWater,
                    ),
                    if (campsite.suitableFor.isNotEmpty)
                      CampsiteSuitablilitySection(
                        suitableFor: campsite.suitableFor,
                      ),
                    CampsiteLocationSection(geoLocation: campsite.geoLocation),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CampsiteFooter(campsite: campsite),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) =>
              Center(child: Text(l10n.errorLoadingCampsites)),
        ),
      ),
    );
  }
}
