import '../entities/campsite.dart';
import '../repositories/campsite_repository.dart';

class GetCampsites {
  final CampsiteRepository repository;

  GetCampsites(this.repository);

  Future<List<Campsite>> call() async {
    return await repository.getCampsites();
  }
}
