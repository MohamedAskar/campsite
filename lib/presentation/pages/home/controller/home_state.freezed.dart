// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  Campsite? get selectedCampsite => throw _privateConstructorUsedError;
  bool get showFloatingButton => throw _privateConstructorUsedError;
  DraggableScrollableController get draggableController =>
      throw _privateConstructorUsedError;
  MapController get mapController => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    Campsite? selectedCampsite,
    bool showFloatingButton,
    DraggableScrollableController draggableController,
    MapController mapController,
  });

  $CampsiteCopyWith<$Res>? get selectedCampsite;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCampsite = freezed,
    Object? showFloatingButton = null,
    Object? draggableController = null,
    Object? mapController = null,
  }) {
    return _then(
      _value.copyWith(
            selectedCampsite: freezed == selectedCampsite
                ? _value.selectedCampsite
                : selectedCampsite // ignore: cast_nullable_to_non_nullable
                      as Campsite?,
            showFloatingButton: null == showFloatingButton
                ? _value.showFloatingButton
                : showFloatingButton // ignore: cast_nullable_to_non_nullable
                      as bool,
            draggableController: null == draggableController
                ? _value.draggableController
                : draggableController // ignore: cast_nullable_to_non_nullable
                      as DraggableScrollableController,
            mapController: null == mapController
                ? _value.mapController
                : mapController // ignore: cast_nullable_to_non_nullable
                      as MapController,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CampsiteCopyWith<$Res>? get selectedCampsite {
    if (_value.selectedCampsite == null) {
      return null;
    }

    return $CampsiteCopyWith<$Res>(_value.selectedCampsite!, (value) {
      return _then(_value.copyWith(selectedCampsite: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Campsite? selectedCampsite,
    bool showFloatingButton,
    DraggableScrollableController draggableController,
    MapController mapController,
  });

  @override
  $CampsiteCopyWith<$Res>? get selectedCampsite;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCampsite = freezed,
    Object? showFloatingButton = null,
    Object? draggableController = null,
    Object? mapController = null,
  }) {
    return _then(
      _$HomeStateImpl(
        selectedCampsite: freezed == selectedCampsite
            ? _value.selectedCampsite
            : selectedCampsite // ignore: cast_nullable_to_non_nullable
                  as Campsite?,
        showFloatingButton: null == showFloatingButton
            ? _value.showFloatingButton
            : showFloatingButton // ignore: cast_nullable_to_non_nullable
                  as bool,
        draggableController: null == draggableController
            ? _value.draggableController
            : draggableController // ignore: cast_nullable_to_non_nullable
                  as DraggableScrollableController,
        mapController: null == mapController
            ? _value.mapController
            : mapController // ignore: cast_nullable_to_non_nullable
                  as MapController,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.selectedCampsite,
    this.showFloatingButton = false,
    required this.draggableController,
    required this.mapController,
  });

  @override
  final Campsite? selectedCampsite;
  @override
  @JsonKey()
  final bool showFloatingButton;
  @override
  final DraggableScrollableController draggableController;
  @override
  final MapController mapController;

  @override
  String toString() {
    return 'HomeState(selectedCampsite: $selectedCampsite, showFloatingButton: $showFloatingButton, draggableController: $draggableController, mapController: $mapController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.selectedCampsite, selectedCampsite) ||
                other.selectedCampsite == selectedCampsite) &&
            (identical(other.showFloatingButton, showFloatingButton) ||
                other.showFloatingButton == showFloatingButton) &&
            (identical(other.draggableController, draggableController) ||
                other.draggableController == draggableController) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedCampsite,
    showFloatingButton,
    draggableController,
    mapController,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final Campsite? selectedCampsite,
    final bool showFloatingButton,
    required final DraggableScrollableController draggableController,
    required final MapController mapController,
  }) = _$HomeStateImpl;

  @override
  Campsite? get selectedCampsite;
  @override
  bool get showFloatingButton;
  @override
  DraggableScrollableController get draggableController;
  @override
  MapController get mapController;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
