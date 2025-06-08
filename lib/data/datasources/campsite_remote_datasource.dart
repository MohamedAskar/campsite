import '../../core/network/dio_client.dart';
import '../models/campsite_model.dart';

abstract class CampsiteRemoteDataSource {
  Future<List<CampsiteModel>> getCampsites();
  Future<CampsiteModel> getCampsiteById(String id);
}

class CampsiteRemoteDataSourceImpl implements CampsiteRemoteDataSource {
  final DioClient dioClient;

  CampsiteRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<CampsiteModel>> getCampsites() async {
    try {
      final response = await dioClient.dio.get('campsites');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => CampsiteModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load campsites: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load campsites: $e');
    }
  }

  @override
  Future<CampsiteModel> getCampsiteById(String id) async {
    try {
      final response = await dioClient.dio.get('campsites/$id');
      if (response.statusCode == 200) {
        return CampsiteModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load campsite: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load campsite: $e');
    }
  }
}
