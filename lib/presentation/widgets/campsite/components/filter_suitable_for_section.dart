import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

class FilterSuitableForSection extends StatelessWidget {
  final List<String> availableCategories;
  final List<String> selectedCategories;
  final void Function(String) onCategoryToggled;

  const FilterSuitableForSection({
    super.key,
    required this.availableCategories,
    required this.selectedCategories,
    required this.onCategoryToggled,
  });

  @override
  Widget build(BuildContext context) {
    if (availableCategories.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.suitableFor,
          style: context.textTheme.titleMedium?.bold,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: availableCategories.map((category) {
            final isSelected = selectedCategories.contains(category);
            return FilterChip(
              label: Text(_formatCategory(category)),
              selected: isSelected,
              onSelected: (_) => onCategoryToggled(category),
              showCheckmark: false,
            );
          }).toList(),
        ),
      ],
    );
  }

  String _formatCategory(String category) {
    return category
        .split('_')
        .map(
          (word) =>
              word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
        )
        .join(' ');
  }
}
