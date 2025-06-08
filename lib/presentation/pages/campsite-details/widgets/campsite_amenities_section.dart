import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

import 'info_widget.dart';

class CampsiteAmenitiesSection extends StatelessWidget {
  const CampsiteAmenitiesSection({
    super.key,
    this.campFireAllowed = false,
    this.closeToWater = false,
  });

  final bool campFireAllowed;
  final bool closeToWater;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amenities', style: context.textTheme.titleMedium?.bold),
        SizedBox(height: 8),
        InfoWidget(
          leading: SizedBox.square(
            dimension: 48,
            child: Image.asset(CampsiteAssets.campfire),
          ),
          title: Text(
            campFireAllowed ? 'Camp fire allowed' : 'Not allowed',
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            campFireAllowed
                ? 'You can set a camp fire here, try to be careful with the fire.'
                : 'No camp fire allowed at this campsite',
            style: context.textTheme.bodySmall,
          ),
        ),
        SizedBox(height: 12),
        InfoWidget(
          leading: SizedBox.square(
            dimension: 48,
            child: Image.asset(CampsiteAssets.water),
          ),
          title: Text(
            closeToWater ? 'Close to water' : 'Not close to water',
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            closeToWater
                ? 'You can fish, swim or just relax by the water'
                : 'No water access at this campsite',
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
