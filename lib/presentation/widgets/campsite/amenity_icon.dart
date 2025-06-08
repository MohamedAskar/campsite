import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';

class AmenityIcon extends StatelessWidget {
  const AmenityIcon({super.key, required this.icon, required this.available});

  final String icon;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.primaryContainer,
      ),
      child: Image.asset(icon, width: 24, height: 24),
    );
  }
}
