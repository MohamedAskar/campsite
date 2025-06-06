import '../entities/campsite.dart';

abstract class CampsiteRepository {
  Future<List<Campsite>> getCampsites();
}
