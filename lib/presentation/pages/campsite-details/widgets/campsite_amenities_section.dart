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
        Text(
          context.l10n.amenities,
          style: context.textTheme.titleMedium?.bold,
        ),
        SizedBox(height: 8),
        InfoWidget(
          leading: SizedBox.square(
            dimension: 48,
            child: Image.asset(CampsiteAssets.campfire),
          ),
          title: Text(
            campFireAllowed
                ? context.l10n.campFireAllowedDescription
                : context.l10n.campFireNotAllowed,
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            campFireAllowed
                ? context.l10n.campFireAllowedInfo
                : context.l10n.campFireNotAllowedInfo,
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
            closeToWater
                ? context.l10n.closeToWaterDescription
                : context.l10n.notCloseToWater,
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            closeToWater
                ? context.l10n.closeToWaterInfo
                : context.l10n.noWaterAccess,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
