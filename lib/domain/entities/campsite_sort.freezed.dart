// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite_sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CampsiteSort {
  CampsiteSortType get sortType => throw _privateConstructorUsedError;

  /// Create a copy of CampsiteSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CampsiteSortCopyWith<CampsiteSort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampsiteSortCopyWith<$Res> {
  factory $CampsiteSortCopyWith(
    CampsiteSort value,
    $Res Function(CampsiteSort) then,
  ) = _$CampsiteSortCopyWithImpl<$Res, CampsiteSort>;
  @useResult
  $Res call({CampsiteSortType sortType});
}

/// @nodoc
class _$CampsiteSortCopyWithImpl<$Res, $Val extends CampsiteSort>
    implements $CampsiteSortCopyWith<$Res> {
  _$CampsiteSortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CampsiteSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sortType = null}) {
    return _then(
      _value.copyWith(
            sortType: null == sortType
                ? _value.sortType
                : sortType // ignore: cast_nullable_to_non_nullable
                      as CampsiteSortType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CampsiteSortImplCopyWith<$Res>
    implements $CampsiteSortCopyWith<$Res> {
  factory _$$CampsiteSortImplCopyWith(
    _$CampsiteSortImpl value,
    $Res Function(_$CampsiteSortImpl) then,
  ) = __$$CampsiteSortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CampsiteSortType sortType});
}

/// @nodoc
class __$$CampsiteSortImplCopyWithImpl<$Res>
    extends _$CampsiteSortCopyWithImpl<$Res, _$CampsiteSortImpl>
    implements _$$CampsiteSortImplCopyWith<$Res> {
  __$$CampsiteSortImplCopyWithImpl(
    _$CampsiteSortImpl _value,
    $Res Function(_$CampsiteSortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CampsiteSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sortType = null}) {
    return _then(
      _$CampsiteSortImpl(
        sortType: null == sortType
            ? _value.sortType
            : sortType // ignore: cast_nullable_to_non_nullable
                  as CampsiteSortType,
      ),
    );
  }
}

/// @nodoc

class _$CampsiteSortImpl implements _CampsiteSort {
  const _$CampsiteSortImpl({this.sortType = CampsiteSortType.priceAsc});

  @override
  @JsonKey()
  final CampsiteSortType sortType;

  @override
  String toString() {
    return 'CampsiteSort(sortType: $sortType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampsiteSortImpl &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortType);

  /// Create a copy of CampsiteSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampsiteSortImplCopyWith<_$CampsiteSortImpl> get copyWith =>
      __$$CampsiteSortImplCopyWithImpl<_$CampsiteSortImpl>(this, _$identity);
}

abstract class _CampsiteSort implements CampsiteSort {
  const factory _CampsiteSort({final CampsiteSortType sortType}) =
      _$CampsiteSortImpl;

  @override
  CampsiteSortType get sortType;

  /// Create a copy of CampsiteSort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampsiteSortImplCopyWith<_$CampsiteSortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
