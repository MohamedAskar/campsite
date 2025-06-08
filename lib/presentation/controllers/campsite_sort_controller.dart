import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/campsite.dart';
import '../../domain/entities/campsite_sort.dart';

part 'campsite_sort_controller.g.dart';

@riverpod
class CampsiteSortController extends _$CampsiteSortController {
  @override
  CampsiteSort build() {
    return const CampsiteSort();
  }

  void updateSortType(CampsiteSortType sortType) {
    state = state.copyWith(sortType: sortType);
  }

  List<Campsite> applySorting(List<Campsite> campsites) {
    final sortedList = List<Campsite>.from(campsites);

    switch (state.sortType) {
      case CampsiteSortType.priceAsc:
        sortedList.sort((a, b) => a.pricePerNight.compareTo(b.pricePerNight));
        break;
      case CampsiteSortType.priceDesc:
        sortedList.sort((a, b) => b.pricePerNight.compareTo(a.pricePerNight));
        break;
      case CampsiteSortType.newestFirst:
        sortedList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case CampsiteSortType.oldestFirst:
        sortedList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
    }

    return sortedList;
  }
}
