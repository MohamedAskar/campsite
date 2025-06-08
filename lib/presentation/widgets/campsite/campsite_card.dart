import 'package:cached_network_image/cached_network_image.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/strings.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../domain/entities/campsite.dart';
import 'amenity_widget.dart';

class CampsiteCard extends StatelessWidget {
  final Campsite campsite;

  const CampsiteCard({super.key, required this.campsite});

  @override
  Widget build(BuildContext context) {
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
              child: CachedNetworkImage(
                imageUrl: campsite.photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            campsite.label.capitalize(),
            style: context.textTheme.titleMedium?.bold,
          ),
          const SizedBox(height: 2),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: NumberFormat.currency(
                    symbol: '€',
                  ).format(campsite.pricePerNight),
                  style: context.textTheme.titleSmall?.bold,
                ),
                TextSpan(text: ' night', style: context.textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              if (campsite.isCloseToWater)
                AmenityWidget(
                  icon: LucideIcons.waves,
                  available: campsite.isCloseToWater,
                ),
              if (campsite.isCampFireAllowed)
                AmenityWidget(
                  icon: LucideIcons.flameKindling,
                  available: campsite.isCampFireAllowed,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
