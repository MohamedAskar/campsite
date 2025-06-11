import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/campsite.dart';
import '../../domain/entities/campsite_filter.dart';

part 'campsite_filter_controller.g.dart';

@riverpod
class CampsiteFilterController extends _$CampsiteFilterController {
  @override
  CampsiteFilter build() {
    return const CampsiteFilter();
  }

  void updateMinPrice(double? price) {
    state = state.copyWith(minPrice: price);
  }

  void updateMaxPrice(double? price) {
    state = state.copyWith(maxPrice: price);
  }

  void updatePriceRange(double minPrice, double maxPrice) {
    state = state.copyWith(minPrice: minPrice, maxPrice: maxPrice);
  }

  void updateIsCloseToWater(bool? value) {
    state = state.copyWith(isCloseToWater: value);
  }

  void updateIsCampFireAllowed(bool? value) {
    state = state.copyWith(isCampFireAllowed: value);
  }

  void updateHostLanguages(List<String> languages) {
    state = state.copyWith(hostLanguages: languages);
  }

  void toggleHostLanguage(String language) {
    final currentLanguages = List<String>.from(state.hostLanguages);
    if (currentLanguages.contains(language)) {
      currentLanguages.remove(language);
    } else {
      currentLanguages.add(language);
    }
    state = state.copyWith(hostLanguages: currentLanguages);
  }

  void updateSuitableFor(List<String> suitableFor) {
    state = state.copyWith(suitableFor: suitableFor);
  }

  void toggleSuitableFor(String category) {
    final currentSuitableFor = List<String>.from(state.suitableFor);
    if (currentSuitableFor.contains(category)) {
      currentSuitableFor.remove(category);
    } else {
      currentSuitableFor.add(category);
    }
    state = state.copyWith(suitableFor: currentSuitableFor);
  }

  void clearFilters() {
    state = const CampsiteFilter();
  }

  void updateFilter(CampsiteFilter filter) {
    state = filter;
  }

  List<Campsite> applyFilters(List<Campsite> campsites) {
    if (!state.hasActiveFilters) {
      return campsites;
    }

    return campsites.where((campsite) {
      // Price filter
      if (state.minPrice != null && campsite.pricePerNight < state.minPrice!) {
        return false;
      }
      if (state.maxPrice != null && campsite.pricePerNight > state.maxPrice!) {
        return false;
      }

      // Water filter
      if (state.isCloseToWater != null &&
          campsite.isCloseToWater != state.isCloseToWater!) {
        return false;
      }

      // Campfire filter
      if (state.isCampFireAllowed != null &&
          campsite.isCampFireAllowed != state.isCampFireAllowed!) {
        return false;
      }

      // Host languages filter
      if (state.hostLanguages.isNotEmpty) {
        final hasRequiredLanguage = state.hostLanguages.any(
          (language) => campsite.hostLanguages.contains(language),
        );
        if (!hasRequiredLanguage) {
          return false;
        }
      }

      // Suitable for filter
      if (state.suitableFor.isNotEmpty) {
        final hasRequiredSuitability = state.suitableFor.any(
          (category) => campsite.suitableFor.contains(category),
        );
        if (!hasRequiredSuitability) {
          return false;
        }
      }

      return true;
    }).toList();
  }
}
