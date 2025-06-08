import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/strings.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/geo_location.dart';
import 'package:flutter/material.dart';

import 'location_widget.dart';

class CampsiteHeaderSection extends StatelessWidget {
  const CampsiteHeaderSection({
    super.key,
    required this.label,
    required this.geoLocation,
  });

  final String label;
  final GeoLocation geoLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(label.capitalize(), style: context.textTheme.headlineMedium?.bold),
        LocationWidget(geoLocation: geoLocation),
      ],
    );
  }
}
