import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/pages/campsite-details/widgets/skeletons/campsite_detail_skeleton.dart';
import 'package:campsite/presentation/pages/campsite-details/widgets/skeletons/campsite_header_skeleton.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../providers/campsite_providers.dart';
import 'widgets/campsite_details_body.dart';

class CampsiteDetailPage extends ConsumerWidget {
  final String campsiteId;

  const CampsiteDetailPage({super.key, required this.campsiteId});

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
          data: (campsite) => CampsiteDetailsBody(campsite: campsite),
          loading: () => const CampsiteDetailSkeleton(),
          error: (error, stack) =>
              Center(child: Text(context.l10n.errorLoadingCampsites)),
        ),
      ),
    );
  }
}
