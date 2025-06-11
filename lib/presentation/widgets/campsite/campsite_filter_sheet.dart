import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/domain/entities/campsite_filter.dart';
import 'package:campsite/presentation/controllers/campsite_filter_controller.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/presentation/widgets/campsite/components/filter_amenities_section.dart';
import 'package:campsite/presentation/widgets/campsite/components/filter_languages_section.dart';
import 'package:campsite/presentation/widgets/campsite/components/filter_price_range_section.dart';
import 'package:campsite/presentation/widgets/campsite/components/filter_suitable_for_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampsiteFilterSheet extends ConsumerWidget {
  const CampsiteFilterSheet({super.key});

  int _getFilteredCampsiteCount(
    List<Campsite> campsites,
    CampsiteFilter filter,
  ) {
    if (!filter.hasActiveFilters) {
      return campsites.length;
    }

    return campsites.where((campsite) {
      // Price filter
      if (filter.minPrice != null &&
          campsite.pricePerNight < filter.minPrice!) {
        return false;
      }
      if (filter.maxPrice != null &&
          campsite.pricePerNight > filter.maxPrice!) {
        return false;
      }

      // Water filter
      if (filter.isCloseToWater != null &&
          campsite.isCloseToWater != filter.isCloseToWater!) {
        return false;
      }

      // Campfire filter
      if (filter.isCampFireAllowed != null &&
          campsite.isCampFireAllowed != filter.isCampFireAllowed!) {
        return false;
      }

      // Host languages filter
      if (filter.hostLanguages.isNotEmpty) {
        final hasRequiredLanguage = filter.hostLanguages.any(
          (language) => campsite.hostLanguages.contains(language),
        );
        if (!hasRequiredLanguage) {
          return false;
        }
      }

      // Suitable for filter
      if (filter.suitableFor.isNotEmpty) {
        final hasRequiredSuitability = filter.suitableFor.any(
          (category) => campsite.suitableFor.contains(category),
        );
        if (!hasRequiredSuitability) {
          return false;
        }
      }

      return true;
    }).length;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.read(campsiteFilterControllerProvider);
    final tempFilterNotifier = ValueNotifier<CampsiteFilter>(currentFilter);
    final campsitesAsync = ref.watch(campsiteListProvider);

    void applyFilters() {
      ref
          .read(campsiteFilterControllerProvider.notifier)
          .updateFilter(tempFilterNotifier.value);
      Navigator.of(context).pop();
    }

    void clearFilters() {
      tempFilterNotifier.value = const CampsiteFilter();
    }

    return ValueListenableBuilder<CampsiteFilter>(
      valueListenable: tempFilterNotifier,
      builder: (context, tempFilter, _) {
        final priceRangeAsync = ref.watch(priceRangeProvider);
        final availableLanguagesAsync = ref.watch(
          availableHostLanguagesProvider,
        );
        final availableCategoriesAsync = ref.watch(
          availableSuitableForProvider,
        );

        // Calculate filtered campsite count
        final filteredCount = campsitesAsync.when(
          data: (campsites) => _getFilteredCampsiteCount(campsites, tempFilter),
          loading: () => 0,
          error: (_, __) => 0,
        );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price Range Filter
                  priceRangeAsync.when(
                    data: (priceRange) => FilterPriceRangeSection(
                      minPrice: priceRange.min,
                      maxPrice: priceRange.max,
                      currentMinPrice: tempFilter.minPrice ?? priceRange.min,
                      currentMaxPrice: tempFilter.maxPrice ?? priceRange.max,
                      onRangeChanged: (min, max) {
                        tempFilterNotifier.value = tempFilter.copyWith(
                          minPrice: min,
                          maxPrice: max,
                        );
                      },
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => const SizedBox.shrink(),
                  ),

                  // Amenities Section
                  FilterAmenitiesSection(
                    isCloseToWater: tempFilter.isCloseToWater,
                    isCampFireAllowed: tempFilter.isCampFireAllowed,
                    onWaterChanged: (value) {
                      tempFilterNotifier.value = tempFilter.copyWith(
                        isCloseToWater: value,
                      );
                    },
                    onCampFireChanged: (value) {
                      tempFilterNotifier.value = tempFilter.copyWith(
                        isCampFireAllowed: value,
                      );
                    },
                  ),

                  // Host Languages Section
                  availableLanguagesAsync.when(
                    data: (languages) => FilterLanguagesSection(
                      availableLanguages: languages,
                      selectedLanguages: tempFilter.hostLanguages,
                      onLanguageToggled: (language) {
                        final currentLanguages = List<String>.from(
                          tempFilter.hostLanguages,
                        );
                        if (currentLanguages.contains(language)) {
                          currentLanguages.remove(language);
                        } else {
                          currentLanguages.add(language);
                        }
                        tempFilterNotifier.value = tempFilter.copyWith(
                          hostLanguages: currentLanguages,
                        );
                      },
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => const SizedBox.shrink(),
                  ),

                  // Suitable For Section
                  availableCategoriesAsync.when(
                    data: (categories) => FilterSuitableForSection(
                      availableCategories: categories,
                      selectedCategories: tempFilter.suitableFor,
                      onCategoryToggled: (category) {
                        final currentCategories = List<String>.from(
                          tempFilter.suitableFor,
                        );
                        if (currentCategories.contains(category)) {
                          currentCategories.remove(category);
                        } else {
                          currentCategories.add(category);
                        }
                        tempFilterNotifier.value = tempFilter.copyWith(
                          suitableFor: currentCategories,
                        );
                      },
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => const SizedBox.shrink(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SafeArea(
                top: false,
                child: Row(
                  spacing: 8,
                  children: [
                    if (tempFilter.hasActiveFilters)
                      OutlinedButton(
                        onPressed: clearFilters,
                        child: Text(context.l10n.clear),
                      ),
                    Expanded(
                      child: FilledButton(
                        onPressed: applyFilters,
                        child: Text(context.l10n.showCampsites(filteredCount)),
                      ),
                    ),
                  ],
                ),
              ),
              if (kIsWeb) const SizedBox(height: 48),
            ],
          ),
        );
      },
    );
  }
}
