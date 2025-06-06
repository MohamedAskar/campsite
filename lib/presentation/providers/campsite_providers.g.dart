// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campsite_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioClientHash() => r'8b2f86db76ff702eaf0eb16fd9c186e5d62db83e';

/// See also [dioClient].
@ProviderFor(dioClient)
final dioClientProvider = AutoDisposeProvider<DioClient>.internal(
  dioClient,
  name: r'dioClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dioClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioClientRef = AutoDisposeProviderRef<DioClient>;
String _$campsiteRemoteDataSourceHash() =>
    r'fe45afc0d425f8945aace06b99d43b6abfaeb396';

/// See also [campsiteRemoteDataSource].
@ProviderFor(campsiteRemoteDataSource)
final campsiteRemoteDataSourceProvider =
    AutoDisposeProvider<CampsiteRemoteDataSource>.internal(
      campsiteRemoteDataSource,
      name: r'campsiteRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$campsiteRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CampsiteRemoteDataSourceRef =
    AutoDisposeProviderRef<CampsiteRemoteDataSource>;
String _$campsiteRepositoryHash() =>
    r'e2bbd6c8f2d36df086613e5ac5df0f60f56691c8';

/// See also [campsiteRepository].
@ProviderFor(campsiteRepository)
final campsiteRepositoryProvider =
    AutoDisposeProvider<CampsiteRepository>.internal(
      campsiteRepository,
      name: r'campsiteRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$campsiteRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CampsiteRepositoryRef = AutoDisposeProviderRef<CampsiteRepository>;
String _$getCampsitesHash() => r'bbc469eabaab4d1c40b0dc6fef7c5a0d99927b7b';

/// See also [getCampsites].
@ProviderFor(getCampsites)
final getCampsitesProvider = AutoDisposeProvider<GetCampsites>.internal(
  getCampsites,
  name: r'getCampsitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCampsitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCampsitesRef = AutoDisposeProviderRef<GetCampsites>;
String _$campsiteListHash() => r'f4ef73374d5e051f6f5bdeb5a0fe79e11ddf41bb';

/// See also [campsiteList].
@ProviderFor(campsiteList)
final campsiteListProvider = AutoDisposeFutureProvider<List<Campsite>>.internal(
  campsiteList,
  name: r'campsiteListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$campsiteListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CampsiteListRef = AutoDisposeFutureProviderRef<List<Campsite>>;
String _$filteredCampsitesHash() => r'6cd599c03f2fac6d1262766b1715f7d04a3f2a05';

/// See also [filteredCampsites].
@ProviderFor(filteredCampsites)
final filteredCampsitesProvider = AutoDisposeProvider<List<Campsite>>.internal(
  filteredCampsites,
  name: r'filteredCampsitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredCampsitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredCampsitesRef = AutoDisposeProviderRef<List<Campsite>>;
String _$campsiteFilterNotifierHash() =>
    r'5b66c0da4ce6e9a9b5c68d84f549a3f535c31663';

/// See also [CampsiteFilterNotifier].
@ProviderFor(CampsiteFilterNotifier)
final campsiteFilterNotifierProvider =
    AutoDisposeNotifierProvider<
      CampsiteFilterNotifier,
      CampsiteFilter
    >.internal(
      CampsiteFilterNotifier.new,
      name: r'campsiteFilterNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$campsiteFilterNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CampsiteFilterNotifier = AutoDisposeNotifier<CampsiteFilter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
