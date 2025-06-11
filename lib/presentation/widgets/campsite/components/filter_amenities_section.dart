import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/presentation/widgets/campsite/components/filter_chip.dart';
import 'package:flutter/material.dart';

class FilterAmenitiesSection extends StatelessWidget {
  final bool? isCloseToWater;
  final bool? isCampFireAllowed;
  final void Function(bool?) onWaterChanged;
  final void Function(bool?) onCampFireChanged;

  const FilterAmenitiesSection({
    super.key,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.onWaterChanged,
    required this.onCampFireChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.amenities,
          style: context.textTheme.titleMedium?.bold,
        ),
        const SizedBox(height: 12),
        CampsiteFilterChip(
          label: context.l10n.closeToWater,
          icon: CampsiteAssets.water,
          value: isCloseToWater,
          onChanged: onWaterChanged,
        ),
        const SizedBox(height: 8),
        CampsiteFilterChip(
          label: context.l10n.campFireAllowed,
          icon: CampsiteAssets.campfire,
          value: isCampFireAllowed,
          onChanged: onCampFireChanged,
        ),
      ],
    );
  }
}
