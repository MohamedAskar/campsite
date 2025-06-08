import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
  });

  final Widget leading;
  final Widget title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        leading,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [title, if (subtitle != null) subtitle!],
          ),
        ),
      ],
    );
  }
}
