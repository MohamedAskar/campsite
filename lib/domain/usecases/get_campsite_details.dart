import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/domain/repositories/campsite_repository.dart';

class GetCampsiteDetails {
  final CampsiteRepository repository;

  GetCampsiteDetails(this.repository);

  Future<Campsite> call(String id) async {
    return await repository.getCampsiteById(id);
  }
}