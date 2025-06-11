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

  // Convert API coordinates to standard lat/long format
  // API provides coordinates in thousands (e.g., 45123 = 45.123°)
  // and clamped to avoid extreme polar coordinates for better map display
  GeoLocation toDomain() => GeoLocation(
    lat: (lat / 1000).clamp(-80.0, 80.0),
    long: (long / 1000).clamp(-160.0, 160.0),
  );
}
