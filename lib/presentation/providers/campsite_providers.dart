import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/network/dio_client.dart';
import '../../data/datasources/campsite_remote_datasource.dart';
import '../../data/repositories/campsite_repository_impl.dart';
import '../../domain/entities/campsite.dart';
import '../../domain/entities/campsite_filter.dart';
import '../../domain/repositories/campsite_repository.dart';
import '../../domain/usecases/get_campsites.dart';

part 'campsite_providers.g.dart';

// Core providers
@riverpod
DioClient dioClient(DioClientRef ref) {
  return DioClient();
}

@riverpod
CampsiteRemoteDataSource campsiteRemoteDataSource(
  CampsiteRemoteDataSourceRef ref,
) {
  return CampsiteRemoteDataSourceImpl(ref.watch(dioClientProvider));
}

@riverpod
CampsiteRepository campsiteRepository(CampsiteRepositoryRef ref) {
  return CampsiteRepositoryImpl(ref.watch(campsiteRemoteDataSourceProvider));
}

@riverpod
GetCampsites getCampsites(GetCampsitesRef ref) {
  return GetCampsites(ref.watch(campsiteRepositoryProvider));
}

// State providers
@riverpod
class CampsiteFilterNotifier extends _$CampsiteFilterNotifier {
  @override
  CampsiteFilter build() {
    return const CampsiteFilter();
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void updatePriceRange(double min, double max) {
    state = state.copyWith(minPrice: min, maxPrice: max);
  }

  void toggleCloseToWater(bool value) {
    state = state.copyWith(isCloseToWater: value);
  }

  void toggleCampFireAllowed(bool value) {
    state = state.copyWith(isCampFireAllowed: value);
  }

  void updateHostLanguages(List<String> languages) {
    state = state.copyWith(hostLanguages: languages);
  }

  void clearFilters() {
    state = const CampsiteFilter();
  }

  void updateFilter(CampsiteFilter filter) {
    state = filter;
  }
}

@riverpod
Future<List<Campsite>> campsiteList(CampsiteListRef ref) async {
  final getCampsites = ref.watch(getCampsitesProvider);
  return await getCampsites();
}

@riverpod
List<Campsite> filteredCampsites(FilteredCampsitesRef ref) {
  final campsitesAsync = ref.watch(campsiteListProvider);
  final filter = ref.watch(campsiteFilterNotifierProvider);

  return campsitesAsync.when(
    data: (campsites) {
      return campsites.where((campsite) {
        // Search query filter
        if (filter.searchQuery.isNotEmpty) {
          final query = filter.searchQuery.toLowerCase();
          if (!campsite.label.toLowerCase().contains(query)) {
            return false;
          }
        }

        // Price filter
        if (campsite.pricePerNight < filter.minPrice ||
            campsite.pricePerNight > filter.maxPrice) {
          return false;
        }

        // Feature filters
        if (filter.isCloseToWater && !campsite.isCloseToWater) return false;
        if (filter.isCampFireAllowed && !campsite.isCampFireAllowed)
          return false;

        // Host language filter
        if (filter.hostLanguages.isNotEmpty) {
          bool hasMatchingLanguage = false;
          for (final lang in filter.hostLanguages) {
            if (campsite.hostLanguages.contains(lang)) {
              hasMatchingLanguage = true;
              break;
            }
          }
          if (!hasMatchingLanguage) return false;
        }

        return true;
      }).toList()..sort((a, b) => a.label.compareTo(b.label));
    },
    loading: () => [],
    error: (_, __) => [],
  );
}
