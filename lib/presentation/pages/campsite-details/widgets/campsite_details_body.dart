import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';

import 'campsite_amenities_section.dart';
import 'campsite_footer.dart';
import 'campsite_header_section.dart';
import 'campsite_info_widget.dart';
import 'campsite_location_section.dart';
import 'campsite_suitablility_section.dart';

class CampsiteDetailsBody extends StatelessWidget {
  const CampsiteDetailsBody({super.key, required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CampsiteHeaderSection(
                  label: campsite.label,
                  geoLocation: campsite.geoLocation,
                ),
              ),
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
              CampsiteLocationSection(geoLocation: campsite.geoLocation),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CampsiteFooter(campsite: campsite),
        ),
      ],
    );
  }
}
