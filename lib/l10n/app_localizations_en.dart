// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Campsite Platform';

  @override
  String get home => 'Home';

  @override
  String get map => 'Map';

  @override
  String get campsites => 'Campsites';

  @override
  String get filters => 'Filters';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get searchCampsites => 'Search campsites...';

  @override
  String get price => 'Price';

  @override
  String get pricePerNight => 'Price per night';

  @override
  String get amenities => 'Amenities';

  @override
  String get rating => 'Rating';

  @override
  String get minPrice => 'Min Price';

  @override
  String get maxPrice => 'Max Price';

  @override
  String get minRating => 'Min Rating';

  @override
  String get toilets => 'Toilets';

  @override
  String get shower => 'Shower';

  @override
  String get drinkingWater => 'Drinking Water';

  @override
  String get picnicTable => 'Picnic Table';

  @override
  String get firePlace => 'Fire Place';

  @override
  String get closeToWater => 'Close to Water';

  @override
  String get campFireAllowed => 'Campfire Allowed';

  @override
  String get details => 'Details';

  @override
  String get description => 'Description';

  @override
  String get location => 'Location';

  @override
  String get bookNow => 'Book Now';

  @override
  String get viewOnMap => 'View on Map';

  @override
  String get noResultsFound => 'No campsites found';

  @override
  String get tryAdjustingFilters => 'Try adjusting your filters';

  @override
  String get errorLoadingCampsites => 'Error loading campsites';

  @override
  String get retry => 'Retry';

  @override
  String campsitesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count campsites',
      one: '1 campsite',
      zero: 'No campsites',
    );
    return '$_temp0 found';
  }
}
