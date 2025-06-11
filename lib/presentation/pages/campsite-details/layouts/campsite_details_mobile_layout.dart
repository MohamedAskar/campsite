import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/campsite_details_body.dart';
import '../widgets/campsite_footer.dart';
import '../widgets/header_back_button.dart';
import '../widgets/skeletons/campsite_detail_skeleton.dart';
import '../widgets/skeletons/campsite_header_skeleton.dart';

class CampsiteDetailsMobileLayout extends ConsumerWidget {
  const CampsiteDetailsMobileLayout({super.key, required this.campsiteId});

  final String campsiteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsiteAsync = ref.watch(campsiteDetailsProvider(campsiteId));
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            campsiteAsync.when(
              data: (campsite) {
                return SliverAppBar(
                  pinned: true,
                  expandedHeight: 240,
                  leading: const HeaderBackButton(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(24),
                      ),
                      child: CampsiteImage(imageUrl: campsite.photo),
                    ),
                  ),
                );
              },
              loading: () => const CampsiteHeaderSkeleton(),
              error: (error, stack) => const SliverAppBar(),
            ),
          ];
        },
        body: campsiteAsync.when(
          data: (campsite) {
            return Stack(
              children: [
                CampsiteDetailsBody(
                  campsite: campsite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CampsiteFooter(campsite: campsite),
                ),
              ],
            );
          },
          loading: () => const CampsiteDetailSkeleton(),
          error: (error, stack) =>
              Center(child: Text(context.l10n.errorLoadingCampsites)),
        ),
      ),
    );
  }
}
