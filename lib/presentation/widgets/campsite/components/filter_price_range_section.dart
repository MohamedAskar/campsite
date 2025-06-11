import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

class FilterPriceRangeSection extends StatefulWidget {
  final double minPrice;
  final double maxPrice;
  final double currentMinPrice;
  final double currentMaxPrice;
  final void Function(double min, double max) onRangeChanged;

  const FilterPriceRangeSection({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.currentMinPrice,
    required this.currentMaxPrice,
    required this.onRangeChanged,
  });

  @override
  State<FilterPriceRangeSection> createState() =>
      _FilterPriceRangeSectionState();
}

class _FilterPriceRangeSectionState extends State<FilterPriceRangeSection> {
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
  void didUpdateWidget(FilterPriceRangeSection oldWidget) {
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
