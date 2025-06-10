import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';

import '../../../widgets/campsite/campsite_card.dart';

class SelectedCampsiteCard extends StatelessWidget {
  const SelectedCampsiteCard({
    super.key,
    required this.campsite,
    required this.onClose,
  });

  final Campsite campsite;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Positioned(
      bottom: viewPadding.bottom + 8,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.3),
              blurRadius: 12,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            CampsiteCard(campsite: campsite),
            Positioned(
              top: 4,
              right: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onClose,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: context.colorScheme.surface,
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
