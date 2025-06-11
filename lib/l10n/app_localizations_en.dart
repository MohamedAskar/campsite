// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Campsites';

  @override
  String get map => 'Map';

  @override
  String get campsites => 'Campsites';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String showCampsites(int count) {
    return 'Show $count campsites';
  }

  @override
  String get clear => 'Clear';

  @override
  String get price => 'Price';

  @override
  String pricePerNight(String price) {
    return '$price per night';
  }

  @override
  String get amenities => 'Amenities';

  @override
  String get closeToWater => 'Close to Water';

  @override
  String get campFireAllowed => 'Campfire Allowed';

  @override
  String get location => 'Location';

  @override
  String get errorLoadingCampsites => 'Error loading campsites';

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
    return '$count results available';
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
