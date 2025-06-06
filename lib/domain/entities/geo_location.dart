import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_location.freezed.dart';

@freezed
class GeoLocation with _$GeoLocation {
  const GeoLocation._();
  const factory GeoLocation({required double lat, required double long}) =
      _GeoLocation;
}