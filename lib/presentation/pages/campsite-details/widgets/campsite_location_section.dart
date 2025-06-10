import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CampsiteLocationSection extends StatefulWidget {
  const CampsiteLocationSection({super.key, required this.geoLocation});

  final GeoLocation geoLocation;

  @override
  State<CampsiteLocationSection> createState() =>
      _CampsiteLocationSectionState();
}

class _CampsiteLocationSectionState extends State<CampsiteLocationSection> {
  bool _isValidCoordinate(double lat, double lng) {
    return lat >= -90.0 && lat <= 90.0 && lng >= -180.0 && lng <= 180.0;
  }

  @override
  Widget build(BuildContext context) {
    final isValidLocation = _isValidCoordinate(
      widget.geoLocation.lat,
      widget.geoLocation.long,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.location, style: context.textTheme.titleMedium?.bold),
        const SizedBox(height: 8),
        if (isValidLocation)
          AspectRatio(
            aspectRatio: 1.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
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
                    userAgentPackageName: 'com.example.campsite',
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
          )
        else
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_off,
                    size: 48,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.locationUnavailable,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
