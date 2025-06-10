import 'package:campsite/domain/entities/campsite_filter.dart';
import 'package:campsite/presentation/controllers/campsite_filter_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test/helpers/campsite_test_helper.dart';

void main() {
  group('CampsiteFilterController', () {
    late ProviderContainer container;
    late CampsiteFilterController controller;

    setUp(() {
      container = ProviderContainer();
      controller = container.read(campsiteFilterControllerProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('should update filters and clear them', () {
      // Test initial state
      expect(
        container.read(campsiteFilterControllerProvider),
        const CampsiteFilter(),
      );

      // Test updating filters
      controller.updatePriceRange(30.0, 150.0);
      controller.updateIsCloseToWater(true);
      controller.toggleHostLanguage('en');

      final state = container.read(campsiteFilterControllerProvider);
      expect(state.minPrice, 30.0);
      expect(state.maxPrice, 150.0);
      expect(state.isCloseToWater, true);
      expect(state.hostLanguages, ['en']);
      expect(state.hasActiveFilters, true);

      // Test clearing filters
      controller.clearFilters();
      expect(
        container.read(campsiteFilterControllerProvider),
        const CampsiteFilter(),
      );
    });

    test('should apply filters correctly', () {
      // Arrange
      final testCampsites = CampsiteTestHelper.createTestCampsiteList();

      // Test no filters - should return all
      var filtered = controller.applyFilters(testCampsites);
      expect(filtered.length, 3);

      // Test price filter
      controller.updateMaxPrice(50.0);
      filtered = controller.applyFilters(testCampsites);
      expect(filtered.length, 1);
      expect(filtered.first.id, '2'); // Budget campsite

      // Test complex filter combination
      controller.clearFilters();
      controller.updateIsCloseToWater(true);
      controller.updateIsCampFireAllowed(false);
      filtered = controller.applyFilters(testCampsites);
      expect(filtered.length, 1);
      expect(filtered.first.id, '3'); // Forest campsite
    });
  });
}
