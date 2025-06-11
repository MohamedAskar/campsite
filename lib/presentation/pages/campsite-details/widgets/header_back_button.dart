import 'package:campsite/core/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HeaderBackButton extends StatelessWidget {
  const HeaderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SizedBox.shrink();
    }

    return IconButton(
      onPressed: () => context.pop(),
      icon: CircleAvatar(
        backgroundColor: context.colorScheme.surface,
        child: Icon(LucideIcons.arrowLeft),
      ),
    );
  }
}
