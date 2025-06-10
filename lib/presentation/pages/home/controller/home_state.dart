import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    Campsite? selectedCampsite,
    @Default(false) bool showFloatingButton,
    required DraggableScrollableController draggableController,
    required MapController mapController,
  }) = _HomeState;
}
