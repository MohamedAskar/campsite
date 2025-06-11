import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:flutter/material.dart';

class CampsiteResultText extends StatelessWidget {
  const CampsiteResultText({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.resultsAvailable(count),
      style: context.textTheme.titleSmall?.bold,
      textAlign: TextAlign.center,
    );
  }
}
