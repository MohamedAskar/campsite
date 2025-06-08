// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CampsiteFilter {
  double? get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;
  bool? get isCloseToWater => throw _privateConstructorUsedError;
  bool? get isCampFireAllowed => throw _privateConstructorUsedError;
  List<String> get hostLanguages => throw _privateConstructorUsedError;
  List<String> get suitableFor => throw _privateConstructorUsedError;

  /// Create a copy of CampsiteFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CampsiteFilterCopyWith<CampsiteFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampsiteFilterCopyWith<$Res> {
  factory $CampsiteFilterCopyWith(
    CampsiteFilter value,
    $Res Function(CampsiteFilter) then,
  ) = _$CampsiteFilterCopyWithImpl<$Res, CampsiteFilter>;
  @useResult
  $Res call({
    double? minPrice,
    double? maxPrice,
    bool? isCloseToWater,
    bool? isCampFireAllowed,
    List<String> hostLanguages,
    List<String> suitableFor,
  });
}

/// @nodoc
class _$CampsiteFilterCopyWithImpl<$Res, $Val extends CampsiteFilter>
    implements $CampsiteFilterCopyWith<$Res> {
  _$CampsiteFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CampsiteFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? isCloseToWater = freezed,
    Object? isCampFireAllowed = freezed,
    Object? hostLanguages = null,
    Object? suitableFor = null,
  }) {
    return _then(
      _value.copyWith(
            minPrice: freezed == minPrice
                ? _value.minPrice
                : minPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxPrice: freezed == maxPrice
                ? _value.maxPrice
                : maxPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            isCloseToWater: freezed == isCloseToWater
                ? _value.isCloseToWater
                : isCloseToWater // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isCampFireAllowed: freezed == isCampFireAllowed
                ? _value.isCampFireAllowed
                : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            hostLanguages: null == hostLanguages
                ? _value.hostLanguages
                : hostLanguages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            suitableFor: null == suitableFor
                ? _value.suitableFor
                : suitableFor // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CampsiteFilterImplCopyWith<$Res>
    implements $CampsiteFilterCopyWith<$Res> {
  factory _$$CampsiteFilterImplCopyWith(
    _$CampsiteFilterImpl value,
    $Res Function(_$CampsiteFilterImpl) then,
  ) = __$$CampsiteFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? minPrice,
    double? maxPrice,
    bool? isCloseToWater,
    bool? isCampFireAllowed,
    List<String> hostLanguages,
    List<String> suitableFor,
  });
}

/// @nodoc
class __$$CampsiteFilterImplCopyWithImpl<$Res>
    extends _$CampsiteFilterCopyWithImpl<$Res, _$CampsiteFilterImpl>
    implements _$$CampsiteFilterImplCopyWith<$Res> {
  __$$CampsiteFilterImplCopyWithImpl(
    _$CampsiteFilterImpl _value,
    $Res Function(_$CampsiteFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CampsiteFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? isCloseToWater = freezed,
    Object? isCampFireAllowed = freezed,
    Object? hostLanguages = null,
    Object? suitableFor = null,
  }) {
    return _then(
      _$CampsiteFilterImpl(
        minPrice: freezed == minPrice
            ? _value.minPrice
            : minPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxPrice: freezed == maxPrice
            ? _value.maxPrice
            : maxPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        isCloseToWater: freezed == isCloseToWater
            ? _value.isCloseToWater
            : isCloseToWater // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isCampFireAllowed: freezed == isCampFireAllowed
            ? _value.isCampFireAllowed
            : isCampFireAllowed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        hostLanguages: null == hostLanguages
            ? _value._hostLanguages
            : hostLanguages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        suitableFor: null == suitableFor
            ? _value._suitableFor
            : suitableFor // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$CampsiteFilterImpl extends _CampsiteFilter {
  const _$CampsiteFilterImpl({
    this.minPrice = null,
    this.maxPrice = null,
    this.isCloseToWater = null,
    this.isCampFireAllowed = null,
    final List<String> hostLanguages = const [],
    final List<String> suitableFor = const [],
  }) : _hostLanguages = hostLanguages,
       _suitableFor = suitableFor,
       super._();

  @override
  @JsonKey()
  final double? minPrice;
  @override
  @JsonKey()
  final double? maxPrice;
  @override
  @JsonKey()
  final bool? isCloseToWater;
  @override
  @JsonKey()
  final bool? isCampFireAllowed;
  final List<String> _hostLanguages;
  @override
  @JsonKey()
  List<String> get hostLanguages {
    if (_hostLanguages is EqualUnmodifiableListView) return _hostLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hostLanguages);
  }

  final List<String> _suitableFor;
  @override
  @JsonKey()
  List<String> get suitableFor {
    if (_suitableFor is EqualUnmodifiableListView) return _suitableFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableFor);
  }

  @override
  String toString() {
    return 'CampsiteFilter(minPrice: $minPrice, maxPrice: $maxPrice, isCloseToWater: $isCloseToWater, isCampFireAllowed: $isCampFireAllowed, hostLanguages: $hostLanguages, suitableFor: $suitableFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampsiteFilterImpl &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.isCloseToWater, isCloseToWater) ||
                other.isCloseToWater == isCloseToWater) &&
            (identical(other.isCampFireAllowed, isCampFireAllowed) ||
                other.isCampFireAllowed == isCampFireAllowed) &&
            const DeepCollectionEquality().equals(
              other._hostLanguages,
              _hostLanguages,
            ) &&
            const DeepCollectionEquality().equals(
              other._suitableFor,
              _suitableFor,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    minPrice,
    maxPrice,
    isCloseToWater,
    isCampFireAllowed,
    const DeepCollectionEquality().hash(_hostLanguages),
    const DeepCollectionEquality().hash(_suitableFor),
  );

  /// Create a copy of CampsiteFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampsiteFilterImplCopyWith<_$CampsiteFilterImpl> get copyWith =>
      __$$CampsiteFilterImplCopyWithImpl<_$CampsiteFilterImpl>(
        this,
        _$identity,
      );
}

abstract class _CampsiteFilter extends CampsiteFilter {
  const factory _CampsiteFilter({
    final double? minPrice,
    final double? maxPrice,
    final bool? isCloseToWater,
    final bool? isCampFireAllowed,
    final List<String> hostLanguages,
    final List<String> suitableFor,
  }) = _$CampsiteFilterImpl;
  const _CampsiteFilter._() : super._();

  @override
  double? get minPrice;
  @override
  double? get maxPrice;
  @override
  bool? get isCloseToWater;
  @override
  bool? get isCampFireAllowed;
  @override
  List<String> get hostLanguages;
  @override
  List<String> get suitableFor;

  /// Create a copy of CampsiteFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampsiteFilterImplCopyWith<_$CampsiteFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
