import 'package:flutter/material.dart';

///Produces [RichText] [text] with [TextStyle] [style] replacing the style of [replacementTextList] with [replacementStyle]
class TextStyleInjector extends StatelessWidget {
  TextStyleInjector({
    required this.text,
    required List<String> replacementTextList,
    this.style,
    required this.replacementStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.styleFirstOccurrenceOnly = false,
    this.caseSensitive = false,
    super.key,
  }) : replacementTextList = replacementTextList.toSet().toList();

  final String text;
  final List<String> replacementTextList;
  final TextStyle? style;
  final TextStyle? replacementStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool styleFirstOccurrenceOnly;
  final TextOverflow? overflow;
  final bool caseSensitive;

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];
    var allMatches = <Match>[];
    for (var index = 0; index < replacementTextList.length; index++) {
      final replacementText = replacementTextList[index];
      final match = caseSensitive
          ? replacementText.allMatches(text).toList()
          : replacementText
                .toLowerCase()
                .allMatches(text.toLowerCase())
                .toList();

      allMatches.addAll(match);
    }

    allMatches = removeInnerMatches(allMatches);
    allMatches.sort((a, b) => a.start.compareTo(b.start));
    if (styleFirstOccurrenceOnly) {
      allMatches = allMatches.take(1).toList();
    }

    for (var i = 0; i < allMatches.length; i++) {
      final match = allMatches[i];
      if (i == 0) {
        final firstText = text.substring(0, match.start);
        final styledText = text.substring(match.start, match.end);
        spans.add(TextSpan(text: firstText));
        spans.add(TextSpan(text: styledText, style: replacementStyle));
      } else {
        final firstText = text.substring(allMatches[i - 1].end, match.start);
        final styledText = text.substring(match.start, match.end);
        spans.add(TextSpan(text: firstText));
        spans.add(TextSpan(text: styledText, style: replacementStyle));
      }
    }
    if (spans.isNotEmpty) {
      final match = allMatches.last;
      final lastText = text.substring(match.end);
      spans.add(TextSpan(text: lastText));
    } else {
      spans.add(TextSpan(text: text));
    }

    return Text.rich(
      TextSpan(style: style, children: spans),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  List<Match> removeInnerMatches(List<Match> allMatches) {
    final list = List.of(allMatches);
    list.sort((a, b) => a[0]!.length.compareTo(b[0]!.length));

    final toRemove = <Match>[];

    for (var i = 0; i < list.length; i++) {
      final iMatch = list[i]; //shorter string
      for (var j = i + 1; j < list.length; j++) {
        final jMatch = list[j]; //longer string
        if (jMatch.start <= iMatch.start && jMatch.end >= iMatch.end) {
          toRemove.add(iMatch);
        }
      }
    }

    list.removeWhere(toRemove.contains);

    return list;
  }
}
