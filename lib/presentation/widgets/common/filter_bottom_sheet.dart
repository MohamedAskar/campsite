import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/campsite_filter.dart';
import '../../providers/campsite_providers.dart';
import '../../../l10n/app_localizations.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  late CampsiteFilter _tempFilter;

  @override
  void initState() {
    super.initState();
    _tempFilter = ref.read(campsiteFilterNotifierProvider);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.filters,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Search
          TextField(
            decoration: InputDecoration(
              labelText: l10n.searchCampsites,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _tempFilter = _tempFilter.copyWith(searchQuery: value);
              });
            },
            controller: TextEditingController(text: _tempFilter.searchQuery),
          ),

          const SizedBox(height: 24),

          // Price Range
          _buildPriceSection(context, l10n, theme),

          const SizedBox(height: 24),

          // Features
          _buildFeaturesSection(context, l10n, theme),

          const SizedBox(height: 24),

          // Host Languages
          _buildHostLanguagesSection(context, l10n, theme),

          const SizedBox(height: 32),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _clearFilters,
                  child: Text(l10n.clearFilters),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _applyFilters,
                  child: Text(l10n.applyFilters),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPriceSection(
    BuildContext context,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.price, style: theme.textTheme.titleMedium),
        const SizedBox(height: 16),
        RangeSlider(
          values: RangeValues(_tempFilter.minPrice, _tempFilter.maxPrice),
          min: 0,
          max: 1000,
          divisions: 100,
          labels: RangeLabels(
            '\$${_tempFilter.minPrice.toStringAsFixed(0)}',
            '\$${_tempFilter.maxPrice.toStringAsFixed(0)}',
          ),
          onChanged: (values) {
            setState(() {
              _tempFilter = _tempFilter.copyWith(
                minPrice: values.start,
                maxPrice: values.end,
              );
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${_tempFilter.minPrice.toStringAsFixed(0)}'),
            Text('\$${_tempFilter.maxPrice.toStringAsFixed(0)}'),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturesSection(
    BuildContext context,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Features', style: theme.textTheme.titleMedium),
        const SizedBox(height: 16),
        _buildFeatureToggle(
          'Close to Water',
          _tempFilter.isCloseToWater,
          (value) => setState(() {
            _tempFilter = _tempFilter.copyWith(isCloseToWater: value);
          }),
        ),
        _buildFeatureToggle(
          'Campfire Allowed',
          _tempFilter.isCampFireAllowed,
          (value) => setState(() {
            _tempFilter = _tempFilter.copyWith(isCampFireAllowed: value);
          }),
        ),
      ],
    );
  }

  Widget _buildFeatureToggle(
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: (newValue) => onChanged(newValue ?? false),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildHostLanguagesSection(
    BuildContext context,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    final availableLanguages = ['en', 'de', 'fr', 'es', 'it'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Host Languages', style: theme.textTheme.titleMedium),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: availableLanguages.map((lang) {
            final isSelected = _tempFilter.hostLanguages.contains(lang);
            return FilterChip(
              label: Text(lang.toUpperCase()),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  final languages = List<String>.from(
                    _tempFilter.hostLanguages,
                  );
                  if (selected) {
                    languages.add(lang);
                  } else {
                    languages.remove(lang);
                  }
                  _tempFilter = _tempFilter.copyWith(hostLanguages: languages);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _clearFilters() {
    setState(() {
      _tempFilter = const CampsiteFilter();
    });
  }

  void _applyFilters() {
    ref.read(campsiteFilterNotifierProvider.notifier).updateFilter(_tempFilter);
    Navigator.of(context).pop();
  }
}
