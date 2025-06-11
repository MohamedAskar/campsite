import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_image.dart';
import 'package:campsite/presentation/widgets/common/bounded_scrollable_layout.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/campsite_details_body.dart';
import '../widgets/campsite_navigate_button.dart';
import '../widgets/header_back_button.dart';
import '../widgets/skeletons/campsite_detail_skeleton.dart';

class CampsiteDetailsTabletLayout extends ConsumerWidget {
  const CampsiteDetailsTabletLayout({super.key, required this.campsiteId});

  final String campsiteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsiteAsync = ref.watch(campsiteDetailsProvider(campsiteId));

    return Scaffold(
      appBar: AppBar(
        leading: const HeaderBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Builder(
              builder: (context) {
                return campsiteAsync.when(
                  data: (campsite) {
                    return CampsiteNavigateButton(campsite: campsite);
                  },
                  loading: () => SkeletonLoader(
                    width: 140,
                    height: 42,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  error: (error, stack) => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
      ),
      body: campsiteAsync.when(
        loading: () => const CampsiteDetailSkeleton(),
        error: (error, stack) {
          return Center(child: Text(context.l10n.errorLoadingCampsites));
        },
        data: (campsite) {
          return BoundedScrollableLayout(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CampsiteImage(imageUrl: campsite.photo),
                    ),
                  ),
                  CampsiteDetailsBody(
                    campsite: campsite,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
