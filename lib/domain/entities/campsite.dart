import 'package:freezed_annotation/freezed_annotation.dart';
import 'geo_location.dart';

part 'campsite.freezed.dart';

@freezed
class Campsite with _$Campsite {
  const Campsite._();
  const factory Campsite({
    required String id,
    required DateTime createdAt,
    required String label,
    required String photo,
    required GeoLocation geoLocation,
    required bool isCloseToWater,
    required bool isCampFireAllowed,
    required List<String> hostLanguages,
    required double pricePerNight,
    required List<String> suitableFor,
  }) = _Campsite;

  int get yearsOfHosting => DateTime.now().year - createdAt.year;
}
