import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppL10n
/// returned by `AppL10n.of(context)`.
///
/// Applications need to include `AppL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppL10n.localizationsDelegates,
///   supportedLocales: AppL10n.supportedLocales,
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
/// be consistent with the languages listed in the AppL10n.supportedLocales
/// property.
abstract class AppL10n {
  AppL10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppL10n? of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n);
  }

  static const LocalizationsDelegate<AppL10n> delegate = _AppL10nDelegate();

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Waraqah'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Read. Compare. Share. Reflect.'**
  String get appTagline;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navCatalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get navCatalog;

  /// No description provided for @navP2p.
  ///
  /// In en, this message translates to:
  /// **'P2P'**
  String get navP2p;

  /// No description provided for @navBites.
  ///
  /// In en, this message translates to:
  /// **'Bites'**
  String get navBites;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @bitesTitle.
  ///
  /// In en, this message translates to:
  /// **'Book-Bites'**
  String get bitesTitle;

  /// No description provided for @bitesComposerHint.
  ///
  /// In en, this message translates to:
  /// **'Share a thought about what you are reading...'**
  String get bitesComposerHint;

  /// No description provided for @bitesPost.
  ///
  /// In en, this message translates to:
  /// **'Post bite'**
  String get bitesPost;

  /// No description provided for @bitesReply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get bitesReply;

  /// No description provided for @bitesRepost.
  ///
  /// In en, this message translates to:
  /// **'Repost'**
  String get bitesRepost;

  /// No description provided for @bitesLike.
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get bitesLike;

  /// No description provided for @bitesPosted.
  ///
  /// In en, this message translates to:
  /// **'Your bite was added to the feed.'**
  String get bitesPosted;

  /// No description provided for @bitesYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get bitesYou;

  /// No description provided for @bitesReaderHandle.
  ///
  /// In en, this message translates to:
  /// **'reader'**
  String get bitesReaderHandle;

  /// No description provided for @authLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get authLogIn;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authSignUp;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get authFullName;

  /// No description provided for @authStudentId.
  ///
  /// In en, this message translates to:
  /// **'Student ID'**
  String get authStudentId;

  /// No description provided for @authOptional.
  ///
  /// In en, this message translates to:
  /// **'(optional)'**
  String get authOptional;

  /// No description provided for @authConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authConfirmPassword;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get authOrContinueWith;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueWithGoogle;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get authCreateAccount;

  /// No description provided for @authAgreeTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms of Service and Privacy Policy'**
  String get authAgreeTerms;

  /// No description provided for @authNewHere.
  ///
  /// In en, this message translates to:
  /// **'New to Waraqah?'**
  String get authNewHere;

  /// No description provided for @authHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authHaveAccount;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'you@iut-dhaka.edu'**
  String get authEmailHint;

  /// No description provided for @authNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get authNameHint;

  /// No description provided for @authStudentIdHint.
  ///
  /// In en, this message translates to:
  /// **'220041118'**
  String get authStudentIdHint;

  /// No description provided for @homeAyahOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Ayah of the Day'**
  String get homeAyahOfTheDay;

  /// No description provided for @homeAllBooks.
  ///
  /// In en, this message translates to:
  /// **'All Books'**
  String get homeAllBooks;

  /// No description provided for @homeBeneficial.
  ///
  /// In en, this message translates to:
  /// **'Beneficial'**
  String get homeBeneficial;

  /// No description provided for @homeNonBeneficial.
  ///
  /// In en, this message translates to:
  /// **'Non-Beneficial'**
  String get homeNonBeneficial;

  /// No description provided for @homeBookBites.
  ///
  /// In en, this message translates to:
  /// **'Book-Bites'**
  String get homeBookBites;

  /// No description provided for @homeBookBitesSub.
  ///
  /// In en, this message translates to:
  /// **'What readers are sharing'**
  String get homeBookBitesSub;

  /// No description provided for @homeNewBooks.
  ///
  /// In en, this message translates to:
  /// **'New Books'**
  String get homeNewBooks;

  /// No description provided for @homeNewBooksSub.
  ///
  /// In en, this message translates to:
  /// **'Cheapest price across vendors'**
  String get homeNewBooksSub;

  /// No description provided for @homeFromStudents.
  ///
  /// In en, this message translates to:
  /// **'From Students Near You'**
  String get homeFromStudents;

  /// No description provided for @homeFromStudentsSub.
  ///
  /// In en, this message translates to:
  /// **'Second-hand · IUT campus'**
  String get homeFromStudentsSub;

  /// No description provided for @commonSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get commonSeeAll;

  /// No description provided for @commonSort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get commonSort;

  /// No description provided for @commonFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get commonFilter;

  /// No description provided for @commonBest.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get commonBest;

  /// No description provided for @commonLowest.
  ///
  /// In en, this message translates to:
  /// **'lowest'**
  String get commonLowest;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get commonSomethingWentWrong;

  /// No description provided for @catalogTitle.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get catalogTitle;

  /// No description provided for @catalogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count} books · cross-vendor'**
  String catalogSubtitle(String count);

  /// No description provided for @catalogSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search title, author, ISBN...'**
  String get catalogSearchHint;

  /// No description provided for @catalogResults.
  ///
  /// In en, this message translates to:
  /// **'{count} results'**
  String catalogResults(int count);

  /// No description provided for @catalogSortPriceAsc.
  ///
  /// In en, this message translates to:
  /// **'Price: Low–High'**
  String get catalogSortPriceAsc;

  /// No description provided for @catalogVendorCompare.
  ///
  /// In en, this message translates to:
  /// **'{vendor} · vs {count} vendors'**
  String catalogVendorCompare(String vendor, int count);

  /// No description provided for @catalogCategoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get catalogCategoryAll;

  /// No description provided for @catalogCategoryIslamic.
  ///
  /// In en, this message translates to:
  /// **'Islamic Studies'**
  String get catalogCategoryIslamic;

  /// No description provided for @catalogCategoryAcademic.
  ///
  /// In en, this message translates to:
  /// **'Academic'**
  String get catalogCategoryAcademic;

  /// No description provided for @catalogCategoryFiction.
  ///
  /// In en, this message translates to:
  /// **'Fiction'**
  String get catalogCategoryFiction;

  /// No description provided for @catalogCategorySelfHelp.
  ///
  /// In en, this message translates to:
  /// **'Self-Help'**
  String get catalogCategorySelfHelp;

  /// No description provided for @catalogCategoryBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get catalogCategoryBusiness;

  /// No description provided for @aiTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading Assistant'**
  String get aiTitle;

  /// No description provided for @aiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Powered by Gemini'**
  String get aiSubtitle;

  /// No description provided for @aiInputHint.
  ///
  /// In en, this message translates to:
  /// **'Ask about any book...'**
  String get aiInputHint;

  /// No description provided for @aiPromptBudget.
  ///
  /// In en, this message translates to:
  /// **'Books under ৳500'**
  String get aiPromptBudget;

  /// No description provided for @aiPromptIslamic.
  ///
  /// In en, this message translates to:
  /// **'Beneficial Islamic reads'**
  String get aiPromptIslamic;

  /// No description provided for @aiPromptExam.
  ///
  /// In en, this message translates to:
  /// **'Help me prep for exams'**
  String get aiPromptExam;

  /// No description provided for @aiViewBook.
  ///
  /// In en, this message translates to:
  /// **'View book'**
  String get aiViewBook;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get profileAppearance;

  /// No description provided for @profileThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get profileThemeLight;

  /// No description provided for @profileThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get profileThemeDark;

  /// No description provided for @profileThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get profileThemeSystem;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// No description provided for @profileEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get profileEnglish;

  /// No description provided for @profileBangla.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get profileBangla;

  /// No description provided for @profileStats.
  ///
  /// In en, this message translates to:
  /// **'Your activity'**
  String get profileStats;

  /// No description provided for @profileBooksRead.
  ///
  /// In en, this message translates to:
  /// **'Books read'**
  String get profileBooksRead;

  /// No description provided for @profileBitesPosted.
  ///
  /// In en, this message translates to:
  /// **'Bites posted'**
  String get profileBitesPosted;

  /// No description provided for @profileListings.
  ///
  /// In en, this message translates to:
  /// **'Listings'**
  String get profileListings;

  /// No description provided for @comingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoonTitle;

  /// No description provided for @comingSoonP2p.
  ///
  /// In en, this message translates to:
  /// **'The second-hand marketplace is being built in the next phase.'**
  String get comingSoonP2p;

  /// No description provided for @comingSoonBites.
  ///
  /// In en, this message translates to:
  /// **'The full Book-Bites feed arrives with the social phase.'**
  String get comingSoonBites;
}

class _AppL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(lookupAppL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}

AppL10n lookupAppL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppL10nBn();
    case 'en':
      return AppL10nEn();
  }

  throw FlutterError(
    'AppL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
