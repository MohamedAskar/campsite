import 'package:cached_network_image/cached_network_image.dart';
import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/strings.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../providers/campsite_providers.dart';

class CampsiteDetailPage extends ConsumerWidget {
  final String campsiteId;

  const CampsiteDetailPage({super.key, required this.campsiteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final campsiteAsync = ref.watch(campsiteDetailsProvider(campsiteId));

    return Scaffold(
      body: campsiteAsync.when(
        data: (campsite) {
          return Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 240,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(24),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: campsite.photo,
                            fit: BoxFit.cover,
                            height: 300,
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Text(
                        campsite.label.capitalize(),
                        style: context.textTheme.headlineMedium?.bold,
                      ),
                      Row(
                        children: [
                          SizedBox.square(
                            dimension: 48,
                            child: Image.asset(CampsiteAssets.campsite),
                          ),
                          SizedBox(width: 8),
                          Text('Campsite', style: context.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: context.colorScheme.outlineVariant,
                        width: 1,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.shadow.withValues(
                          alpha: 0.2,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, -10),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    top: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: NumberFormat.currency(
                                  symbol: '€',
                                ).format(campsite.pricePerNight / 1000),
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' night',
                                style: context.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        FilledButton(onPressed: () {}, child: Text('Navigate')),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.errorLoadingCampsites),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(campsiteListProvider),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
