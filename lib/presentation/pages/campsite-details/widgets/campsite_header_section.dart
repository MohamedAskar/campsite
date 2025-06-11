import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/strings.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/presentation/widgets/common/text_style_injector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'location_widget.dart';

class CampsiteHeaderSection extends StatelessWidget {
  const CampsiteHeaderSection({super.key, required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final pricePerNight = NumberFormat.currency(
      symbol: '€',
    ).format(campsite.pricePerNight);

    final titleStyle = context.textTheme.headlineMedium?.bold;

    if (context.isMobile) {
      return Center(
        child: Column(
          spacing: 4,
          children: [
            Text(campsite.label.capitalize(), style: titleStyle),
            if (!kIsWeb) LocationWidget(geoLocation: campsite.geoLocation),
          ],
        ),
      );
    } else {
      return Row(
        spacing: 12,
        children: [
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(campsite.label.capitalize(), style: titleStyle),
                if (!kIsWeb) LocationWidget(geoLocation: campsite.geoLocation),
              ],
            ),
          ),
          TextStyleInjector(
            text: '$pricePerNight ${context.l10n.perNight}',
            style: context.textTheme.bodyMedium,
            replacementTextList: [pricePerNight],
            replacementStyle: context.textTheme.titleLarge?.bold,
          ),
        ],
      );
    }
  }
}
