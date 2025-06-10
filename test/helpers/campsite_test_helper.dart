import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/domain/entities/geo_location.dart';
import 'package:campsite/domain/repositories/campsite_repository.dart';

/// Test helper class providing common test data and utilities
class CampsiteTestHelper {
  static Campsite createTestCampsite({
    String id = 'test-id',
    DateTime? createdAt,
    String label = 'Test Campsite',
    String photo = 'https://example.com/test.jpg',
    GeoLocation geoLocation = const GeoLocation(lat: 40.7128, long: -74.0060),
    bool isCloseToWater = false,
    bool isCampFireAllowed = false,
    List<String> hostLanguages = const ['en'],
    double pricePerNight = 50.0,
    List<String> suitableFor = const ['solo'],
  }) {
    return Campsite(
      id: id,
      createdAt: createdAt ?? DateTime(2020, 1, 1),
      label: label,
      photo: photo,
      geoLocation: geoLocation,
      isCloseToWater: isCloseToWater,
      isCampFireAllowed: isCampFireAllowed,
      hostLanguages: hostLanguages,
      pricePerNight: pricePerNight,
      suitableFor: suitableFor,
    );
  }

  static List<Campsite> createTestCampsiteList() {
    return [
      createTestCampsite(
        id: '1',
        label: 'Expensive Water Campsite',
        isCloseToWater: true,
        isCampFireAllowed: true,
        hostLanguages: ['en', 'de'],
        pricePerNight: 100.0,
        suitableFor: ['family', 'couples'],
      ),
      createTestCampsite(
        id: '2',
        label: 'Budget Mountain Campsite',
        geoLocation: const GeoLocation(lat: 35.0, long: -120.0),
        isCloseToWater: false,
        isCampFireAllowed: false,
        hostLanguages: ['en'],
        pricePerNight: 30.0,
        suitableFor: ['solo', 'backpackers'],
      ),
      createTestCampsite(
        id: '3',
        label: 'Mid-range Forest Campsite',
        geoLocation: const GeoLocation(lat: 45.0, long: -90.0),
        isCloseToWater: true,
        isCampFireAllowed: false,
        hostLanguages: ['fr', 'de'],
        pricePerNight: 60.0,
        suitableFor: ['couples', 'family'],
      ),
    ];
  }
}

/// Mock repository implementation for testing
class MockCampsiteRepository implements CampsiteRepository {
  List<Campsite>? _mockCampsites;
  Campsite? _mockCampsite;
  Exception? _exception;
  int _getCampsitesCallCount = 0;
  int _getCampsiteByIdCallCount = 0;
  String? _lastRequestedId;

  void setMockCampsites(List<Campsite> campsites) {
    _mockCampsites = campsites;
    _exception = null;
  }

  void setMockCampsite(Campsite campsite) {
    _mockCampsite = campsite;
    _exception = null;
  }

  void setException(Exception exception) {
    _exception = exception;
    _mockCampsites = null;
    _mockCampsite = null;
  }

  void reset() {
    _mockCampsites = null;
    _mockCampsite = null;
    _exception = null;
    _getCampsitesCallCount = 0;
    _getCampsiteByIdCallCount = 0;
    _lastRequestedId = null;
  }

  int get getCampsitesCallCount => _getCampsitesCallCount;
  int get getCampsiteByIdCallCount => _getCampsiteByIdCallCount;
  String? get lastRequestedId => _lastRequestedId;

  @override
  Future<List<Campsite>> getCampsites() async {
    _getCampsitesCallCount++;
    if (_exception != null) throw _exception!;
    return _mockCampsites ?? [];
  }

  @override
  Future<Campsite> getCampsiteById(String id) async {
    _getCampsiteByIdCallCount++;
    _lastRequestedId = id;
    if (_exception != null) throw _exception!;
    if (_mockCampsite == null) throw Exception('Campsite not found');
    return _mockCampsite!;
  }
}
