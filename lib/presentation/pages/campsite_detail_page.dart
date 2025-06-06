import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/campsite.dart';
import '../../l10n/app_localizations.dart';
import '../providers/campsite_providers.dart';

class CampsiteDetailPage extends ConsumerWidget {
  final String campsiteId;

  const CampsiteDetailPage({super.key, required this.campsiteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final campsitesAsync = ref.watch(campsiteListProvider);

    return Scaffold(
      body: campsitesAsync.when(
        data: (campsites) {
          final campsite = campsites.firstWhere(
            (c) => c.id == campsiteId,
            orElse: () => throw Exception('Campsite not found'),
          );
          return _buildContent(context, campsite, l10n);
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

  Widget _buildContent(
    BuildContext context,
    Campsite campsite,
    AppLocalizations l10n,
  ) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        // App Bar with Image
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.white),
              onPressed: () {
                // Navigate to map with this campsite highlighted
                // Handle map navigation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Map navigation would be implemented here'),
                  ),
                );
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: campsite.photo,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[200],
                child: const Icon(
                  Icons.landscape,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),

        // Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Languages
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            campsite.label,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (campsite.hostLanguages.isNotEmpty)
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 16,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Languages: ${campsite.hostLanguages.join(', ').toUpperCase()}',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Location
                Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${campsite.geoLocation.lat.toStringAsFixed(6)}, ${campsite.geoLocation.long.toStringAsFixed(6)}',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Price Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.pricePerNight,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '\$${campsite.pricePerNight.toStringAsFixed(0)}',
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: ' / night',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle booking
                        },
                        child: Text(l10n.bookNow),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Features
                if (_hasFeatures(campsite)) ...[
                  Text(
                    'Features',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: _buildFeatureChips(context, campsite),
                  ),
                  const SizedBox(height: 24),
                ],

                // Suitable For
                if (campsite.suitableFor.isNotEmpty) ...[
                  Text(
                    'Suitable For',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: campsite.suitableFor.map((item) {
                      return Chip(
                        label: Text(item.toUpperCase()),
                        backgroundColor: theme.colorScheme.surface,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],

                // Created Date
                Text(
                  'Listed on ${_formatDate(campsite.createdAt)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool _hasFeatures(Campsite campsite) {
    return campsite.isCloseToWater || campsite.isCampFireAllowed;
  }

  List<Widget> _buildFeatureChips(BuildContext context, Campsite campsite) {
    final List<Widget> chips = [];
    final l10n = AppLocalizations.of(context)!;

    if (campsite.isCloseToWater) {
      chips.add(_buildFeatureChip(context, Icons.water, l10n.closeToWater));
    }
    if (campsite.isCampFireAllowed) {
      chips.add(
        _buildFeatureChip(
          context,
          Icons.local_fire_department,
          l10n.campFireAllowed,
        ),
      );
    }

    return chips;
  }

  Widget _buildFeatureChip(BuildContext context, IconData icon, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
