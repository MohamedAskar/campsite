import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

class CampsiteSuitablilitySection extends StatelessWidget {
  const CampsiteSuitablilitySection({super.key, required this.suitableFor});

  final List<String> suitableFor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Suitable for', style: context.textTheme.titleMedium?.bold),
        SizedBox(height: 8),
        Text(suitableFor.join(', ')),
      ],
    );
  }
}
