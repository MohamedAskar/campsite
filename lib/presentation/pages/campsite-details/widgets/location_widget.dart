import 'package:campsite/domain/entities/geo_location.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../core/extensions/context.dart';

class LocationWidget extends ConsumerWidget {
  final GeoLocation geoLocation;

  const LocationWidget({super.key, required this.geoLocation});

  String _formatAddress(Placemark? place) {
    if (place == null) {
      return 'Unknown location';
    }

    final List<String> addressParts = [];

    if (place.locality?.isNotEmpty == true) {
      addressParts.add(place.locality!);
    }

    if (place.administrativeArea?.isNotEmpty == true) {
      addressParts.add(place.administrativeArea!);
    }

    if (place.country?.isNotEmpty == true) {
      addressParts.add(place.country!);
    }

    if (addressParts.isEmpty) {
      if (place.name?.isNotEmpty == true) {
        return place.name!;
      }
      return 'Unknown location';
    }

    return addressParts.join(', ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placemarkAsync = ref.watch(campsiteLocationProvider(geoLocation));

    return placemarkAsync.when(
      data: (placemark) =>
          Text(_formatAddress(placemark), style: context.textTheme.bodySmall),
      loading: () => const SizedBox.shrink(),
      error: (error, stack) => Text(
        'Location unavailable',
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.error,
        ),
      ),
    );
  }
}
