import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class HomeMap extends StatelessWidget {
  const HomeMap({
    super.key,
    required this.campsites,
    required this.mapController,
    required this.onClusterTap,
    required this.onMarkerTap,
  });

  final List<Campsite> campsites;
  final MapController mapController;
  final void Function(LatLngBounds bounds) onClusterTap;
  final void Function(Campsite campsite) onMarkerTap;

  List<Marker> _buildMarkers(List<Campsite> campsites) {
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
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: const MapOptions(
        initialCenter: LatLng(20.0, 0.0),
        initialZoom: 2.0,
        minZoom: 1.0,
        maxZoom: 10.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            showPolygon: false,
            maxClusterRadius: 80,
            size: const Size(50, 50),
            markers: _buildMarkers(campsites),
            maxZoom: 8.0,
            zoomToBoundsOnClick: false,
            onClusterTap: (cluster) {
              final bounds = LatLngBounds.fromPoints(
                cluster.markers.map((m) => m.point).toList(),
              );
              onClusterTap(bounds);
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
    );
  }
}
