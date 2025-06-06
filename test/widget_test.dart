import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campsite/main.dart';
import 'package:campsite/presentation/providers/campsite_providers.dart';
import 'package:campsite/domain/entities/campsite.dart';

void main() {
  testWidgets('App initializes successfully', (WidgetTester tester) async {
    // Create mock data
    const mockCampsites = <Campsite>[];

    // Create overrides for the providers to avoid network calls
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
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
