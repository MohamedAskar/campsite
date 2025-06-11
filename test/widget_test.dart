import 'package:campsite/core/providers/shared_preferences_provider.dart';
import 'package:campsite/domain/entities/campsite.dart';
import 'package:campsite/main.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App initializes successfully', (WidgetTester tester) async {
    // Initialize mock SharedPreferences
    SharedPreferences.setMockInitialValues({});
    final sharedPrefs = await SharedPreferences.getInstance();

    // Create mock data
    const mockCampsites = <Campsite>[];

    // Create overrides for the providers to avoid network calls
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPrefs),
          campsiteListProvider.overrideWith(
            (ref) => Future.value(mockCampsites),
          ),
        ],
        child: const CampsiteApp(),
      ),
    );

    // Let the widget build
    await tester.pump();

    // Verify that the app structure is properly set up
    expect(find.byType(ProviderScope), findsOneWidget);
    expect(find.byType(CampsiteApp), findsOneWidget);
  });
}
