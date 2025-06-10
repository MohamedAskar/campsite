import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/strings.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/presentation/widgets/campsite/campsite_image.dart';
import 'package:campsite/presentation/widgets/text_style_injector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/campsite.dart';
import 'amenity_icon.dart';

class CampsiteCard extends StatelessWidget {
  final Campsite campsite;

  const CampsiteCard({super.key, required this.campsite});

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat.currency(
      symbol: '€',
    ).format(campsite.pricePerNight);
    return InkWell(
      onTap: () {
        context.pushNamed('campsite', pathParameters: {'id': campsite.id});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CampsiteImage(imageUrl: campsite.photo),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            campsite.label.capitalize(),
            style: context.textTheme.titleMedium?.bold,
          ),
          const SizedBox(height: 2),
          TextStyleInjector(
            text: '$price per night',
            replacementTextList: [price],
            replacementStyle: context.textTheme.titleSmall?.bold,
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              if (campsite.isCloseToWater)
                AmenityIcon(
                  icon: CampsiteAssets.water,
                  available: campsite.isCloseToWater,
                ),
              if (campsite.isCampFireAllowed)
                AmenityIcon(
                  icon: CampsiteAssets.campfire,
                  available: campsite.isCampFireAllowed,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
