import 'package:campsite/core/extensions/context.dart';
import 'package:campsite/core/extensions/text_style.dart';
import 'package:campsite/presentation/widgets/common/text_style_injector.dart';
import 'package:flutter/material.dart';
import 'package:locale_names/locale_names.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'info_widget.dart';

class CampsiteInfoSection extends StatelessWidget {
  const CampsiteInfoSection({
    super.key,
    required this.yearsOfHosting,
    required this.hostLanguages,
  });

  final int yearsOfHosting;
  final List<String> hostLanguages;

  @override
  Widget build(BuildContext context) {
    final languages = hostLanguages
        .map((lang) => Locale(lang).defaultDisplayLanguage)
        .toList();

    final textStyle = context.textTheme.bodyMedium;
    final double iconSize = 18;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.information,
          style: context.textTheme.titleMedium?.bold,
        ),
        SizedBox(height: 8),
        InfoWidget(
          leading: Icon(LucideIcons.tentTree, size: iconSize),
          title: TextStyleInjector(
            text: context.l10n.yearsOfHosting(yearsOfHosting),
            replacementTextList: ['$yearsOfHosting'],
            replacementStyle: textStyle?.bold,
          ),
        ),
        SizedBox(height: 12),
        InfoWidget(
          leading: Icon(LucideIcons.languages, size: iconSize),
          title: TextStyleInjector(
            text: context.l10n.hostSpeaksLanguages(
              languages.length > 1
                  ? '${languages.sublist(0, languages.length - 1).join(', ')} and ${languages.last}'
                  : languages.first,
            ),
            replacementTextList: languages,
            replacementStyle: textStyle?.bold,
          ),
        ),
      ],
    );
  }
}
