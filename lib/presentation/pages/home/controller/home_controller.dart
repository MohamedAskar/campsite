import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    final draggableController = DraggableScrollableController();
    final mapController = MapController();

    ref.onDispose(() {
      draggableController.dispose();
      mapController.dispose();
    });

    draggableController.addListener(() {
      final currentSize = state.draggableController.size;

      // Show floating button only when sheet is at max size (0.95)
      final shouldShowButton = currentSize >= 0.95;
      if (state.showFloatingButton != shouldShowButton) {
        state = state.copyWith(showFloatingButton: shouldShowButton);
      }

      // Adjust map zoom based on sheet size
      if (currentSize <= 0.15) {
        // Sheet is at minimum size, zoom in
        state.mapController.move(state.mapController.camera.center, 4);
      } else if (currentSize >= 0.4) {
        // Sheet is expanded, zoom out
        state.mapController.move(state.mapController.camera.center, 2);
      }
    });

    return HomeState(
      draggableController: draggableController,
      mapController: mapController,
    );
  }

  void selectCampsite(Campsite campsite) {
    if (state.selectedCampsite?.id == campsite.id) return;

    state = state.copyWith(selectedCampsite: campsite);
    Future(() {
      state.mapController.move(
        LatLng(campsite.geoLocation.lat, campsite.geoLocation.long),
        7,
      );
    });
  }

  void clearSelectedCampsite() {
    state = state.copyWith(selectedCampsite: null);
    // Wait for widget rebuild, then animate the sheet back to 0.15
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.draggableController.animateTo(
        0.4,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void onFloatingButtonPressed() {
    state.draggableController.animateTo(
      0.15,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void fitClusterToBounds(LatLngBounds bounds) {
    state.mapController.fitCamera(
      CameraFit.bounds(
        bounds: bounds,
        padding: const EdgeInsets.all(80),
        maxZoom: 6.0,
      ),
    );
  }
}
