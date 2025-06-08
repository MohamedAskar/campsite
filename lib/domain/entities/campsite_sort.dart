import 'package:freezed_annotation/freezed_annotation.dart';

part 'campsite_sort.freezed.dart';

enum CampsiteSortType {
  priceAsc('Price: Low to High'),
  priceDesc('Price: High to Low'),
  newestFirst('Newest First'),
  oldestFirst('Oldest First');

  const CampsiteSortType(this.displayName);

  final String displayName;

  bool get isAscending {
    switch (this) {
      case CampsiteSortType.priceAsc:
      case CampsiteSortType.oldestFirst:
        return true;
      case CampsiteSortType.priceDesc:
      case CampsiteSortType.newestFirst:
        return false;
    }
  }

  String get iconName {
    switch (this) {
      case CampsiteSortType.priceAsc:
      case CampsiteSortType.priceDesc:
        return 'euro';
      case CampsiteSortType.newestFirst:
      case CampsiteSortType.oldestFirst:
        return 'calendar';
    }
  }
}

@freezed
class CampsiteSort with _$CampsiteSort {
  const factory CampsiteSort({
    @Default(CampsiteSortType.priceAsc) CampsiteSortType sortType,
  }) = _CampsiteSort;
}
