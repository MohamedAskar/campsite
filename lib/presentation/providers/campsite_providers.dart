import 'package:campsite/domain/usecases/get_campsite_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/dio_client.dart';
import '../../data/datasources/campsite_remote_datasource.dart';
import '../../data/repositories/campsite_repository_impl.dart';
import '../../domain/entities/campsite.dart';
import '../../domain/repositories/campsite_repository.dart';
import '../../domain/usecases/get_campsites.dart';
import '../controllers/campsite_filter_controller.dart';
import '../controllers/campsite_sort_controller.dart';

part 'campsite_providers.g.dart';

// Core providers
@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref) {
  return DioClient();
}

@riverpod
CampsiteRemoteDataSource campsiteRemoteDataSource(Ref ref) {
  return CampsiteRemoteDataSourceImpl(ref.watch(dioClientProvider));
}

@riverpod
CampsiteRepository campsiteRepository(Ref ref) {
  return CampsiteRepositoryImpl(ref.watch(campsiteRemoteDataSourceProvider));
}

@riverpod
GetCampsites getCampsites(Ref ref) {
  return GetCampsites(ref.watch(campsiteRepositoryProvider));
}

@riverpod
GetCampsiteDetails getCampsiteDetails(Ref ref) {
  return GetCampsiteDetails(ref.watch(campsiteRepositoryProvider));
}

@riverpod
Future<List<Campsite>> campsiteList(Ref ref) async {
  final getCampsites = ref.watch(getCampsitesProvider);
  return await getCampsites.call();
}

@riverpod
Future<Campsite> campsiteDetails(Ref ref, String id) async {
  final getCampsiteDetails = ref.watch(getCampsiteDetailsProvider);
  return await getCampsiteDetails.call(id);
}

// Filter and Sort related providers
@riverpod
Future<List<Campsite>> filteredAndSortedCampsiteList(Ref ref) async {
  final campsites = await ref.watch(campsiteListProvider.future);
  final filterController = ref.watch(campsiteFilterControllerProvider.notifier);
  final sortController = ref.watch(campsiteSortControllerProvider.notifier);

  // Watch both filter and sort to trigger rebuilds when they change
  ref.watch(campsiteFilterControllerProvider);
  ref.watch(campsiteSortControllerProvider);

  // First apply filters, then apply sorting
  final filteredCampsites = filterController.applyFilters(campsites);
  return sortController.applySorting(filteredCampsites);
}

@riverpod
Future<({double min, double max})> priceRange(Ref ref) async {
  final campsites = await ref.watch(campsiteListProvider.future);

  if (campsites.isEmpty) {
    return (min: 0.0, max: 100.0);
  }

  final prices = campsites.map((c) => c.pricePerNight).toList();
  prices.sort();

  return (min: prices.first, max: prices.last);
}

@riverpod
Future<List<String>> availableHostLanguages(Ref ref) async {
  final campsites = await ref.watch(campsiteListProvider.future);

  final languagesSet = <String>{};
  for (final campsite in campsites) {
    languagesSet.addAll(campsite.hostLanguages);
  }

  final languages = languagesSet.toList();
  languages.sort();
  return languages;
}

@riverpod
Future<List<String>> availableSuitableFor(Ref ref) async {
  final campsites = await ref.watch(campsiteListProvider.future);

  final categoriesSet = <String>{};
  for (final campsite in campsites) {
    categoriesSet.addAll(campsite.suitableFor);
  }

  final categories = categoriesSet.toList();
  categories.sort();
  return categories;
}
