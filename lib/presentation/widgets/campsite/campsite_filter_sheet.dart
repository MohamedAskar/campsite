import 'package:campsite/core/constants/campsite_assets.dart';
import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/presentation/controllers/campsite_filter_controller.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampsiteFilterSheet extends ConsumerWidget {
  const CampsiteFilterSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(campsiteFilterControllerProvider);
    final priceRangeAsync = ref.watch(priceRangeProvider);
    final availableLanguagesAsync = ref.watch(availableHostLanguagesProvider);
    final availableCategoriesAsync = ref.watch(availableSuitableForProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price Range Filter
              priceRangeAsync.when(
                data: (priceRange) => _PriceRangeSection(
                  minPrice: priceRange.min,
                  maxPrice: priceRange.max,
                  currentMinPrice: filter.minPrice ?? priceRange.min,
                  currentMaxPrice: filter.maxPrice ?? priceRange.max,
                  onRangeChanged: (min, max) {
                    ref
                        .read(campsiteFilterControllerProvider.notifier)
                        .updatePriceRange(min, max);
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => const SizedBox.shrink(),
              ),

              // Amenities Section
              _AmenitiesSection(
                isCloseToWater: filter.isCloseToWater,
                isCampFireAllowed: filter.isCampFireAllowed,
                onWaterChanged: (value) {
                  ref
                      .read(campsiteFilterControllerProvider.notifier)
                      .updateIsCloseToWater(value);
                },
                onCampFireChanged: (value) {
                  ref
                      .read(campsiteFilterControllerProvider.notifier)
                      .updateIsCampFireAllowed(value);
                },
              ),

              // Host Languages Section
              availableLanguagesAsync.when(
                data: (languages) => _LanguagesSection(
                  availableLanguages: languages,
                  selectedLanguages: filter.hostLanguages,
                  onLanguageToggled: (language) {
                    ref
                        .read(campsiteFilterControllerProvider.notifier)
                        .toggleHostLanguage(language);
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => const SizedBox.shrink(),
              ),

              // Suitable For Section
              availableCategoriesAsync.when(
                data: (categories) => _SuitableForSection(
                  availableCategories: categories,
                  selectedCategories: filter.suitableFor,
                  onCategoryToggled: (category) {
                    ref
                        .read(campsiteFilterControllerProvider.notifier)
                        .toggleSuitableFor(category);
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SafeArea(
            top: false,
            child: Row(
              spacing: 8,
              children: [
                if (filter.hasActiveFilters)
                  OutlinedButton(
                    onPressed: () {
                      ref
                          .read(campsiteFilterControllerProvider.notifier)
                          .clearFilters();
                    },
                    child: Text(context.l10n.clear),
                  ),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(context.l10n.applyFilters),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRangeSection extends StatefulWidget {
  final double minPrice;
  final double maxPrice;
  final double currentMinPrice;
  final double currentMaxPrice;
  final void Function(double min, double max) onRangeChanged;

  const _PriceRangeSection({
    required this.minPrice,
    required this.maxPrice,
    required this.currentMinPrice,
    required this.currentMaxPrice,
    required this.onRangeChanged,
  });

  @override
  State<_PriceRangeSection> createState() => _PriceRangeSectionState();
}

class _PriceRangeSectionState extends State<_PriceRangeSection> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(
      widget.currentMinPrice,
      widget.currentMaxPrice,
    );
  }

  @override
  void didUpdateWidget(_PriceRangeSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentMinPrice != widget.currentMinPrice ||
        oldWidget.currentMaxPrice != widget.currentMaxPrice) {
      _currentRangeValues = RangeValues(
        widget.currentMinPrice,
        widget.currentMaxPrice,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.price, style: context.textTheme.titleMedium?.bold),
        const SizedBox(height: 8),
        Row(
          children: [
            Text('€${_currentRangeValues.start.round()}'),
            const Spacer(),
            Text('€${_currentRangeValues.end.round()}'),
          ],
        ),
        RangeSlider(
          values: _currentRangeValues,
          min: widget.minPrice,
          max: widget.maxPrice,
          divisions: (widget.maxPrice - widget.minPrice).round(),
          labels: RangeLabels(
            '€${_currentRangeValues.start.round()}',
            '€${_currentRangeValues.end.round()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
          onChangeEnd: (RangeValues values) {
            widget.onRangeChanged(values.start, values.end);
          },
        ),
      ],
    );
  }
}

class _AmenitiesSection extends StatelessWidget {
  final bool? isCloseToWater;
  final bool? isCampFireAllowed;
  final void Function(bool?) onWaterChanged;
  final void Function(bool?) onCampFireChanged;

  const _AmenitiesSection({
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.onWaterChanged,
    required this.onCampFireChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.amenities,
          style: context.textTheme.titleMedium?.bold,
        ),
        const SizedBox(height: 12),
        _FilterChip(
          label: context.l10n.closeToWater,
          icon: CampsiteAssets.water,
          value: isCloseToWater,
          onChanged: onWaterChanged,
        ),
        const SizedBox(height: 8),
        _FilterChip(
          label: context.l10n.campFireAllowed,
          icon: CampsiteAssets.campfire,
          value: isCampFireAllowed,
          onChanged: onCampFireChanged,
        ),
      ],
    );
  }
}

class _LanguagesSection extends StatelessWidget {
  final List<String> availableLanguages;
  final List<String> selectedLanguages;
  final void Function(String) onLanguageToggled;

  const _LanguagesSection({
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

class _SuitableForSection extends StatelessWidget {
  final List<String> availableCategories;
  final List<String> selectedCategories;
  final void Function(String) onCategoryToggled;

  const _SuitableForSection({
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

class _FilterChip extends StatelessWidget {
  final String label;
  final String icon;
  final bool? value;
  final void Function(bool?) onChanged;

  const _FilterChip({
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
