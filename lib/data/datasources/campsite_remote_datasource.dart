import 'package:dio/dio.dart';

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
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to load campsites: ${response.statusCode}',
        );
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw DioException(
        requestOptions: RequestOptions(path: 'campsites'),
        message: 'Failed to load campsites: $e',
      );
    }
  }

  @override
  Future<CampsiteModel> getCampsiteById(String id) async {
    try {
      final response = await dioClient.dio.get('campsites/$id');
      if (response.statusCode == 200) {
        return CampsiteModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to load campsite: ${response.statusCode}',
        );
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw DioException(
        requestOptions: RequestOptions(path: 'campsites/$id'),
        message: 'Failed to load campsite: $e',
      );
    }
  }
}
