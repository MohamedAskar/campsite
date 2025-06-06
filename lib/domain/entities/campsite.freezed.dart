// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Campsite {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  GeoLocation get geoLocation => throw _privateConstructorUsedError;
  bool get isCloseToWater => throw _privateConstructorUsedError;
  bool get isCampFireAllowed => throw _privateConstructorUsedError;
  List<String> get hostLanguages => throw _privateConstructorUsedError;
  double get pricePerNight => throw _privateConstructorUsedError;
  List<String> get suitableFor => throw _privateConstructorUsedError;

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CampsiteCopyWith<Campsite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampsiteCopyWith<$Res> {
  factory $CampsiteCopyWith(Campsite value, $Res Function(Campsite) then) =
      _$CampsiteCopyWithImpl<$Res, Campsite>;
  @useResult
  $Res call({
    String id,
    DateTime createdAt,
    String label,
    String photo,
    GeoLocation geoLocation,
    bool isCloseToWater,
    bool isCampFireAllowed,
    List<String> hostLanguages,
    double pricePerNight,
    List<String> suitableFor,
  });

  $GeoLocationCopyWith<$Res> get geoLocation;
}

/// @nodoc
class _$CampsiteCopyWithImpl<$Res, $Val extends Campsite>
    implements $CampsiteCopyWith<$Res> {
  _$CampsiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? label = null,
    Object? photo = null,
    Object? geoLocation = null,
    Object? isCloseToWater = null,
    Object? isCampFireAllowed = null,
    Object? hostLanguages = null,
    Object? pricePerNight = null,
    Object? suitableFor = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            photo: null == photo
                ? _value.photo
                : photo // ignore: cast_nullable_to_non_nullable
                      as String,
            geoLocation: null == geoLocation
                ? _value.geoLocation
                : geoLocation // ignore: cast_nullable_to_non_nullable
                      as GeoLocation,
            isCloseToWater: null == isCloseToWater
                ? _value.isCloseToWater
                : isCloseToWater // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCampFireAllowed: null == isCampFireAllowed
                ? _value.isCampFireAllowed
                : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
                      as bool,
            hostLanguages: null == hostLanguages
                ? _value.hostLanguages
                : hostLanguages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            pricePerNight: null == pricePerNight
                ? _value.pricePerNight
                : pricePerNight // ignore: cast_nullable_to_non_nullable
                      as double,
            suitableFor: null == suitableFor
                ? _value.suitableFor
                : suitableFor // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoLocationCopyWith<$Res> get geoLocation {
    return $GeoLocationCopyWith<$Res>(_value.geoLocation, (value) {
      return _then(_value.copyWith(geoLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CampsiteImplCopyWith<$Res>
    implements $CampsiteCopyWith<$Res> {
  factory _$$CampsiteImplCopyWith(
    _$CampsiteImpl value,
    $Res Function(_$CampsiteImpl) then,
  ) = __$$CampsiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime createdAt,
    String label,
    String photo,
    GeoLocation geoLocation,
    bool isCloseToWater,
    bool isCampFireAllowed,
    List<String> hostLanguages,
    double pricePerNight,
    List<String> suitableFor,
  });

  @override
  $GeoLocationCopyWith<$Res> get geoLocation;
}

/// @nodoc
class __$$CampsiteImplCopyWithImpl<$Res>
    extends _$CampsiteCopyWithImpl<$Res, _$CampsiteImpl>
    implements _$$CampsiteImplCopyWith<$Res> {
  __$$CampsiteImplCopyWithImpl(
    _$CampsiteImpl _value,
    $Res Function(_$CampsiteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? label = null,
    Object? photo = null,
    Object? geoLocation = null,
    Object? isCloseToWater = null,
    Object? isCampFireAllowed = null,
    Object? hostLanguages = null,
    Object? pricePerNight = null,
    Object? suitableFor = null,
  }) {
    return _then(
      _$CampsiteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        photo: null == photo
            ? _value.photo
            : photo // ignore: cast_nullable_to_non_nullable
                  as String,
        geoLocation: null == geoLocation
            ? _value.geoLocation
            : geoLocation // ignore: cast_nullable_to_non_nullable
                  as GeoLocation,
        isCloseToWater: null == isCloseToWater
            ? _value.isCloseToWater
            : isCloseToWater // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCampFireAllowed: null == isCampFireAllowed
            ? _value.isCampFireAllowed
            : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
                  as bool,
        hostLanguages: null == hostLanguages
            ? _value._hostLanguages
            : hostLanguages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        pricePerNight: null == pricePerNight
            ? _value.pricePerNight
            : pricePerNight // ignore: cast_nullable_to_non_nullable
                  as double,
        suitableFor: null == suitableFor
            ? _value._suitableFor
            : suitableFor // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$CampsiteImpl implements _Campsite {
  const _$CampsiteImpl({
    required this.id,
    required this.createdAt,
    required this.label,
    required this.photo,
    required this.geoLocation,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required final List<String> hostLanguages,
    required this.pricePerNight,
    required final List<String> suitableFor,
  }) : _hostLanguages = hostLanguages,
       _suitableFor = suitableFor;

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final String label;
  @override
  final String photo;
  @override
  final GeoLocation geoLocation;
  @override
  final bool isCloseToWater;
  @override
  final bool isCampFireAllowed;
  final List<String> _hostLanguages;
  @override
  List<String> get hostLanguages {
    if (_hostLanguages is EqualUnmodifiableListView) return _hostLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hostLanguages);
  }

  @override
  final double pricePerNight;
  final List<String> _suitableFor;
  @override
  List<String> get suitableFor {
    if (_suitableFor is EqualUnmodifiableListView) return _suitableFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableFor);
  }

  @override
  String toString() {
    return 'Campsite(id: $id, createdAt: $createdAt, label: $label, photo: $photo, geoLocation: $geoLocation, isCloseToWater: $isCloseToWater, isCampFireAllowed: $isCampFireAllowed, hostLanguages: $hostLanguages, pricePerNight: $pricePerNight, suitableFor: $suitableFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampsiteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.geoLocation, geoLocation) ||
                other.geoLocation == geoLocation) &&
            (identical(other.isCloseToWater, isCloseToWater) ||
                other.isCloseToWater == isCloseToWater) &&
            (identical(other.isCampFireAllowed, isCampFireAllowed) ||
                other.isCampFireAllowed == isCampFireAllowed) &&
            const DeepCollectionEquality().equals(
              other._hostLanguages,
              _hostLanguages,
            ) &&
            (identical(other.pricePerNight, pricePerNight) ||
                other.pricePerNight == pricePerNight) &&
            const DeepCollectionEquality().equals(
              other._suitableFor,
              _suitableFor,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    label,
    photo,
    geoLocation,
    isCloseToWater,
    isCampFireAllowed,
    const DeepCollectionEquality().hash(_hostLanguages),
    pricePerNight,
    const DeepCollectionEquality().hash(_suitableFor),
  );

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampsiteImplCopyWith<_$CampsiteImpl> get copyWith =>
      __$$CampsiteImplCopyWithImpl<_$CampsiteImpl>(this, _$identity);
}

abstract class _Campsite implements Campsite {
  const factory _Campsite({
    required final String id,
    required final DateTime createdAt,
    required final String label,
    required final String photo,
    required final GeoLocation geoLocation,
    required final bool isCloseToWater,
    required final bool isCampFireAllowed,
    required final List<String> hostLanguages,
    required final double pricePerNight,
    required final List<String> suitableFor,
  }) = _$CampsiteImpl;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  String get label;
  @override
  String get photo;
  @override
  GeoLocation get geoLocation;
  @override
  bool get isCloseToWater;
  @override
  bool get isCampFireAllowed;
  @override
  List<String> get hostLanguages;
  @override
  double get pricePerNight;
  @override
  List<String> get suitableFor;

  /// Create a copy of Campsite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampsiteImplCopyWith<_$CampsiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
