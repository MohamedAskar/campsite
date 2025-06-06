import 'package:campsite/data/models/geo_location_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:campsite/data/models/campsite_model.dart';

void main() {
  group('CampsiteModel', () {
    test('should create model from JSON with all fields', () {
      // Arrange
      final json = {
        'id': '1',
        'createdAt': '2022-09-11T14:25:09.496Z',
        'label': 'Test Campsite',
        'photo': 'https://example.com/photo.jpg',
        'geoLocation': {'lat': 40.7128, 'long': -74.0060},
        'isCloseToWater': true,
        'isCampFireAllowed': false,
        'hostLanguages': ['en', 'de'],
        'pricePerNight': 75.5,
        'suitableFor': ['family', 'couples'],
      };

      // Act
      final model = CampsiteModel.fromJson(json);

      // Assert
      expect(model.id, '1');
      expect(model.createdAt, DateTime.parse('2022-09-11T14:25:09.496Z'));
      expect(model.label, 'Test Campsite');
      expect(model.photo, 'https://example.com/photo.jpg');
      expect(model.geoLocation.lat, 40.7128);
      expect(model.geoLocation.long, -74.0060);
      expect(model.isCloseToWater, true);
      expect(model.isCampFireAllowed, false);
      expect(model.hostLanguages, ['en', 'de']);
      expect(model.pricePerNight, 75.5);
      expect(model.suitableFor, ['family', 'couples']);
    });

    test('should create model with empty suitableFor array', () {
      // Arrange
      final json = {
        'id': '2',
        'createdAt': '2022-09-11T14:25:09.496Z',
        'label': 'Test Campsite 2',
        'photo': 'https://example.com/photo2.jpg',
        'geoLocation': {'lat': 35.0, 'long': -120.0},
        'isCloseToWater': false,
        'isCampFireAllowed': true,
        'hostLanguages': ['en'],
        'pricePerNight': 50.0,
        'suitableFor': [],
      };

      // Act
      final model = CampsiteModel.fromJson(json);

      // Assert
      expect(model.id, '2');
      expect(model.suitableFor, isEmpty);
      expect(model.isCloseToWater, false);
      expect(model.isCampFireAllowed, true);
      expect(model.hostLanguages, ['en']);
    });

    test('should convert to domain entity correctly', () {
      // Arrange
      final model = CampsiteModel(
        id: '1',
        createdAt: DateTime.parse('2022-09-11T14:25:09.496Z'),
        label: 'Domain Test Campsite',
        photo: 'https://example.com/test.jpg',
        geoLocation: const GeoLocationModel(lat: 45.0, long: -90.0),
        isCloseToWater: true,
        isCampFireAllowed: false,
        hostLanguages: ['en', 'fr'],
        pricePerNight: 100.0,
        suitableFor: ['solo', 'couples'],
      );

      // Act
      final domain = model.toDomain();

      // Assert
      expect(domain.id, '1');
      expect(domain.createdAt, DateTime.parse('2022-09-11T14:25:09.496Z'));
      expect(domain.label, 'Domain Test Campsite');
      expect(domain.photo, 'https://example.com/test.jpg');
      expect(domain.geoLocation.lat, 45.0);
      expect(domain.geoLocation.long, -90.0);
      expect(domain.isCloseToWater, true);
      expect(domain.isCampFireAllowed, false);
      expect(domain.hostLanguages, ['en', 'fr']);
      expect(domain.pricePerNight, 100.0);
      expect(domain.suitableFor, ['solo', 'couples']);
    });

    test('should handle GeoLocationModel serialization', () {
      // Arrange
      final geoLocationJson = {'lat': 37.7749, 'long': -122.4194};

      // Act
      final geoLocation = GeoLocationModel.fromJson(geoLocationJson);
      final serialized = geoLocation.toJson();

      // Assert
      expect(geoLocation.lat, 37.7749);
      expect(geoLocation.long, -122.4194);
      expect(serialized['lat'], 37.7749);
      expect(serialized['long'], -122.4194);
    });

    test('should convert GeoLocationModel to domain', () {
      // Arrange
      const geoLocationModel = GeoLocationModel(lat: 50.0, long: 10.0);

      // Act
      final domain = geoLocationModel.toDomain();

      // Assert
      expect(domain.lat, 50.0);
      expect(domain.long, 10.0);
    });
  });
}
