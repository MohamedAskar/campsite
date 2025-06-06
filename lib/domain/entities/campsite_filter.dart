import 'package:freezed_annotation/freezed_annotation.dart';

part 'campsite_filter.freezed.dart';

@freezed
class CampsiteFilter with _$CampsiteFilter {
  const factory CampsiteFilter({
    @Default('') String searchQuery,
    @Default(0.0) double minPrice,
    @Default(1000.0) double maxPrice,
    @Default(false) bool isCloseToWater,
    @Default(false) bool isCampFireAllowed,
    @Default(<String>[]) List<String> hostLanguages,
  }) = _CampsiteFilter;

  const CampsiteFilter._();

  bool get hasActiveFilters =>
      searchQuery.isNotEmpty ||
      minPrice > 0 ||
      maxPrice < 1000 ||
      isCloseToWater ||
      isCampFireAllowed ||
      hostLanguages.isNotEmpty;
}
