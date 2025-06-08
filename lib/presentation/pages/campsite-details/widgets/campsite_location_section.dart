import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../widgets/campsite/campsite_marker.dart';

class CampsiteLocationSection extends StatelessWidget {
  const CampsiteLocationSection({super.key, required this.geoLocation});

  final GeoLocation geoLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location', style: context.textTheme.titleMedium?.bold),
        SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 1.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(geoLocation.lat, geoLocation.long),
                initialZoom: 8.0,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.campsite',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(geoLocation.lat, geoLocation.long),
                      width: 42,
                      height: 42,
                      child: CampsiteMarker(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
