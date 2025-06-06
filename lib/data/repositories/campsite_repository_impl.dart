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
      return campsiteModels.map((model) => model.toDomain()).toList();
    } catch (e) {
      throw Exception('Failed to get campsites: $e');
    }
  }
}
