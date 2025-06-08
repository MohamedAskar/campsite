import 'package:freezed_annotation/freezed_annotation.dart';

part 'campsite_filter.freezed.dart';

@freezed
class CampsiteFilter with _$CampsiteFilter {
  const CampsiteFilter._();

  const factory CampsiteFilter({
    @Default(null) double? minPrice,
    @Default(null) double? maxPrice,
    @Default(null) bool? isCloseToWater,
    @Default(null) bool? isCampFireAllowed,
    @Default([]) List<String> hostLanguages,
    @Default([]) List<String> suitableFor,
  }) = _CampsiteFilter;

  bool get hasActiveFilters =>
      minPrice != null ||
      maxPrice != null ||
      isCloseToWater != null ||
      isCampFireAllowed != null ||
      hostLanguages.isNotEmpty ||
      suitableFor.isNotEmpty;

  int get activeFilterCount {
    int count = 0;
    if (minPrice != null || maxPrice != null) count++;
    if (isCloseToWater != null) count++;
    if (isCampFireAllowed != null) count++;
    if (hostLanguages.isNotEmpty) count++;
    if (suitableFor.isNotEmpty) count++;
    return count;
  }
}
