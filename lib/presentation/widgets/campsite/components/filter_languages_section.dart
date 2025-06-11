import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

class FilterLanguagesSection extends StatelessWidget {
  final List<String> availableLanguages;
  final List<String> selectedLanguages;
  final void Function(String) onLanguageToggled;

  const FilterLanguagesSection({
    super.key,
    required this.availableLanguages,
    required this.selectedLanguages,
    required this.onLanguageToggled,
  });

  @override
  Widget build(BuildContext context) {
    if (availableLanguages.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.hostLanguages,
          style: context.textTheme.titleMedium?.bold,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: availableLanguages.map((language) {
            final isSelected = selectedLanguages.contains(language);
            return FilterChip(
              label: Text(language.toUpperCase()),
              selected: isSelected,
              onSelected: (_) => onLanguageToggled(language),
              showCheckmark: false,
            );
          }).toList(),
        ),
      ],
    );
  }
}
