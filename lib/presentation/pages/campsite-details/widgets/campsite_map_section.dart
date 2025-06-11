import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/geo_location.dart';
import 'package:campsite/presentation/widgets/common/map_zoom_buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// Import cancellable tile provider for web
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

class CampsiteMapSection extends StatefulWidget {
  const CampsiteMapSection({super.key, required this.geoLocation});

  final GeoLocation geoLocation;

  @override
  State<CampsiteMapSection> createState() => _CampsiteMapSectionState();
}

class _CampsiteMapSectionState extends State<CampsiteMapSection> {
  final mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void _zoomIn() {
    mapController.move(
      mapController.camera.center,
      mapController.camera.zoom + 1,
    );
  }

  void _zoomOut() {
    mapController.move(
      mapController.camera.center,
      mapController.camera.zoom - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.location, style: context.textTheme.titleMedium?.bold),
        const SizedBox(height: 8),
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      widget.geoLocation.lat,
                      widget.geoLocation.long,
                    ),
                    initialZoom: 8.0,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.none,
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      tileProvider: kIsWeb
                          ? CancellableNetworkTileProvider()
                          : null,
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(
                            widget.geoLocation.lat,
                            widget.geoLocation.long,
                          ),
                          width: 48,
                          height: 48,
                          child: Image.asset(
                            CampsiteAssets.campsite,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: MapZoomButtons(onZoomIn: _zoomIn, onZoomOut: _zoomOut),
            ),
          ],
        ),
      ],
    );
  }
}
