import 'package:campsite/domain/entities/campsite_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CampsiteFilter Entity', () {
    test('should detect active filters correctly', () {
      // Test no filters
      const emptyFilter = CampsiteFilter();
      expect(emptyFilter.hasActiveFilters, false);
      expect(emptyFilter.activeFilterCount, 0);

      // Test price filter
      const priceFilter = CampsiteFilter(minPrice: 50.0, maxPrice: 100.0);
      expect(priceFilter.hasActiveFilters, true);
      expect(priceFilter.activeFilterCount, 1);

      // Test boolean filters
      const booleanFilter = CampsiteFilter(
        isCloseToWater: true,
        isCampFireAllowed: false,
      );
      expect(booleanFilter.hasActiveFilters, true);
      expect(booleanFilter.activeFilterCount, 2);

      // Test list filters
      const listFilter = CampsiteFilter(
        hostLanguages: ['en'],
        suitableFor: ['family'],
      );
      expect(listFilter.hasActiveFilters, true);
      expect(listFilter.activeFilterCount, 2);

      // Test multiple filters
      const multiFilter = CampsiteFilter(
        minPrice: 30.0,
        isCloseToWater: true,
        hostLanguages: ['en', 'de'],
        suitableFor: ['family'],
      );
      expect(multiFilter.hasActiveFilters, true);
      expect(multiFilter.activeFilterCount, 4);
    });
  });
}
