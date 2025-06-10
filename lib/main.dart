import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/shared_preferences_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'presentation/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences before starting the app
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // Override the SharedPreferences provider with the actual instance
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: const CampsiteApp(),
    ),
  );
}

class CampsiteApp extends StatelessWidget {
  const CampsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeAwareMaterialApp();
  }
}

/// Isolates theme watching to prevent unnecessary rebuilds of the entire app
class ThemeAwareMaterialApp extends ConsumerWidget {
  const ThemeAwareMaterialApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = AppTheme.createTextTheme(context, "Outfit");
    final theme = AppTheme(textTheme);
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: 'Campsite Platform',
      theme: theme.light(),
      darkTheme: theme.dark(),
      routerConfig: AppRouter.router,
      themeMode: themeMode,
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
