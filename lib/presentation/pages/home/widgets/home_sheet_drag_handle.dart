import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';

class HomeSheetDragHandle extends StatelessWidget {
  const HomeSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 32,
        height: 4,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.onSurfaceVariant,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
