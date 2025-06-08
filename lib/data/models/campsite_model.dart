import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/campsite.dart';
import 'geo_location_model.dart';

part 'campsite_model.g.dart';

@JsonSerializable()
class CampsiteModel {
  final String id;
  final DateTime createdAt;
  final String label;
  final String photo;
  final GeoLocationModel geoLocation;
  final bool isCloseToWater;
  final bool isCampFireAllowed;
  final List<String> hostLanguages;
  final double pricePerNight;
  final List<String> suitableFor;

  const CampsiteModel({
    required this.id,
    required this.createdAt,
    required this.label,
    required this.photo,
    required this.geoLocation,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.hostLanguages,
    required this.pricePerNight,
    required this.suitableFor,
  });

  factory CampsiteModel.fromJson(Map<String, dynamic> json) =>
      _$CampsiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampsiteModelToJson(this);

  Campsite toDomain() => Campsite(
    id: id,
    createdAt: createdAt,
    label: label,
    photo: photo,
    geoLocation: geoLocation.toDomain(),
    isCloseToWater: isCloseToWater,
    isCampFireAllowed: isCampFireAllowed,
    hostLanguages: hostLanguages,
    pricePerNight: pricePerNight,
    suitableFor: suitableFor,
  );
}
