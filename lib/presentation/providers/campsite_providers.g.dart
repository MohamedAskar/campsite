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

String _$filteredCampsiteListHash() =>
    r'f90e6e7cef1c51fe7671739d19cb67d79cacd542';

/// See also [filteredCampsiteList].
@ProviderFor(filteredCampsiteList)
final filteredCampsiteListProvider =
    AutoDisposeFutureProvider<List<Campsite>>.internal(
      filteredCampsiteList,
      name: r'filteredCampsiteListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$filteredCampsiteListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredCampsiteListRef = AutoDisposeFutureProviderRef<List<Campsite>>;
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
String _$campsiteLocationHash() => r'7408d1879d5c93c2a4dddbadb12d29ad97220b8b';

/// See also [campsiteLocation].
@ProviderFor(campsiteLocation)
const campsiteLocationProvider = CampsiteLocationFamily();

/// See also [campsiteLocation].
class CampsiteLocationFamily extends Family<AsyncValue<Placemark?>> {
  /// See also [campsiteLocation].
  const CampsiteLocationFamily();

  /// See also [campsiteLocation].
  CampsiteLocationProvider call(GeoLocation geoLocation) {
    return CampsiteLocationProvider(geoLocation);
  }

  @override
  CampsiteLocationProvider getProviderOverride(
    covariant CampsiteLocationProvider provider,
  ) {
    return call(provider.geoLocation);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'campsiteLocationProvider';
}

/// See also [campsiteLocation].
class CampsiteLocationProvider extends AutoDisposeFutureProvider<Placemark?> {
  /// See also [campsiteLocation].
  CampsiteLocationProvider(GeoLocation geoLocation)
    : this._internal(
        (ref) => campsiteLocation(ref as CampsiteLocationRef, geoLocation),
        from: campsiteLocationProvider,
        name: r'campsiteLocationProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$campsiteLocationHash,
        dependencies: CampsiteLocationFamily._dependencies,
        allTransitiveDependencies:
            CampsiteLocationFamily._allTransitiveDependencies,
        geoLocation: geoLocation,
      );

  CampsiteLocationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.geoLocation,
  }) : super.internal();

  final GeoLocation geoLocation;

  @override
  Override overrideWith(
    FutureOr<Placemark?> Function(CampsiteLocationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CampsiteLocationProvider._internal(
        (ref) => create(ref as CampsiteLocationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        geoLocation: geoLocation,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Placemark?> createElement() {
    return _CampsiteLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CampsiteLocationProvider &&
        other.geoLocation == geoLocation;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, geoLocation.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CampsiteLocationRef on AutoDisposeFutureProviderRef<Placemark?> {
  /// The parameter `geoLocation` of this provider.
  GeoLocation get geoLocation;
}

class _CampsiteLocationProviderElement
    extends AutoDisposeFutureProviderElement<Placemark?>
    with CampsiteLocationRef {
  _CampsiteLocationProviderElement(super.provider);

  @override
  GeoLocation get geoLocation =>
      (origin as CampsiteLocationProvider).geoLocation;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
