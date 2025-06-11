import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Campsites'**
  String get appTitle;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @campsites.
  ///
  /// In en, this message translates to:
  /// **'Campsites'**
  String get campsites;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @pricePerNight.
  ///
  /// In en, this message translates to:
  /// **'{price} per night'**
  String pricePerNight(String price);

  /// No description provided for @amenities.
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get amenities;

  /// No description provided for @closeToWater.
  ///
  /// In en, this message translates to:
  /// **'Close to Water'**
  String get closeToWater;

  /// No description provided for @campFireAllowed.
  ///
  /// In en, this message translates to:
  /// **'Campfire Allowed'**
  String get campFireAllowed;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @errorLoadingCampsites.
  ///
  /// In en, this message translates to:
  /// **'Error loading campsites'**
  String get errorLoadingCampsites;

  /// No description provided for @hostLanguages.
  ///
  /// In en, this message translates to:
  /// **'Host Languages'**
  String get hostLanguages;

  /// No description provided for @suitableFor.
  ///
  /// In en, this message translates to:
  /// **'Suitable For'**
  String get suitableFor;

  /// No description provided for @any.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get any;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @campFireAllowedDescription.
  ///
  /// In en, this message translates to:
  /// **'Camp fire allowed'**
  String get campFireAllowedDescription;

  /// No description provided for @campFireNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Not allowed'**
  String get campFireNotAllowed;

  /// No description provided for @campFireAllowedInfo.
  ///
  /// In en, this message translates to:
  /// **'You can set a camp fire here, try to be careful with the fire.'**
  String get campFireAllowedInfo;

  /// No description provided for @campFireNotAllowedInfo.
  ///
  /// In en, this message translates to:
  /// **'No camp fire allowed at this campsite'**
  String get campFireNotAllowedInfo;

  /// No description provided for @closeToWaterDescription.
  ///
  /// In en, this message translates to:
  /// **'Close to water'**
  String get closeToWaterDescription;

  /// No description provided for @notCloseToWater.
  ///
  /// In en, this message translates to:
  /// **'Not close to water'**
  String get notCloseToWater;

  /// No description provided for @closeToWaterInfo.
  ///
  /// In en, this message translates to:
  /// **'You can fish, swim or just relax by the water'**
  String get closeToWaterInfo;

  /// No description provided for @noWaterAccess.
  ///
  /// In en, this message translates to:
  /// **'No water access at this campsite'**
  String get noWaterAccess;

  /// No description provided for @unknownLocation.
  ///
  /// In en, this message translates to:
  /// **'Unknown location'**
  String get unknownLocation;

  /// No description provided for @locationUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Location unavailable'**
  String get locationUnavailable;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @navigate.
  ///
  /// In en, this message translates to:
  /// **'Navigate'**
  String get navigate;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String error(String error);

  /// No description provided for @perNight.
  ///
  /// In en, this message translates to:
  /// **'per night'**
  String get perNight;

  /// No description provided for @yearsOfHosting.
  ///
  /// In en, this message translates to:
  /// **'The Camp has been hosting people for over {years} years'**
  String yearsOfHosting(int years);

  /// No description provided for @hostSpeaksLanguages.
  ///
  /// In en, this message translates to:
  /// **'Hosts speaks {languages}'**
  String hostSpeaksLanguages(String languages);

  /// No description provided for @resultsAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count} results available'**
  String resultsAvailable(int count);

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'{mode, select, light{Light} dark{Dark} system{System} other{Unknown}}'**
  String themeMode(String mode);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
