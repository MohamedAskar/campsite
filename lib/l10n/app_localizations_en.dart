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
  String get clear => 'Clear';

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
  String get hostLanguages => 'Host Languages';

  @override
  String get suitableFor => 'Suitable For';

  @override
  String get any => 'Any';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get campFireAllowedDescription => 'Camp fire allowed';

  @override
  String get campFireNotAllowed => 'Not allowed';

  @override
  String get campFireAllowedInfo =>
      'You can set a camp fire here, try to be careful with the fire.';

  @override
  String get campFireNotAllowedInfo => 'No camp fire allowed at this campsite';

  @override
  String get closeToWaterDescription => 'Close to water';

  @override
  String get notCloseToWater => 'Not close to water';

  @override
  String get closeToWaterInfo =>
      'You can fish, swim or just relax by the water';

  @override
  String get noWaterAccess => 'No water access at this campsite';

  @override
  String get unknownLocation => 'Unknown location';

  @override
  String get locationUnavailable => 'Location unavailable';

  @override
  String get mapView => 'Map View';

  @override
  String get googleMapsIntegration =>
      'Google Maps integration would be implemented here';

  @override
  String get errorLoadingMapData => 'Error loading map data';

  @override
  String get information => 'Information';

  @override
  String get navigate => 'Navigate';

  @override
  String error(String error) {
    return 'Error: $error';
  }

  @override
  String get perNight => 'per night';

  @override
  String yearsOfHosting(int years) {
    return 'The Camp has been hosting people for over $years years';
  }

  @override
  String hostSpeaksLanguages(String languages) {
    return 'Hosts speaks $languages';
  }

  @override
  String resultsAvailable(int count) {
    return 'Around $count results available';
  }

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

  @override
  String campsitesOnMap(int count) {
    return '$count campsites would be displayed on the map';
  }

  @override
  String themeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'light': 'Light',
      'dark': 'Dark',
      'system': 'System',
      'other': 'Unknown',
    });
    return '$_temp0';
  }
}
