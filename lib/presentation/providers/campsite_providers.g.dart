// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campsite_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioClientHash() => r'895f0dc2f8d5eab562ad65390e5c6d4a1f722b0d';

/// See also [dioClient].
@ProviderFor(dioClient)
final dioClientProvider = Provider<DioClient>.internal(
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
typedef DioClientRef = ProviderRef<DioClient>;
String _$campsiteRemoteDataSourceHash() =>
    r'059a2f89184d2788d4eae3474ad8bff46091de73';

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
    r'4ff4375821d00824b7c8664433d944c7c81354a7';

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
String _$getCampsitesHash() => r'e7fd7082c587953400832827e7aae051f46cecf2';

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
String _$getCampsiteDetailsHash() =>
    r'4402c62686dac2dcd8867cafcdf05e8cab348487';

/// See also [getCampsiteDetails].
@ProviderFor(getCampsiteDetails)
final getCampsiteDetailsProvider =
    AutoDisposeProvider<GetCampsiteDetails>.internal(
      getCampsiteDetails,
      name: r'getCampsiteDetailsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getCampsiteDetailsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCampsiteDetailsRef = AutoDisposeProviderRef<GetCampsiteDetails>;
String _$campsiteListHash() => r'510434e4f5763e76132886992fa0ee4919dba1dc';

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
String _$campsiteDetailsHash() => r'f80ddc2e71d780ce2259ee93465f7339463b111d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [campsiteDetails].
@ProviderFor(campsiteDetails)
const campsiteDetailsProvider = CampsiteDetailsFamily();

/// See also [campsiteDetails].
class CampsiteDetailsFamily extends Family<AsyncValue<Campsite>> {
  /// See also [campsiteDetails].
  const CampsiteDetailsFamily();

  /// See also [campsiteDetails].
  CampsiteDetailsProvider call(String id) {
    return CampsiteDetailsProvider(id);
  }

  @override
  CampsiteDetailsProvider getProviderOverride(
    covariant CampsiteDetailsProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'campsiteDetailsProvider';
}

/// See also [campsiteDetails].
class CampsiteDetailsProvider extends AutoDisposeFutureProvider<Campsite> {
  /// See also [campsiteDetails].
  CampsiteDetailsProvider(String id)
    : this._internal(
        (ref) => campsiteDetails(ref as CampsiteDetailsRef, id),
        from: campsiteDetailsProvider,
        name: r'campsiteDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$campsiteDetailsHash,
        dependencies: CampsiteDetailsFamily._dependencies,
        allTransitiveDependencies:
            CampsiteDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  CampsiteDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Campsite> Function(CampsiteDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CampsiteDetailsProvider._internal(
        (ref) => create(ref as CampsiteDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Campsite> createElement() {
    return _CampsiteDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CampsiteDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CampsiteDetailsRef on AutoDisposeFutureProviderRef<Campsite> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CampsiteDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Campsite>
    with CampsiteDetailsRef {
  _CampsiteDetailsProviderElement(super.provider);

  @override
  String get id => (origin as CampsiteDetailsProvider).id;
}

String _$filteredAndSortedCampsiteListHash() =>
    r'1fa26da34f797354f25190ea3c1c6456c0750e2c';

/// See also [filteredAndSortedCampsiteList].
@ProviderFor(filteredAndSortedCampsiteList)
final filteredAndSortedCampsiteListProvider =
    AutoDisposeFutureProvider<List<Campsite>>.internal(
      filteredAndSortedCampsiteList,
      name: r'filteredAndSortedCampsiteListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$filteredAndSortedCampsiteListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredAndSortedCampsiteListRef =
    AutoDisposeFutureProviderRef<List<Campsite>>;
String _$priceRangeHash() => r'bb7f321ff08790c4a8106c649cc25dc44ef8ffa1';

/// See also [priceRange].
@ProviderFor(priceRange)
final priceRangeProvider =
    AutoDisposeFutureProvider<({double min, double max})>.internal(
      priceRange,
      name: r'priceRangeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$priceRangeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PriceRangeRef =
    AutoDisposeFutureProviderRef<({double min, double max})>;
String _$availableHostLanguagesHash() =>
    r'933eff5e0820149b01aa0c62f94015e08329f0e2';

/// See also [availableHostLanguages].
@ProviderFor(availableHostLanguages)
final availableHostLanguagesProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
      availableHostLanguages,
      name: r'availableHostLanguagesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availableHostLanguagesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableHostLanguagesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$availableSuitableForHash() =>
    r'dcee012c055984d497df9b68cf07fc93586f5d5b';

/// See also [availableSuitableFor].
@ProviderFor(availableSuitableFor)
final availableSuitableForProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
      availableSuitableFor,
      name: r'availableSuitableForProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$availableSuitableForHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableSuitableForRef = AutoDisposeFutureProviderRef<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
