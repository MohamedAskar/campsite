import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/domain/entities/geo_location.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/presentation/widgets/common/skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

class LocationWidget extends ConsumerWidget {
  final GeoLocation geoLocation;

  const LocationWidget({super.key, required this.geoLocation});

  String _formatAddress(Placemark? place, BuildContext context) {
    if (place == null) {
      return context.l10n.unknownLocation;
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
      return context.l10n.unknownLocation;
    }

    return addressParts.join(', ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placemarkAsync = ref.watch(campsiteLocationProvider(geoLocation));

    return placemarkAsync.when(
      data: (placemark) => Text(
        _formatAddress(placemark, context),
        style: context.textTheme.bodySmall,
      ),
      loading: () => const SkeletonLoader(width: 150, height: 12),
      error: (error, stack) => Text(
        context.l10n.locationUnavailable,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.error,
        ),
      ),
    );
  }
}
