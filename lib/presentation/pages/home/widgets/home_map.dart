import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/presentation/pages/home/controller/home_controller.dart';
import 'package:campsite/presentation/widgets/common/map_zoom_buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// Import cancellable tile provider for web
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class HomeMap extends ConsumerWidget {
  const HomeMap({super.key, required this.campsites});

  final List<Campsite> campsites;

  List<Marker> _buildMarkers(
    List<Campsite> campsites,
    void Function(Campsite campsite) onMarkerTap,
  ) {
    return campsites.map((campsite) {
      return Marker(
        point: LatLng(campsite.geoLocation.lat, campsite.geoLocation.long),
        width: 56,
        height: 56,
        child: GestureDetector(
          onTap: () => onMarkerTap(campsite),
          child: Image.asset(CampsiteAssets.campsite),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final homeState = ref.watch(homeControllerProvider);
    final homeController = ref.read(homeControllerProvider.notifier);

    final mapController = homeState.mapController;

    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: LatLng(20.0, 20.0),
            initialZoom: 3.0,
            maxZoom: 12.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              tileBounds: LatLngBounds(
                const LatLng(-90.0, 180.0),
                const LatLng(90.0, -180.0),
              ),
              tileProvider: kIsWeb ? CancellableNetworkTileProvider() : null,
            ),
            MarkerClusterLayerWidget(
              options: MarkerClusterLayerOptions(
                showPolygon: false,
                maxClusterRadius: 80,
                size: const Size(50, 50),
                markers: _buildMarkers(
                  campsites,
                  homeController.selectCampsite,
                ),
                maxZoom: 8.0,
                zoomToBoundsOnClick: false,
                onClusterTap: (cluster) {
                  final bounds = LatLngBounds.fromPoints(
                    cluster.markers.map((m) => m.point).toList(),
                  );
                  homeController.fitClusterToBounds(bounds);
                },
                builder: (context, markers) {
                  final markerCount = markers.length;
                  if (markerCount == 1) {
                    return markers.first.child;
                  }
                  return Badge(
                    label: Text(markerCount.toString()),
                    backgroundColor: context.colorScheme.primary,
                    textStyle: context.textTheme.bodyMedium?.bold,
                    offset: const Offset(-4, 8),
                    child: Image.asset(CampsiteAssets.campsite),
                  );
                },
              ),
            ),
          ],
        ),
        if (!context.isMobile)
          Positioned(
            right: 16,
            bottom: viewPadding.bottom + 16,
            child: MapZoomButtons(
              onZoomIn: homeController.zoomIn,
              onZoomOut: homeController.zoomOut,
            ),
          ),
      ],
    );
  }
}
