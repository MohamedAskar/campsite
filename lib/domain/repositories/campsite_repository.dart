import '../entities/campsite.dart';

abstract class CampsiteRepository {
  Future<List<Campsite>> getCampsites();
  Future<Campsite> getCampsiteById(String id);
}
