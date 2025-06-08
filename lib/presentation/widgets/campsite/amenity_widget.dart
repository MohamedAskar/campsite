import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';

class AmenityWidget extends StatelessWidget {
  const AmenityWidget({super.key, required this.icon, required this.available});

  final IconData icon;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.primaryContainer,
      ),
      child: Icon(icon, size: 18, color: context.colorScheme.onSurface),
    );
  }
}
