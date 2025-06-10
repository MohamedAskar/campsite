import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'presentation/controllers/theme_controller.dart';

void main() {
  runApp(const ProviderScope(child: CampsiteApp()));
}

class CampsiteApp extends ConsumerWidget {
  const CampsiteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = AppTheme.createTextTheme(context, "Outfit");
    final theme = AppTheme(textTheme);

    return MaterialApp.router(
      title: 'Campsite Platform',
      theme: theme.light(),
      darkTheme: theme.dark(),
      routerConfig: AppRouter.router,
      themeMode: ref.watch(themeControllerProvider),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
