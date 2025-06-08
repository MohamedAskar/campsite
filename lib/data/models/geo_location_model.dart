import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/geo_location.dart';

part 'geo_location_model.g.dart';

@JsonSerializable()
class GeoLocationModel {
  final double lat;
  final double long;

  const GeoLocationModel({required this.lat, required this.long});

  factory GeoLocationModel.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoLocationModelToJson(this);

  GeoLocation toDomain() => GeoLocation(lat: lat / 1000, long: long / 1000);
}
