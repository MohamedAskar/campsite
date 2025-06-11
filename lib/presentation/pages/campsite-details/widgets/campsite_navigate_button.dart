import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/strings.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:maps_launcher/maps_launcher.dart';

class CampsiteNavigateButton extends StatelessWidget {
  const CampsiteNavigateButton({super.key, required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => _launchMaps(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.navigation, size: 18),
          SizedBox(width: 8),
          Text(context.l10n.navigate),
        ],
      ),
    );
  }

  Future<void> _launchMaps(BuildContext context) async {
    if (!context.mounted) return;
    MapsLauncher.launchCoordinates(
      campsite.geoLocation.lat,
      campsite.geoLocation.long,
      campsite.label.capitalize(),
    );
  }
}
