import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/material.dart';

class CampsiteFilterChip extends StatelessWidget {
  final String label;
  final String icon;
  final bool? value;
  final void Function(bool?) onChanged;

  const CampsiteFilterChip({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 4,
          children: [
            Image.asset(icon, width: 32, height: 32),
            Text(label, style: context.textTheme.titleSmall),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<bool?>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment<bool?>(value: null, label: Text(context.l10n.any)),
              ButtonSegment<bool?>(value: true, label: Text(context.l10n.yes)),
              ButtonSegment<bool?>(value: false, label: Text(context.l10n.no)),
            ],
            selected: {value},
            onSelectionChanged: (Set<bool?> newSelection) {
              onChanged(newSelection.first);
            },
          ),
        ),
      ],
    );
  }
}
