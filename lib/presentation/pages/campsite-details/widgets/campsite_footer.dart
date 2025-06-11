import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/presentation/widgets/common/text_style_injector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'campsite_navigate_button.dart';

class CampsiteFooter extends StatelessWidget {
  const CampsiteFooter({super.key, required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final pricePerNight = NumberFormat.currency(
      symbol: '€',
    ).format(campsite.pricePerNight);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          top: BorderSide(color: context.colorScheme.outlineVariant, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextStyleInjector(
              text: '$pricePerNight ${context.l10n.perNight}',
              style: context.textTheme.bodyMedium,
              replacementTextList: [pricePerNight],
              replacementStyle: context.textTheme.titleLarge?.bold,
            ),
            CampsiteNavigateButton(campsite: campsite),
          ],
        ),
      ),
    );
  }
}
