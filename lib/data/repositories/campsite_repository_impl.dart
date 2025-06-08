import '../../domain/entities/campsite.dart';
import '../../domain/repositories/campsite_repository.dart';
import '../datasources/campsite_remote_datasource.dart';

class CampsiteRepositoryImpl implements CampsiteRepository {
  final CampsiteRemoteDataSource remoteDataSource;

  CampsiteRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Campsite>> getCampsites() async {
    try {
      final campsiteModels = await remoteDataSource.getCampsites();
      final campsites = campsiteModels
          .map((model) => model.toDomain())
          .toList();
      campsites.sort((a, b) => a.label.compareTo(b.label));
      return campsites;
    } catch (e) {
      throw Exception('Failed to get campsites: $e');
    }
  }

  @override
  Future<Campsite> getCampsiteById(String id) async {
    try {
      final campsiteModel = await remoteDataSource.getCampsiteById(id);
      return campsiteModel.toDomain();
    } catch (e) {
      throw Exception('Failed to get campsite: $e');
    }
  }
}
