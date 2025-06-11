import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';

import 'campsite_amenities_section.dart';
import 'campsite_header_section.dart';
import 'campsite_info_widget.dart';
import 'campsite_map_section.dart';
import 'campsite_suitablility_section.dart';

class CampsiteDetailsBody extends StatelessWidget {
  const CampsiteDetailsBody({super.key, required this.campsite, this.padding});

  final Campsite campsite;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: SafeArea(
        top: false,
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampsiteHeaderSection(campsite: campsite),
            CampsiteInfoSection(
              yearsOfHosting: campsite.yearsOfHosting,
              hostLanguages: campsite.hostLanguages,
            ),
            CampsiteAmenitiesSection(
              campFireAllowed: campsite.isCampFireAllowed,
              closeToWater: campsite.isCloseToWater,
            ),
            if (campsite.suitableFor.isNotEmpty)
              CampsiteSuitablilitySection(suitableFor: campsite.suitableFor),
            CampsiteMapSection(geoLocation: campsite.geoLocation),
          ],
        ),
      ),
    );
  }
}
