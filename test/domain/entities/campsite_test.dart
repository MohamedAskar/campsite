import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/domain/entities/geo_location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Campsite Entity', () {
    test('should calculate yearsOfHosting correctly', () {
      // Arrange
      final currentYear = DateTime.now().year;
      final createdAt = DateTime(currentYear - 3, 5, 15);

      final campsite = Campsite(
        id: 'test-id',
        createdAt: createdAt,
        label: 'Test Campsite',
        photo: 'https://example.com/photo.jpg',
        geoLocation: const GeoLocation(lat: 40.7128, long: -74.0060),
        isCloseToWater: true,
        isCampFireAllowed: false,
        hostLanguages: ['en'],
        pricePerNight: 50.0,
        suitableFor: ['solo'],
      );

      // Act & Assert
      expect(campsite.yearsOfHosting, 3);
    });

    test('should calculate yearsOfHosting as 0 for current year creation', () {
      // Arrange
      final currentYear = DateTime.now().year;
      final campsite = Campsite(
        id: 'test-id',
        createdAt: DateTime(currentYear, 1, 1),
        label: 'New Campsite',
        photo: 'https://example.com/photo.jpg',
        geoLocation: const GeoLocation(lat: 40.7128, long: -74.0060),
        isCloseToWater: false,
        isCampFireAllowed: true,
        hostLanguages: ['en'],
        pricePerNight: 30.0,
        suitableFor: ['backpackers'],
      );

      // Act & Assert
      expect(campsite.yearsOfHosting, 0);
    });
  });
}
