import 'package:campsite/domain/usecases/get_campsites.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test/helpers/campsite_test_helper.dart';

void main() {
  group('GetCampsites Use Case', () {
    late GetCampsites useCase;
    late MockCampsiteRepository mockRepository;

    setUp(() {
      mockRepository = MockCampsiteRepository();
      useCase = GetCampsites(mockRepository);
    });

    test('should return list of campsites from repository', () async {
      // Arrange
      final expectedCampsites = CampsiteTestHelper.createTestCampsiteList();
      mockRepository.setMockCampsites(expectedCampsites);

      // Act
      final actualCampsites = await useCase.call();

      // Assert
      expect(actualCampsites, expectedCampsites);
      expect(mockRepository.getCampsitesCallCount, 1);
    });

    test('should throw exception when repository throws exception', () async {
      // Arrange
      mockRepository.setException(Exception('Failed to fetch campsites'));

      // Act & Assert
      expect(() async => await useCase.call(), throwsA(isA<Exception>()));
    });
  });
}
