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

  /// No description provided for @navHomeHint.
  ///
  /// In en, this message translates to:
  /// **'Home: today\'s ayah, new books and nearby swaps'**
  String get navHomeHint;

  /// No description provided for @navCatalogHint.
  ///
  /// In en, this message translates to:
  /// **'Catalog: browse new books'**
  String get navCatalogHint;

  /// No description provided for @navP2pHint.
  ///
  /// In en, this message translates to:
  /// **'P2P: buy and sell second-hand books with students'**
  String get navP2pHint;

  /// No description provided for @navBitesHint.
  ///
  /// In en, this message translates to:
  /// **'Bites: short book reviews and quotes from readers'**
  String get navBitesHint;

  /// No description provided for @navProfileHint.
  ///
  /// In en, this message translates to:
  /// **'Profile: your account, theme and language'**
  String get navProfileHint;

  /// No description provided for @navAiHint.
  ///
  /// In en, this message translates to:
  /// **'Reading Assistant: ask Gemini about any book'**
  String get navAiHint;

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

  /// No description provided for @authEmailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Email or phone'**
  String get authEmailOrPhone;

  /// No description provided for @authEmailOrPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'you@example.com or 01XXXXXXXXX'**
  String get authEmailOrPhoneHint;

  /// No description provided for @authMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get authMobileNumber;

  /// No description provided for @authMobileNumberHint.
  ///
  /// In en, this message translates to:
  /// **'01XXXXXXXXX'**
  String get authMobileNumberHint;

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
  /// **'you@example.com'**
  String get authEmailHint;

  /// No description provided for @authNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get authNameHint;

  /// No description provided for @authContinueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get authContinueAsGuest;

  /// No description provided for @authInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address.'**
  String get authInvalidEmail;

  /// No description provided for @authMissingPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password.'**
  String get authMissingPassword;

  /// No description provided for @authOtpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify your contact'**
  String get authOtpTitle;

  /// No description provided for @authOtpMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to {contact}.'**
  String authOtpMessage(Object contact);

  /// No description provided for @authOtpHint.
  ///
  /// In en, this message translates to:
  /// **'6-digit OTP'**
  String get authOtpHint;

  /// No description provided for @authVerifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get authVerifyOtp;

  /// No description provided for @authOtpDemoNote.
  ///
  /// In en, this message translates to:
  /// **'Demo code: 123456'**
  String get authOtpDemoNote;

  /// No description provided for @authOtpInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit OTP.'**
  String get authOtpInvalid;

  /// No description provided for @authInvalidMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Bangladesh mobile number.'**
  String get authInvalidMobileNumber;

  /// No description provided for @authForgotTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get authForgotTitle;

  /// No description provided for @authForgotMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number and we will send you a verification code.'**
  String get authForgotMessage;

  /// No description provided for @authSendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get authSendOtp;

  /// No description provided for @authResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get authResetPassword;

  /// No description provided for @authPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Password reset. You can now log in.'**
  String get authPasswordReset;

  /// No description provided for @authBackToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to log in'**
  String get authBackToLogin;

  /// No description provided for @authLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get authLogOut;

  /// No description provided for @authGuestName.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get authGuestName;

  /// No description provided for @authGuestNote.
  ///
  /// In en, this message translates to:
  /// **'Log in to buy books, sell used ones and post Bites.'**
  String get authGuestNote;

  /// No description provided for @authRoleReader.
  ///
  /// In en, this message translates to:
  /// **'Reader'**
  String get authRoleReader;

  /// No description provided for @authRoleModerator.
  ///
  /// In en, this message translates to:
  /// **'Moderator'**
  String get authRoleModerator;

  /// No description provided for @authRoleCatalogManager.
  ///
  /// In en, this message translates to:
  /// **'Catalog manager'**
  String get authRoleCatalogManager;

  /// No description provided for @authRoleSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get authRoleSupport;

  /// No description provided for @authRoleSuperAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get authRoleSuperAdmin;

  /// No description provided for @homeAyahOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Ayah of the Day'**
  String get homeAyahOfTheDay;

  /// No description provided for @homeHideAyah.
  ///
  /// In en, this message translates to:
  /// **'Hide Ayah of the Day'**
  String get homeHideAyah;

  /// No description provided for @homeAyahHidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden. Turn it back on in Profile.'**
  String get homeAyahHidden;

  /// No description provided for @homeShowAyah.
  ///
  /// In en, this message translates to:
  /// **'Show Ayah of the Day'**
  String get homeShowAyah;

  /// No description provided for @homeSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeSettingsTitle;

  /// No description provided for @commonUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get commonUndo;

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

  /// No description provided for @homeNewArrivals.
  ///
  /// In en, this message translates to:
  /// **'New arrivals'**
  String get homeNewArrivals;

  /// No description provided for @homeNewArrivalsSub.
  ///
  /// In en, this message translates to:
  /// **'Just added to Waraqah'**
  String get homeNewArrivalsSub;

  /// No description provided for @homeBestsellers.
  ///
  /// In en, this message translates to:
  /// **'Bestsellers'**
  String get homeBestsellers;

  /// No description provided for @homeBestsellersSub.
  ///
  /// In en, this message translates to:
  /// **'Most bought in the last 30 days'**
  String get homeBestsellersSub;

  /// No description provided for @homeFromStudents.
  ///
  /// In en, this message translates to:
  /// **'Used books from readers'**
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

  /// No description provided for @commonFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get commonFilter;

  /// No description provided for @commonNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get commonNotFound;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @authorEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books by this Author yet.'**
  String get authorEmpty;

  /// No description provided for @publisherEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books from this Publisher yet.'**
  String get publisherEmpty;

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
  /// **'{count} books'**
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

  /// No description provided for @searchFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Search books'**
  String get searchFieldHint;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by title, author, publisher or ISBN'**
  String get searchHint;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No books found for \'{query}\''**
  String searchNoResults(String query);

  /// No description provided for @searchRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get searchRecent;

  /// No description provided for @searchRecentClear.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get searchRecentClear;

  /// No description provided for @searchRecentRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove \'{query}\''**
  String searchRecentRemove(String query);

  /// No description provided for @searchRequestBook.
  ///
  /// In en, this message translates to:
  /// **'Request this book'**
  String get searchRequestBook;

  /// No description provided for @searchRequestBookSoon.
  ///
  /// In en, this message translates to:
  /// **'Asking us to stock a book is coming soon.'**
  String get searchRequestBookSoon;

  /// No description provided for @searchSort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get searchSort;

  /// No description provided for @searchSortRelevance.
  ///
  /// In en, this message translates to:
  /// **'Relevance'**
  String get searchSortRelevance;

  /// No description provided for @searchSortPriceLow.
  ///
  /// In en, this message translates to:
  /// **'Price: low to high'**
  String get searchSortPriceLow;

  /// No description provided for @searchSortPriceHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: high to low'**
  String get searchSortPriceHigh;

  /// No description provided for @searchSortNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get searchSortNewest;

  /// No description provided for @searchSortBestselling.
  ///
  /// In en, this message translates to:
  /// **'Bestselling'**
  String get searchSortBestselling;

  /// No description provided for @searchFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get searchFilter;

  /// No description provided for @searchFilterReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get searchFilterReset;

  /// No description provided for @searchFilterSection.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get searchFilterSection;

  /// No description provided for @searchFilterPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get searchFilterPrice;

  /// No description provided for @searchFilterFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get searchFilterFormat;

  /// No description provided for @searchFilterLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get searchFilterLanguage;

  /// No description provided for @searchFilterRating.
  ///
  /// In en, this message translates to:
  /// **'Minimum rating'**
  String get searchFilterRating;

  /// No description provided for @searchFilterAny.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get searchFilterAny;

  /// No description provided for @searchFilterInStock.
  ///
  /// In en, this message translates to:
  /// **'In stock only'**
  String get searchFilterInStock;

  /// No description provided for @searchFilterShow.
  ///
  /// In en, this message translates to:
  /// **'Show {count} books'**
  String searchFilterShow(int count);

  /// No description provided for @searchPriceUnder300.
  ///
  /// In en, this message translates to:
  /// **'Under ৳300'**
  String get searchPriceUnder300;

  /// No description provided for @searchPrice300to600.
  ///
  /// In en, this message translates to:
  /// **'৳300–600'**
  String get searchPrice300to600;

  /// No description provided for @searchPrice600to1000.
  ///
  /// In en, this message translates to:
  /// **'৳600–1,000'**
  String get searchPrice600to1000;

  /// No description provided for @searchPriceOver1000.
  ///
  /// In en, this message translates to:
  /// **'Over ৳1,000'**
  String get searchPriceOver1000;

  /// No description provided for @searchRating3.
  ///
  /// In en, this message translates to:
  /// **'3★+'**
  String get searchRating3;

  /// No description provided for @searchRating4.
  ///
  /// In en, this message translates to:
  /// **'4★+'**
  String get searchRating4;

  /// No description provided for @searchRating45.
  ///
  /// In en, this message translates to:
  /// **'4.5★+'**
  String get searchRating45;

  /// No description provided for @catalogBrowseSections.
  ///
  /// In en, this message translates to:
  /// **'Browse by Section'**
  String get catalogBrowseSections;

  /// No description provided for @sectionAcademic.
  ///
  /// In en, this message translates to:
  /// **'Academic'**
  String get sectionAcademic;

  /// No description provided for @sectionReligious.
  ///
  /// In en, this message translates to:
  /// **'Religious'**
  String get sectionReligious;

  /// No description provided for @sectionLiterature.
  ///
  /// In en, this message translates to:
  /// **'Literature'**
  String get sectionLiterature;

  /// No description provided for @sectionAdmissionJobPrep.
  ///
  /// In en, this message translates to:
  /// **'Admission & Job Prep'**
  String get sectionAdmissionJobPrep;

  /// No description provided for @sectionSchoolCollege.
  ///
  /// In en, this message translates to:
  /// **'School & College'**
  String get sectionSchoolCollege;

  /// No description provided for @sectionNonFiction.
  ///
  /// In en, this message translates to:
  /// **'Non-fiction'**
  String get sectionNonFiction;

  /// No description provided for @sectionSkillsTech.
  ///
  /// In en, this message translates to:
  /// **'Skills & Tech'**
  String get sectionSkillsTech;

  /// No description provided for @sectionChildren.
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get sectionChildren;

  /// No description provided for @sectionBookCount.
  ///
  /// In en, this message translates to:
  /// **'{count} books'**
  String sectionBookCount(int count);

  /// No description provided for @categoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books in this Category yet.'**
  String get categoryEmpty;

  /// No description provided for @sectionEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books in this Section yet.'**
  String get sectionEmpty;

  /// No description provided for @collectionStripTitle.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collectionStripTitle;

  /// No description provided for @collectionStripSub.
  ///
  /// In en, this message translates to:
  /// **'Books our editors picked, and why'**
  String get collectionStripSub;

  /// No description provided for @bookFormatPaperback.
  ///
  /// In en, this message translates to:
  /// **'Paperback'**
  String get bookFormatPaperback;

  /// No description provided for @bookFormatHardcover.
  ///
  /// In en, this message translates to:
  /// **'Hardcover'**
  String get bookFormatHardcover;

  /// No description provided for @bookFormatEbook.
  ///
  /// In en, this message translates to:
  /// **'eBook'**
  String get bookFormatEbook;

  /// No description provided for @stockInStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get stockInStock;

  /// No description provided for @stockPreorder.
  ///
  /// In en, this message translates to:
  /// **'Pre-order'**
  String get stockPreorder;

  /// No description provided for @stockOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get stockOutOfStock;

  /// No description provided for @bookLanguageBangla.
  ///
  /// In en, this message translates to:
  /// **'Bangla'**
  String get bookLanguageBangla;

  /// No description provided for @bookLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get bookLanguageEnglish;

  /// No description provided for @bookLanguageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get bookLanguageArabic;

  /// No description provided for @bookDetailAbout.
  ///
  /// In en, this message translates to:
  /// **'About this book'**
  String get bookDetailAbout;

  /// No description provided for @bookDetailPages.
  ///
  /// In en, this message translates to:
  /// **'{count} pages'**
  String bookDetailPages(int count);

  /// No description provided for @bookDetailReviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get bookDetailReviews;

  /// No description provided for @bookDetailReviewsSub.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No reviews yet} =1{1 reader review} other{{count} reader reviews}}'**
  String bookDetailReviewsSub(int count);

  /// No description provided for @bookDetailNoReviews.
  ///
  /// In en, this message translates to:
  /// **'Nobody has reviewed this book yet.'**
  String get bookDetailNoReviews;

  /// No description provided for @bookDetailBestPrice.
  ///
  /// In en, this message translates to:
  /// **'From price'**
  String get bookDetailBestPrice;

  /// No description provided for @bookDetailAddToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get bookDetailAddToCart;

  /// No description provided for @bookDetailNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find this book.'**
  String get bookDetailNotFound;

  /// No description provided for @bookEditionTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose an edition'**
  String get bookEditionTitle;

  /// No description provided for @bookEditionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 edition} other{{count} editions}}'**
  String bookEditionCount(int count);

  /// No description provided for @bookEditionTranslation.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get bookEditionTranslation;

  /// No description provided for @bookStockOnlyLeft.
  ///
  /// In en, this message translates to:
  /// **'Only {count} left'**
  String bookStockOnlyLeft(int count);

  /// No description provided for @bookInstantDownload.
  ///
  /// In en, this message translates to:
  /// **'Instant download'**
  String get bookInstantDownload;

  /// No description provided for @bookDeliverTo.
  ///
  /// In en, this message translates to:
  /// **'Deliver to {area}'**
  String bookDeliverTo(String area);

  /// No description provided for @bookAreaInsideDhaka.
  ///
  /// In en, this message translates to:
  /// **'Inside Dhaka'**
  String get bookAreaInsideDhaka;

  /// No description provided for @bookAreaOutsideDhaka.
  ///
  /// In en, this message translates to:
  /// **'Outside Dhaka'**
  String get bookAreaOutsideDhaka;

  /// No description provided for @bookArrivesInDays.
  ///
  /// In en, this message translates to:
  /// **'Arrives in {min}–{max} days'**
  String bookArrivesInDays(int min, int max);

  /// No description provided for @bookShipsOnRelease.
  ///
  /// In en, this message translates to:
  /// **'Ships when it\'s released'**
  String get bookShipsOnRelease;

  /// No description provided for @bookNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available right now'**
  String get bookNotAvailable;

  /// No description provided for @bookChangeArea.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get bookChangeArea;

  /// No description provided for @bookChooseArea.
  ///
  /// In en, this message translates to:
  /// **'Where should we deliver?'**
  String get bookChooseArea;

  /// No description provided for @bookPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get bookPrice;

  /// No description provided for @bookBuyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy now'**
  String get bookBuyNow;

  /// No description provided for @bookShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get bookShare;

  /// No description provided for @bookCopied.
  ///
  /// In en, this message translates to:
  /// **'Book details copied. Paste them anywhere to share.'**
  String get bookCopied;

  /// No description provided for @bookConditionLikeNew.
  ///
  /// In en, this message translates to:
  /// **'Like new'**
  String get bookConditionLikeNew;

  /// No description provided for @bookConditionVeryGood.
  ///
  /// In en, this message translates to:
  /// **'Very good'**
  String get bookConditionVeryGood;

  /// No description provided for @bookConditionGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get bookConditionGood;

  /// No description provided for @bookConditionAcceptable.
  ///
  /// In en, this message translates to:
  /// **'Acceptable'**
  String get bookConditionAcceptable;

  /// No description provided for @bookOtherWays.
  ///
  /// In en, this message translates to:
  /// **'Other ways to buy'**
  String get bookOtherWays;

  /// No description provided for @bookCertifiedNote.
  ///
  /// In en, this message translates to:
  /// **'checked and cleaned by Waraqah'**
  String get bookCertifiedNote;

  /// No description provided for @bookAddUsedToCart.
  ///
  /// In en, this message translates to:
  /// **'Add used copy to cart'**
  String get bookAddUsedToCart;

  /// No description provided for @bookFromReaders.
  ///
  /// In en, this message translates to:
  /// **'From readers'**
  String get bookFromReaders;

  /// No description provided for @bookListingCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 listing} other{{count} listings}}'**
  String bookListingCount(int count);

  /// No description provided for @bookFromPrice.
  ///
  /// In en, this message translates to:
  /// **'from {price}'**
  String bookFromPrice(String price);

  /// No description provided for @bookResellsFor.
  ///
  /// In en, this message translates to:
  /// **'Finished it? Copies like this usually resell for about {amount} on Waraqah.'**
  String bookResellsFor(String amount);

  /// No description provided for @bookReaderSaleNote.
  ///
  /// In en, this message translates to:
  /// **'Make the seller an offer and agree on a meetup or courier. You pay the seller directly.'**
  String get bookReaderSaleNote;

  /// No description provided for @bookLookInside.
  ///
  /// In en, this message translates to:
  /// **'Look inside'**
  String get bookLookInside;

  /// No description provided for @bookLookInsideNone.
  ///
  /// In en, this message translates to:
  /// **'Nothing to show for this book yet.'**
  String get bookLookInsideNone;

  /// No description provided for @bookContents.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get bookContents;

  /// No description provided for @bookSamplePages.
  ///
  /// In en, this message translates to:
  /// **'Sample pages'**
  String get bookSamplePages;

  /// No description provided for @bookPageOf.
  ///
  /// In en, this message translates to:
  /// **'Page {page} of {total}'**
  String bookPageOf(int page, int total);

  /// No description provided for @bookSwipeForMore.
  ///
  /// In en, this message translates to:
  /// **'swipe for more'**
  String get bookSwipeForMore;

  /// No description provided for @bookSampleEnds.
  ///
  /// In en, this message translates to:
  /// **'end of the sample'**
  String get bookSampleEnds;

  /// No description provided for @bookSeriesPosition.
  ///
  /// In en, this message translates to:
  /// **'Book {position} of {total}'**
  String bookSeriesPosition(int position, int total);

  /// No description provided for @seriesOpen.
  ///
  /// In en, this message translates to:
  /// **'View series'**
  String get seriesOpen;

  /// No description provided for @bookSeriesNotYet.
  ///
  /// In en, this message translates to:
  /// **'Not in store yet'**
  String get bookSeriesNotYet;

  /// No description provided for @bookSeriesNotYetLong.
  ///
  /// In en, this message translates to:
  /// **'Waraqah doesn\'t sell this one yet.'**
  String get bookSeriesNotYetLong;

  /// No description provided for @bookQuestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Questions & answers'**
  String get bookQuestionsTitle;

  /// No description provided for @bookQuestionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No questions yet} =1{1 question} other{{count} questions}}'**
  String bookQuestionsCount(int count);

  /// No description provided for @bookQuestionsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No questions yet. Be the first to ask.'**
  String get bookQuestionsEmpty;

  /// No description provided for @bookAskQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask a question'**
  String get bookAskQuestion;

  /// No description provided for @bookQuestionHint.
  ///
  /// In en, this message translates to:
  /// **'What would you like to know about this book?'**
  String get bookQuestionHint;

  /// No description provided for @bookAnswerHint.
  ///
  /// In en, this message translates to:
  /// **'Share what you know'**
  String get bookAnswerHint;

  /// No description provided for @bookAnswer.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get bookAnswer;

  /// No description provided for @bookNoAnswerYet.
  ///
  /// In en, this message translates to:
  /// **'No answer yet'**
  String get bookNoAnswerYet;

  /// No description provided for @bookFromWaraqah.
  ///
  /// In en, this message translates to:
  /// **'Waraqah'**
  String get bookFromWaraqah;

  /// No description provided for @bookPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get bookPost;

  /// No description provided for @bookPostTooShort.
  ///
  /// In en, this message translates to:
  /// **'That\'s a bit short. Add a few more words.'**
  String get bookPostTooShort;

  /// No description provided for @bookPostTooLong.
  ///
  /// In en, this message translates to:
  /// **'That\'s too long. Please shorten it.'**
  String get bookPostTooLong;

  /// No description provided for @bookQuestionPosted.
  ///
  /// In en, this message translates to:
  /// **'Question posted. Readers and Waraqah can answer it.'**
  String get bookQuestionPosted;

  /// No description provided for @bookAnswerPosted.
  ///
  /// In en, this message translates to:
  /// **'Answer posted'**
  String get bookAnswerPosted;

  /// No description provided for @bookLowest30Days.
  ///
  /// In en, this message translates to:
  /// **'Lowest in 30 days'**
  String get bookLowest30Days;

  /// No description provided for @alertMine.
  ///
  /// In en, this message translates to:
  /// **'My alerts'**
  String get alertMine;

  /// No description provided for @alertNotifyMe.
  ///
  /// In en, this message translates to:
  /// **'Notify me'**
  String get alertNotifyMe;

  /// No description provided for @alertStockOn.
  ///
  /// In en, this message translates to:
  /// **'We\'ll let you know · tap to stop'**
  String get alertStockOn;

  /// No description provided for @alertStockSet.
  ///
  /// In en, this message translates to:
  /// **'We\'ll let you know when it\'s back.'**
  String get alertStockSet;

  /// No description provided for @alertTurnedOff.
  ///
  /// In en, this message translates to:
  /// **'Alert turned off'**
  String get alertTurnedOff;

  /// No description provided for @alertTurnOff.
  ///
  /// In en, this message translates to:
  /// **'Turn off alert'**
  String get alertTurnOff;

  /// No description provided for @alertPriceTitle.
  ///
  /// In en, this message translates to:
  /// **'Price drop alert'**
  String get alertPriceTitle;

  /// No description provided for @alertPriceToday.
  ///
  /// In en, this message translates to:
  /// **'Today it\'s {price}.'**
  String alertPriceToday(String price);

  /// No description provided for @alertPriceWhen.
  ///
  /// In en, this message translates to:
  /// **'Alert me at {price} or less'**
  String alertPriceWhen(String price);

  /// No description provided for @alertSet.
  ///
  /// In en, this message translates to:
  /// **'Set alert'**
  String get alertSet;

  /// No description provided for @alertPriceSet.
  ///
  /// In en, this message translates to:
  /// **'We\'ll let you know when the price drops.'**
  String get alertPriceSet;

  /// No description provided for @alertBackNow.
  ///
  /// In en, this message translates to:
  /// **'Back in stock now'**
  String get alertBackNow;

  /// No description provided for @alertWaitingStock.
  ///
  /// In en, this message translates to:
  /// **'Waiting for it to be back in stock'**
  String get alertWaitingStock;

  /// No description provided for @alertPriceDropped.
  ///
  /// In en, this message translates to:
  /// **'Price dropped to {price}'**
  String alertPriceDropped(String price);

  /// No description provided for @alertWaitingPrice.
  ///
  /// In en, this message translates to:
  /// **'Alert at {target} · now {price}'**
  String alertWaitingPrice(String target, String price);

  /// No description provided for @alertEmpty.
  ///
  /// In en, this message translates to:
  /// **'No alerts yet. Tap Notify me on a sold-out book, or the bell on a wishlist book.'**
  String get alertEmpty;

  /// No description provided for @dealTitle.
  ///
  /// In en, this message translates to:
  /// **'Deals'**
  String get dealTitle;

  /// No description provided for @dealFlashSale.
  ///
  /// In en, this message translates to:
  /// **'Flash sale'**
  String get dealFlashSale;

  /// No description provided for @dealFlashEndsIn.
  ///
  /// In en, this message translates to:
  /// **'Flash sale ends in'**
  String get dealFlashEndsIn;

  /// No description provided for @dealSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See deals'**
  String get dealSeeAll;

  /// No description provided for @dealBundles.
  ///
  /// In en, this message translates to:
  /// **'Bundles'**
  String get dealBundles;

  /// No description provided for @dealInBundle.
  ///
  /// In en, this message translates to:
  /// **'Buy it in a bundle'**
  String get dealInBundle;

  /// No description provided for @dealAddBundle.
  ///
  /// In en, this message translates to:
  /// **'Add bundle to cart'**
  String get dealAddBundle;

  /// No description provided for @dealPreorders.
  ///
  /// In en, this message translates to:
  /// **'Coming soon · pre-order'**
  String get dealPreorders;

  /// No description provided for @dealReleases.
  ///
  /// In en, this message translates to:
  /// **'Releases {date} · ships on release day'**
  String dealReleases(String date);

  /// No description provided for @dealPreorderNow.
  ///
  /// In en, this message translates to:
  /// **'Pre-order'**
  String get dealPreorderNow;

  /// No description provided for @pointsTitle.
  ///
  /// In en, this message translates to:
  /// **'Waraqah points'**
  String get pointsTitle;

  /// No description provided for @pointsBalance.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 point} other{{count} points}}'**
  String pointsBalance(int count);

  /// No description provided for @pointsRuleEarn.
  ///
  /// In en, this message translates to:
  /// **'Earn 1 point for every ৳100 you pay for books.'**
  String get pointsRuleEarn;

  /// No description provided for @pointsRuleSpend.
  ///
  /// In en, this message translates to:
  /// **'Use them at checkout: 1 point = ৳1 off, once you have 50, for up to 20% of the books.'**
  String get pointsRuleSpend;

  /// No description provided for @pointsRuleCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancelling an order gives back the points it used.'**
  String get pointsRuleCancel;

  /// No description provided for @pointsHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get pointsHistory;

  /// No description provided for @pointsWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome bonus'**
  String get pointsWelcome;

  /// No description provided for @pointsEarnedOn.
  ///
  /// In en, this message translates to:
  /// **'Earned on {order}'**
  String pointsEarnedOn(String order);

  /// No description provided for @pointsSpentOn.
  ///
  /// In en, this message translates to:
  /// **'Used on {order}'**
  String pointsSpentOn(String order);

  /// No description provided for @pointsRefunded.
  ///
  /// In en, this message translates to:
  /// **'Given back · {order} cancelled'**
  String pointsRefunded(String order);

  /// No description provided for @pointsReversed.
  ///
  /// In en, this message translates to:
  /// **'Taken back · {order} cancelled'**
  String pointsReversed(String order);

  /// No description provided for @cartTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartTitle;

  /// No description provided for @cartItemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String cartItemCount(int count);

  /// No description provided for @cartEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Books you add will show up here.'**
  String get cartEmptyBody;

  /// No description provided for @cartBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse books'**
  String get cartBrowse;

  /// No description provided for @cartSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get cartSubtotal;

  /// No description provided for @cartYouSave.
  ///
  /// In en, this message translates to:
  /// **'You save {amount}'**
  String cartYouSave(String amount);

  /// No description provided for @cartEach.
  ///
  /// In en, this message translates to:
  /// **'{price} each'**
  String cartEach(String price);

  /// No description provided for @cartDeliveryNote.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee and coupons are added at checkout.'**
  String get cartDeliveryNote;

  /// No description provided for @cartCheckout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get cartCheckout;

  /// No description provided for @cartAdded.
  ///
  /// In en, this message translates to:
  /// **'Added to cart'**
  String get cartAdded;

  /// No description provided for @cartView.
  ///
  /// In en, this message translates to:
  /// **'View cart'**
  String get cartView;

  /// No description provided for @cartLimitReached.
  ///
  /// In en, this message translates to:
  /// **'You can\'t add more of this one.'**
  String get cartLimitReached;

  /// No description provided for @cartIncrease.
  ///
  /// In en, this message translates to:
  /// **'Add one'**
  String get cartIncrease;

  /// No description provided for @cartDecrease.
  ///
  /// In en, this message translates to:
  /// **'Remove one'**
  String get cartDecrease;

  /// No description provided for @cartRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get cartRemove;

  /// No description provided for @cartSaveForLater.
  ///
  /// In en, this message translates to:
  /// **'Save for later'**
  String get cartSaveForLater;

  /// No description provided for @cartMovedToWishlist.
  ///
  /// In en, this message translates to:
  /// **'Moved to your wishlist'**
  String get cartMovedToWishlist;

  /// No description provided for @cartCertifiedUsed.
  ///
  /// In en, this message translates to:
  /// **'Certified Used'**
  String get cartCertifiedUsed;

  /// No description provided for @cartFromReader.
  ///
  /// In en, this message translates to:
  /// **'From a reader'**
  String get cartFromReader;

  /// No description provided for @cartNewBooks.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get cartNewBooks;

  /// No description provided for @cartUsedBooks.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get cartUsedBooks;

  /// No description provided for @cartBundle.
  ///
  /// In en, this message translates to:
  /// **'Bundle'**
  String get cartBundle;

  /// No description provided for @cartSmartBasket.
  ///
  /// In en, this message translates to:
  /// **'Smart Basket'**
  String get cartSmartBasket;

  /// No description provided for @cartUsedAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 book is available used, save {amount}} other{{count} books are available used, save {amount}}}'**
  String cartUsedAvailable(int count, String amount);

  /// No description provided for @cartSwitch.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get cartSwitch;

  /// No description provided for @cartSwitchAll.
  ///
  /// In en, this message translates to:
  /// **'Switch all to used'**
  String get cartSwitchAll;

  /// No description provided for @cartSwapped.
  ///
  /// In en, this message translates to:
  /// **'Switched to used · saved {amount}'**
  String cartSwapped(String amount);

  /// No description provided for @cartToFreeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Add {amount} more for free delivery'**
  String cartToFreeDelivery(String amount);

  /// No description provided for @cartSetBudget.
  ///
  /// In en, this message translates to:
  /// **'Set a budget'**
  String get cartSetBudget;

  /// No description provided for @cartBudgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Fit your budget'**
  String get cartBudgetTitle;

  /// No description provided for @cartBudgetLabel.
  ///
  /// In en, this message translates to:
  /// **'Your budget in taka'**
  String get cartBudgetLabel;

  /// No description provided for @cartBudgetFits.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Already fits: {total}} =1{Fits with 1 used copy: {total}} other{Fits with {count} used copies: {total}}}'**
  String cartBudgetFits(String total, int count);

  /// No description provided for @cartBudgetShort.
  ///
  /// In en, this message translates to:
  /// **'The cheapest mix is {total}, still over your budget.'**
  String cartBudgetShort(String total);

  /// No description provided for @cartBudgetApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get cartBudgetApply;

  /// No description provided for @wishlistTitle.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlistTitle;

  /// No description provided for @wishlistMine.
  ///
  /// In en, this message translates to:
  /// **'My wishlist'**
  String get wishlistMine;

  /// No description provided for @wishlistCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 book} other{{count} books}}'**
  String wishlistCount(int count);

  /// No description provided for @wishlistSave.
  ///
  /// In en, this message translates to:
  /// **'Save to wishlist'**
  String get wishlistSave;

  /// No description provided for @wishlistRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove from wishlist'**
  String get wishlistRemove;

  /// No description provided for @wishlistSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved to your wishlist'**
  String get wishlistSaved;

  /// No description provided for @wishlistRemoved.
  ///
  /// In en, this message translates to:
  /// **'Removed from your wishlist'**
  String get wishlistRemoved;

  /// No description provided for @wishlistView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get wishlistView;

  /// No description provided for @wishlistMoveToCart.
  ///
  /// In en, this message translates to:
  /// **'Move to cart'**
  String get wishlistMoveToCart;

  /// No description provided for @wishlistEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty'**
  String get wishlistEmptyTitle;

  /// No description provided for @wishlistEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Tap the heart on any book to save it for later.'**
  String get wishlistEmptyBody;

  /// No description provided for @wishlistBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse books'**
  String get wishlistBrowse;

  /// No description provided for @wishlistShare.
  ///
  /// In en, this message translates to:
  /// **'Share wishlist'**
  String get wishlistShare;

  /// No description provided for @wishlistShareTitle.
  ///
  /// In en, this message translates to:
  /// **'Share your wishlist'**
  String get wishlistShareTitle;

  /// No description provided for @wishlistShareBody.
  ///
  /// In en, this message translates to:
  /// **'Anyone with the link can see the books on your wishlist and buy you one as a gift. They can\'t change your list.'**
  String get wishlistShareBody;

  /// No description provided for @wishlistCopyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get wishlistCopyLink;

  /// No description provided for @wishlistLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied'**
  String get wishlistLinkCopied;

  /// No description provided for @wishlistPreview.
  ///
  /// In en, this message translates to:
  /// **'See it as friends do'**
  String get wishlistPreview;

  /// No description provided for @wishlistSharedTitle.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s wishlist'**
  String wishlistSharedTitle(String name);

  /// No description provided for @wishlistSharedGiftHint.
  ///
  /// In en, this message translates to:
  /// **'Buying one for {name}? Add it to your cart and turn on \"Send as a gift\" at checkout.'**
  String wishlistSharedGiftHint(String name);

  /// No description provided for @wishlistSharedMissing.
  ///
  /// In en, this message translates to:
  /// **'This wishlist isn\'t shared any more.'**
  String get wishlistSharedMissing;

  /// No description provided for @checkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// No description provided for @checkoutStepAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get checkoutStepAddress;

  /// No description provided for @checkoutStepDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get checkoutStepDelivery;

  /// No description provided for @checkoutStepPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get checkoutStepPayment;

  /// No description provided for @checkoutPayBkash.
  ///
  /// In en, this message translates to:
  /// **'bKash'**
  String get checkoutPayBkash;

  /// No description provided for @checkoutPayNagad.
  ///
  /// In en, this message translates to:
  /// **'Nagad'**
  String get checkoutPayNagad;

  /// No description provided for @checkoutPayCod.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get checkoutPayCod;

  /// No description provided for @checkoutPayCard.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get checkoutPayCard;

  /// No description provided for @checkoutPayBkashNote.
  ///
  /// In en, this message translates to:
  /// **'Pay from your bKash account'**
  String get checkoutPayBkashNote;

  /// No description provided for @checkoutPayNagadNote.
  ///
  /// In en, this message translates to:
  /// **'Pay from your Nagad account'**
  String get checkoutPayNagadNote;

  /// No description provided for @checkoutPayCodNote.
  ///
  /// In en, this message translates to:
  /// **'Pay in cash when the books arrive'**
  String get checkoutPayCodNote;

  /// No description provided for @checkoutPayCardNote.
  ///
  /// In en, this message translates to:
  /// **'Visa, Mastercard or Amex'**
  String get checkoutPayCardNote;

  /// No description provided for @checkoutCodUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Not available for eBook-only orders'**
  String get checkoutCodUnavailable;

  /// No description provided for @checkoutDemoNote.
  ///
  /// In en, this message translates to:
  /// **'Payments are simulated for now; no money moves.'**
  String get checkoutDemoNote;

  /// No description provided for @checkoutEbooksOnly.
  ///
  /// In en, this message translates to:
  /// **'eBooks are ready to read as soon as you pay'**
  String get checkoutEbooksOnly;

  /// No description provided for @checkoutFreeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery'**
  String get checkoutFreeDelivery;

  /// No description provided for @checkoutDeliveryFeeIs.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee {amount}'**
  String checkoutDeliveryFeeIs(String amount);

  /// No description provided for @checkoutFreeDeliveryFrom.
  ///
  /// In en, this message translates to:
  /// **'Free delivery on orders of {amount} or more'**
  String checkoutFreeDeliveryFrom(String amount);

  /// No description provided for @checkoutCouponHint.
  ///
  /// In en, this message translates to:
  /// **'Coupon code'**
  String get checkoutCouponHint;

  /// No description provided for @checkoutApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get checkoutApply;

  /// No description provided for @checkoutCouponNotFound.
  ///
  /// In en, this message translates to:
  /// **'That code doesn\'t exist.'**
  String get checkoutCouponNotFound;

  /// No description provided for @checkoutCouponExpired.
  ///
  /// In en, this message translates to:
  /// **'This code has expired.'**
  String get checkoutCouponExpired;

  /// No description provided for @checkoutCouponMinimum.
  ///
  /// In en, this message translates to:
  /// **'This code needs an order of {amount} or more.'**
  String checkoutCouponMinimum(String amount);

  /// No description provided for @checkoutCouponApplied.
  ///
  /// In en, this message translates to:
  /// **'{code} applied'**
  String checkoutCouponApplied(String code);

  /// No description provided for @checkoutRemoveCoupon.
  ///
  /// In en, this message translates to:
  /// **'Remove coupon'**
  String get checkoutRemoveCoupon;

  /// No description provided for @checkoutItems.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String checkoutItems(int count);

  /// No description provided for @checkoutDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get checkoutDeliveryFee;

  /// No description provided for @checkoutFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get checkoutFree;

  /// No description provided for @checkoutCouponDiscount.
  ///
  /// In en, this message translates to:
  /// **'Coupon discount'**
  String get checkoutCouponDiscount;

  /// No description provided for @checkoutTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get checkoutTotal;

  /// No description provided for @checkoutPlaceOrder.
  ///
  /// In en, this message translates to:
  /// **'Place order'**
  String get checkoutPlaceOrder;

  /// No description provided for @checkoutUsePoints.
  ///
  /// In en, this message translates to:
  /// **'Use {count} points'**
  String checkoutUsePoints(int count);

  /// No description provided for @checkoutPointsSave.
  ///
  /// In en, this message translates to:
  /// **'{amount} off · you have {balance}'**
  String checkoutPointsSave(String amount, int balance);

  /// No description provided for @checkoutPointsNotYet.
  ///
  /// In en, this message translates to:
  /// **'You have {balance} points. You can use them once you have 50.'**
  String checkoutPointsNotYet(int balance);

  /// No description provided for @checkoutPointsDiscount.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get checkoutPointsDiscount;

  /// No description provided for @checkoutGiftTitle.
  ///
  /// In en, this message translates to:
  /// **'Send as a gift'**
  String get checkoutGiftTitle;

  /// No description provided for @checkoutGiftNote.
  ///
  /// In en, this message translates to:
  /// **'It goes to the address above with your card, and no prices.'**
  String get checkoutGiftNote;

  /// No description provided for @checkoutGiftRecipient.
  ///
  /// In en, this message translates to:
  /// **'Who is it for?'**
  String get checkoutGiftRecipient;

  /// No description provided for @checkoutGiftRecipientHint.
  ///
  /// In en, this message translates to:
  /// **'Their name, for the card'**
  String get checkoutGiftRecipientHint;

  /// No description provided for @checkoutGiftMessage.
  ///
  /// In en, this message translates to:
  /// **'Message on the card (optional)'**
  String get checkoutGiftMessage;

  /// No description provided for @checkoutGiftWrap.
  ///
  /// In en, this message translates to:
  /// **'Gift wrap'**
  String get checkoutGiftWrap;

  /// No description provided for @orderGiftFor.
  ///
  /// In en, this message translates to:
  /// **'Gift for {name}'**
  String orderGiftFor(String name);

  /// No description provided for @orderGiftWrapped.
  ///
  /// In en, this message translates to:
  /// **'Gift-wrapped'**
  String get orderGiftWrapped;

  /// No description provided for @orderPlacedGiftFor.
  ///
  /// In en, this message translates to:
  /// **'It\'s a gift for {name}: we\'ll add your card and leave the prices out.'**
  String orderPlacedGiftFor(String name);

  /// No description provided for @adminOrderGiftPack.
  ///
  /// In en, this message translates to:
  /// **'Add the card and leave the prices out.'**
  String get adminOrderGiftPack;

  /// No description provided for @adminOrderGiftWrap.
  ///
  /// In en, this message translates to:
  /// **'Wrap it, add the card and leave the prices out.'**
  String get adminOrderGiftWrap;

  /// No description provided for @giftDonateTitle.
  ///
  /// In en, this message translates to:
  /// **'Donate books'**
  String get giftDonateTitle;

  /// No description provided for @giftDonateIntro.
  ///
  /// In en, this message translates to:
  /// **'Every place here is checked by Waraqah. Pick a book they need and we\'ll deliver it free, with your note.'**
  String get giftDonateIntro;

  /// No description provided for @giftDonateVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get giftDonateVerified;

  /// No description provided for @giftDonateKind.
  ///
  /// In en, this message translates to:
  /// **'{kind, select, library{Community library} school{School} madrasa{Madrasa} orphanage{Orphanage} other{Place}}'**
  String giftDonateKind(String kind);

  /// No description provided for @giftDonateProgress.
  ///
  /// In en, this message translates to:
  /// **'{received} of {wanted} books received'**
  String giftDonateProgress(int received, int wanted);

  /// No description provided for @giftDonateNeeds.
  ///
  /// In en, this message translates to:
  /// **'Books they need'**
  String get giftDonateNeeds;

  /// No description provided for @giftDonateNeedProgress.
  ///
  /// In en, this message translates to:
  /// **'{received} of {wanted} received'**
  String giftDonateNeedProgress(int received, int wanted);

  /// No description provided for @giftDonatePerCopy.
  ///
  /// In en, this message translates to:
  /// **'{amount} a copy'**
  String giftDonatePerCopy(String amount);

  /// No description provided for @giftDonateAction.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get giftDonateAction;

  /// No description provided for @giftDonateMet.
  ///
  /// In en, this message translates to:
  /// **'All donated'**
  String get giftDonateMet;

  /// No description provided for @giftDonateFreeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivered free to {name}'**
  String giftDonateFreeDelivery(String name);

  /// No description provided for @giftDonateHowMany.
  ///
  /// In en, this message translates to:
  /// **'How many copies?'**
  String get giftDonateHowMany;

  /// No description provided for @giftDonateFewer.
  ///
  /// In en, this message translates to:
  /// **'One fewer'**
  String get giftDonateFewer;

  /// No description provided for @giftDonateMore.
  ///
  /// In en, this message translates to:
  /// **'One more'**
  String get giftDonateMore;

  /// No description provided for @giftDonateNote.
  ///
  /// In en, this message translates to:
  /// **'A note for them (optional)'**
  String get giftDonateNote;

  /// No description provided for @giftDonateConfirm.
  ///
  /// In en, this message translates to:
  /// **'Donate {amount}'**
  String giftDonateConfirm(String amount);

  /// No description provided for @giftDonateThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you! Your books are on their way to {name}.'**
  String giftDonateThanks(String name);

  /// No description provided for @giftDonateMissing.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find this place.'**
  String get giftDonateMissing;

  /// No description provided for @orderDonationTo.
  ///
  /// In en, this message translates to:
  /// **'Donation to {name}'**
  String orderDonationTo(String name);

  /// No description provided for @walletTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get walletTitle;

  /// No description provided for @walletRuleIn.
  ///
  /// In en, this message translates to:
  /// **'Money back from cancelled or returned orders, and from books you sell back to Waraqah, lands here.'**
  String get walletRuleIn;

  /// No description provided for @walletRuleSpend.
  ///
  /// In en, this message translates to:
  /// **'Use it at checkout like cash, for books and delivery.'**
  String get walletRuleSpend;

  /// No description provided for @walletHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get walletHistory;

  /// No description provided for @walletCancelRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund for cancelled {order}'**
  String walletCancelRefund(String order);

  /// No description provided for @walletReturnRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund for returned {order}'**
  String walletReturnRefund(String order);

  /// No description provided for @walletSellBack.
  ///
  /// In en, this message translates to:
  /// **'Sell Back: {book}'**
  String walletSellBack(String book);

  /// No description provided for @walletSpentOn.
  ///
  /// In en, this message translates to:
  /// **'Used on {order}'**
  String walletSpentOn(String order);

  /// No description provided for @walletUseAtCheckout.
  ///
  /// In en, this message translates to:
  /// **'Pay {amount} from your wallet'**
  String walletUseAtCheckout(String amount);

  /// No description provided for @walletYouHave.
  ///
  /// In en, this message translates to:
  /// **'You have {amount}'**
  String walletYouHave(String amount);

  /// No description provided for @orderRefundedToWallet.
  ///
  /// In en, this message translates to:
  /// **'Refunded to your wallet'**
  String get orderRefundedToWallet;

  /// No description provided for @orderPlacedFromWallet.
  ///
  /// In en, this message translates to:
  /// **'{amount} came from your wallet.'**
  String orderPlacedFromWallet(String amount);

  /// No description provided for @orderPlacedTitle.
  ///
  /// In en, this message translates to:
  /// **'Order placed!'**
  String get orderPlacedTitle;

  /// No description provided for @orderPlacedNumber.
  ///
  /// In en, this message translates to:
  /// **'Order {number}'**
  String orderPlacedNumber(String number);

  /// No description provided for @orderPlacedPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid {amount} with {method}'**
  String orderPlacedPaid(String amount, String method);

  /// No description provided for @orderPlacedPayOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Pay {amount} in cash when it arrives'**
  String orderPlacedPayOnDelivery(String amount);

  /// No description provided for @orderPlacedContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get orderPlacedContinue;

  /// No description provided for @orderPointsEarned.
  ///
  /// In en, this message translates to:
  /// **'You earned {count} Waraqah points'**
  String orderPointsEarned(int count);

  /// No description provided for @orderPointsEarnedRow.
  ///
  /// In en, this message translates to:
  /// **'Points earned'**
  String get orderPointsEarnedRow;

  /// No description provided for @orderTrack.
  ///
  /// In en, this message translates to:
  /// **'Track order'**
  String get orderTrack;

  /// No description provided for @orderMyOrders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get orderMyOrders;

  /// No description provided for @orderEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get orderEmptyTitle;

  /// No description provided for @orderEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Books you order will show up here, with tracking.'**
  String get orderEmptyBody;

  /// No description provided for @orderPlacedOn.
  ///
  /// In en, this message translates to:
  /// **'Placed on {date}'**
  String orderPlacedOn(String date);

  /// No description provided for @orderNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find this order.'**
  String get orderNotFound;

  /// No description provided for @orderStatusPlaced.
  ///
  /// In en, this message translates to:
  /// **'Placed'**
  String get orderStatusPlaced;

  /// No description provided for @orderStatusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get orderStatusConfirmed;

  /// No description provided for @orderStatusPacked.
  ///
  /// In en, this message translates to:
  /// **'Packed'**
  String get orderStatusPacked;

  /// No description provided for @orderStatusShipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get orderStatusShipped;

  /// No description provided for @orderStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get orderStatusDelivered;

  /// No description provided for @orderStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get orderStatusCancelled;

  /// No description provided for @orderDeliverTo.
  ///
  /// In en, this message translates to:
  /// **'Delivering to'**
  String get orderDeliverTo;

  /// No description provided for @orderPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get orderPaid;

  /// No description provided for @orderPayOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Pay on delivery'**
  String get orderPayOnDelivery;

  /// No description provided for @orderCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel order'**
  String get orderCancel;

  /// No description provided for @orderCancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel this order?'**
  String get orderCancelTitle;

  /// No description provided for @orderCancelBody.
  ///
  /// In en, this message translates to:
  /// **'This can\'t be undone. Anything you paid goes back to your Waraqah wallet.'**
  String get orderCancelBody;

  /// No description provided for @orderKeep.
  ///
  /// In en, this message translates to:
  /// **'Keep order'**
  String get orderKeep;

  /// No description provided for @orderCancelled.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled'**
  String get orderCancelled;

  /// No description provided for @orderReturn.
  ///
  /// In en, this message translates to:
  /// **'Request a return'**
  String get orderReturn;

  /// No description provided for @orderReturnWhy.
  ///
  /// In en, this message translates to:
  /// **'Why are you sending it back?'**
  String get orderReturnWhy;

  /// No description provided for @orderReturnDamaged.
  ///
  /// In en, this message translates to:
  /// **'It arrived damaged'**
  String get orderReturnDamaged;

  /// No description provided for @orderReturnWrongBook.
  ///
  /// In en, this message translates to:
  /// **'I got the wrong book'**
  String get orderReturnWrongBook;

  /// No description provided for @orderReturnOther.
  ///
  /// In en, this message translates to:
  /// **'Something else'**
  String get orderReturnOther;

  /// No description provided for @orderReturnNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Tell us what happened (optional)'**
  String get orderReturnNoteHint;

  /// No description provided for @orderReturnAddPhotos.
  ///
  /// In en, this message translates to:
  /// **'Add photos'**
  String get orderReturnAddPhotos;

  /// No description provided for @orderReturnRemovePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get orderReturnRemovePhoto;

  /// No description provided for @orderReturnPhotosHelp.
  ///
  /// In en, this message translates to:
  /// **'Up to 3 photos. Pictures of the damage help us decide faster.'**
  String get orderReturnPhotosHelp;

  /// No description provided for @orderReturnSend.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get orderReturnSend;

  /// No description provided for @orderReturnSent.
  ///
  /// In en, this message translates to:
  /// **'Return requested. We\'ll reply within 2 days.'**
  String get orderReturnSent;

  /// No description provided for @orderReturnRequested.
  ///
  /// In en, this message translates to:
  /// **'Return requested, waiting for review'**
  String get orderReturnRequested;

  /// No description provided for @orderReturnApproved.
  ///
  /// In en, this message translates to:
  /// **'Return approved, we\'ll pick it up'**
  String get orderReturnApproved;

  /// No description provided for @orderReturnRejected.
  ///
  /// In en, this message translates to:
  /// **'Return not approved'**
  String get orderReturnRejected;

  /// No description provided for @orderReturnWindow.
  ///
  /// In en, this message translates to:
  /// **'Returns are open for 7 days after delivery.'**
  String get orderReturnWindow;

  /// No description provided for @adminOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get adminOrderTitle;

  /// No description provided for @adminOrderTabOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get adminOrderTabOrders;

  /// No description provided for @adminOrderTabReturns.
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get adminOrderTabReturns;

  /// No description provided for @adminOrderTabCoupons.
  ///
  /// In en, this message translates to:
  /// **'Coupons'**
  String get adminOrderTabCoupons;

  /// No description provided for @adminOrderAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get adminOrderAll;

  /// No description provided for @adminOrderMoveTo.
  ///
  /// In en, this message translates to:
  /// **'Mark as {status}'**
  String adminOrderMoveTo(String status);

  /// No description provided for @adminOrderNoOrders.
  ///
  /// In en, this message translates to:
  /// **'No orders here.'**
  String get adminOrderNoOrders;

  /// No description provided for @adminOrderNoReturns.
  ///
  /// In en, this message translates to:
  /// **'No returns waiting.'**
  String get adminOrderNoReturns;

  /// No description provided for @adminOrderApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get adminOrderApprove;

  /// No description provided for @adminOrderReject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get adminOrderReject;

  /// No description provided for @adminOrderReturnApproved.
  ///
  /// In en, this message translates to:
  /// **'Return approved'**
  String get adminOrderReturnApproved;

  /// No description provided for @adminOrderReturnRejected.
  ///
  /// In en, this message translates to:
  /// **'Return rejected'**
  String get adminOrderReturnRejected;

  /// No description provided for @adminOrderNewCoupon.
  ///
  /// In en, this message translates to:
  /// **'New coupon'**
  String get adminOrderNewCoupon;

  /// No description provided for @adminOrderCouponCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get adminOrderCouponCode;

  /// No description provided for @adminOrderCouponCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. BOISHAKH20'**
  String get adminOrderCouponCodeHint;

  /// No description provided for @adminOrderCouponKindPercent.
  ///
  /// In en, this message translates to:
  /// **'% off'**
  String get adminOrderCouponKindPercent;

  /// No description provided for @adminOrderCouponKindAmount.
  ///
  /// In en, this message translates to:
  /// **'৳ off'**
  String get adminOrderCouponKindAmount;

  /// No description provided for @adminOrderCouponPercent.
  ///
  /// In en, this message translates to:
  /// **'Percent off'**
  String get adminOrderCouponPercent;

  /// No description provided for @adminOrderCouponCap.
  ///
  /// In en, this message translates to:
  /// **'Most it can take off in taka (optional)'**
  String get adminOrderCouponCap;

  /// No description provided for @adminOrderCouponTaka.
  ///
  /// In en, this message translates to:
  /// **'Taka off'**
  String get adminOrderCouponTaka;

  /// No description provided for @adminOrderCouponMinOrder.
  ///
  /// In en, this message translates to:
  /// **'Minimum order in taka (optional)'**
  String get adminOrderCouponMinOrder;

  /// No description provided for @adminOrderCouponPickDate.
  ///
  /// In en, this message translates to:
  /// **'Set end date'**
  String get adminOrderCouponPickDate;

  /// No description provided for @adminOrderCouponCreate.
  ///
  /// In en, this message translates to:
  /// **'Create coupon'**
  String get adminOrderCouponCreate;

  /// No description provided for @adminOrderCouponCreated.
  ///
  /// In en, this message translates to:
  /// **'Coupon created'**
  String get adminOrderCouponCreated;

  /// No description provided for @adminOrderCouponBadCode.
  ///
  /// In en, this message translates to:
  /// **'Use 3–20 letters or digits for the code.'**
  String get adminOrderCouponBadCode;

  /// No description provided for @adminOrderCouponBadValue.
  ///
  /// In en, this message translates to:
  /// **'Check the amounts: 1–90% off, or at least ৳1 off.'**
  String get adminOrderCouponBadValue;

  /// No description provided for @adminOrderCouponBadExpiry.
  ///
  /// In en, this message translates to:
  /// **'The end date has to be in the future.'**
  String get adminOrderCouponBadExpiry;

  /// No description provided for @adminOrderCouponTaken.
  ///
  /// In en, this message translates to:
  /// **'A coupon with this code already exists.'**
  String get adminOrderCouponTaken;

  /// No description provided for @adminOrderCouponPercentOff.
  ///
  /// In en, this message translates to:
  /// **'{percent}% off'**
  String adminOrderCouponPercentOff(int percent);

  /// No description provided for @adminOrderCouponUpTo.
  ///
  /// In en, this message translates to:
  /// **'up to {amount}'**
  String adminOrderCouponUpTo(String amount);

  /// No description provided for @adminOrderCouponAmountOff.
  ///
  /// In en, this message translates to:
  /// **'{amount} off'**
  String adminOrderCouponAmountOff(String amount);

  /// No description provided for @adminOrderCouponFrom.
  ///
  /// In en, this message translates to:
  /// **'orders from {amount}'**
  String adminOrderCouponFrom(String amount);

  /// No description provided for @adminOrderCouponExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get adminOrderCouponExpired;

  /// No description provided for @adminOrderCouponNoEnd.
  ///
  /// In en, this message translates to:
  /// **'No end date'**
  String get adminOrderCouponNoEnd;

  /// No description provided for @adminOrderCouponUntil.
  ///
  /// In en, this message translates to:
  /// **'Until {date}'**
  String adminOrderCouponUntil(String date);

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

  /// No description provided for @homeAppBarLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get homeAppBarLightMode;

  /// No description provided for @homeAppBarDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get homeAppBarDarkMode;

  /// No description provided for @homeAppBarEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get homeAppBarEnglish;

  /// No description provided for @homeAppBarBangla.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get homeAppBarBangla;

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

  /// No description provided for @profileEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get profileEditProfile;

  /// No description provided for @profileEditName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileEditName;

  /// No description provided for @profileEditPhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get profileEditPhoto;

  /// No description provided for @profilePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get profilePhone;

  /// No description provided for @profilePhoneHint.
  ///
  /// In en, this message translates to:
  /// **'01XXXXXXXXX'**
  String get profilePhoneHint;

  /// No description provided for @profileSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get profileSaveChanges;

  /// No description provided for @profileSaved.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileSaved;

  /// No description provided for @profileSavedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Saved addresses'**
  String get profileSavedAddresses;

  /// No description provided for @profileAddAddress.
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get profileAddAddress;

  /// No description provided for @profileNoAddresses.
  ///
  /// In en, this message translates to:
  /// **'No saved addresses yet.'**
  String get profileNoAddresses;

  /// No description provided for @profileAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address label'**
  String get profileAddressLabel;

  /// No description provided for @profileAddressLine.
  ///
  /// In en, this message translates to:
  /// **'House, road and area'**
  String get profileAddressLine;

  /// No description provided for @profileDivision.
  ///
  /// In en, this message translates to:
  /// **'Division'**
  String get profileDivision;

  /// No description provided for @profileDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get profileDistrict;

  /// No description provided for @profileUpazila.
  ///
  /// In en, this message translates to:
  /// **'Upazila'**
  String get profileUpazila;

  /// No description provided for @profileSelectDivision.
  ///
  /// In en, this message translates to:
  /// **'Select division'**
  String get profileSelectDivision;

  /// No description provided for @profileSelectDistrict.
  ///
  /// In en, this message translates to:
  /// **'Select district'**
  String get profileSelectDistrict;

  /// No description provided for @profileSelectUpazila.
  ///
  /// In en, this message translates to:
  /// **'Select upazila'**
  String get profileSelectUpazila;

  /// No description provided for @profileSaveAddress.
  ///
  /// In en, this message translates to:
  /// **'Save address'**
  String get profileSaveAddress;

  /// No description provided for @profileAddressSaved.
  ///
  /// In en, this message translates to:
  /// **'Address saved'**
  String get profileAddressSaved;

  /// No description provided for @profileEditAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit address'**
  String get profileEditAddress;

  /// No description provided for @profileDeleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Delete address'**
  String get profileDeleteAddress;

  /// No description provided for @profileDeleteAddressMessage.
  ///
  /// In en, this message translates to:
  /// **'Remove this saved address?'**
  String get profileDeleteAddressMessage;

  /// No description provided for @profileAddressDeleted.
  ///
  /// In en, this message translates to:
  /// **'Address deleted'**
  String get profileAddressDeleted;

  /// No description provided for @profileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileNotifications;

  /// No description provided for @profilePushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get profilePushNotifications;

  /// No description provided for @profileOrderUpdates.
  ///
  /// In en, this message translates to:
  /// **'Order updates'**
  String get profileOrderUpdates;

  /// No description provided for @profilePromotions.
  ///
  /// In en, this message translates to:
  /// **'Offers and recommendations'**
  String get profilePromotions;

  /// No description provided for @profilePrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get profilePrivacy;

  /// No description provided for @profileProfileVisibility.
  ///
  /// In en, this message translates to:
  /// **'Profile visibility'**
  String get profileProfileVisibility;

  /// No description provided for @profileActivityVisibility.
  ///
  /// In en, this message translates to:
  /// **'Reading activity visibility'**
  String get profileActivityVisibility;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get profileDeleteAccount;

  /// No description provided for @profileDeleteAccountMessage.
  ///
  /// In en, this message translates to:
  /// **'This will permanently remove your account and saved data.'**
  String get profileDeleteAccountMessage;

  /// No description provided for @profileDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete permanently'**
  String get profileDeleteConfirm;

  /// No description provided for @profileCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileCancel;

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

  /// No description provided for @adminAreaTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin area'**
  String get adminAreaTitle;

  /// No description provided for @adminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get adminDashboard;

  /// No description provided for @adminDashboardHint.
  ///
  /// In en, this message translates to:
  /// **'Sales, orders and stock at a glance'**
  String get adminDashboardHint;

  /// No description provided for @adminCatalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get adminCatalog;

  /// No description provided for @adminCatalogHint.
  ///
  /// In en, this message translates to:
  /// **'Add and edit books, editions and stock'**
  String get adminCatalogHint;

  /// No description provided for @adminOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get adminOrders;

  /// No description provided for @adminOrdersHint.
  ///
  /// In en, this message translates to:
  /// **'Orders, returns, refunds and coupons'**
  String get adminOrdersHint;

  /// No description provided for @adminModeration.
  ///
  /// In en, this message translates to:
  /// **'Moderation'**
  String get adminModeration;

  /// No description provided for @adminModerationHint.
  ///
  /// In en, this message translates to:
  /// **'Review used-book listings and reports'**
  String get adminModerationHint;

  /// No description provided for @adminComingSoon.
  ///
  /// In en, this message translates to:
  /// **'This section is being built. Check back soon.'**
  String get adminComingSoon;

  /// No description provided for @moderationCenterTitle.
  ///
  /// In en, this message translates to:
  /// **'Moderation Center'**
  String get moderationCenterTitle;

  /// No description provided for @moderationTabListings.
  ///
  /// In en, this message translates to:
  /// **'Listings to approve'**
  String get moderationTabListings;

  /// No description provided for @moderationTabReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get moderationTabReports;

  /// No description provided for @moderationTabDisputes.
  ///
  /// In en, this message translates to:
  /// **'Disputes'**
  String get moderationTabDisputes;

  /// No description provided for @moderationEmptyListings.
  ///
  /// In en, this message translates to:
  /// **'No listings need approval.'**
  String get moderationEmptyListings;

  /// No description provided for @moderationEmptyReports.
  ///
  /// In en, this message translates to:
  /// **'No pending reports.'**
  String get moderationEmptyReports;

  /// No description provided for @moderationEmptyDisputes.
  ///
  /// In en, this message translates to:
  /// **'No active disputes.'**
  String get moderationEmptyDisputes;

  /// No description provided for @listingSellBook.
  ///
  /// In en, this message translates to:
  /// **'Sell a Book'**
  String get listingSellBook;

  /// No description provided for @listingMyListings.
  ///
  /// In en, this message translates to:
  /// **'My Listings'**
  String get listingMyListings;

  /// No description provided for @listingStepPickBook.
  ///
  /// In en, this message translates to:
  /// **'Pick book'**
  String get listingStepPickBook;

  /// No description provided for @listingStepCondition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get listingStepCondition;

  /// No description provided for @listingStepPhotos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get listingStepPhotos;

  /// No description provided for @listingStepPriceHandover.
  ///
  /// In en, this message translates to:
  /// **'Price & Handover'**
  String get listingStepPriceHandover;

  /// No description provided for @listingBookTitle.
  ///
  /// In en, this message translates to:
  /// **'Book title'**
  String get listingBookTitle;

  /// No description provided for @listingBookTitleHint.
  ///
  /// In en, this message translates to:
  /// **'The Pragmatic Programmer'**
  String get listingBookTitleHint;

  /// No description provided for @listingConditionLikeNew.
  ///
  /// In en, this message translates to:
  /// **'Like New'**
  String get listingConditionLikeNew;

  /// No description provided for @listingConditionVeryGood.
  ///
  /// In en, this message translates to:
  /// **'Very Good'**
  String get listingConditionVeryGood;

  /// No description provided for @listingConditionGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get listingConditionGood;

  /// No description provided for @listingConditionAcceptable.
  ///
  /// In en, this message translates to:
  /// **'Acceptable'**
  String get listingConditionAcceptable;

  /// No description provided for @listingFlags.
  ///
  /// In en, this message translates to:
  /// **'Flags (optional)'**
  String get listingFlags;

  /// No description provided for @listingFlagHighlighting.
  ///
  /// In en, this message translates to:
  /// **'Highlighting'**
  String get listingFlagHighlighting;

  /// No description provided for @listingFlagNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get listingFlagNotes;

  /// No description provided for @listingFlagDamage.
  ///
  /// In en, this message translates to:
  /// **'Damage'**
  String get listingFlagDamage;

  /// No description provided for @listingPhotosDesc.
  ///
  /// In en, this message translates to:
  /// **'Upload front cover, back cover, spine, inside page, any damage.'**
  String get listingPhotosDesc;

  /// No description provided for @listingPrice.
  ///
  /// In en, this message translates to:
  /// **'Price (৳)'**
  String get listingPrice;

  /// No description provided for @listingPriceHint.
  ///
  /// In en, this message translates to:
  /// **'450'**
  String get listingPriceHint;

  /// No description provided for @listingNegotiable.
  ///
  /// In en, this message translates to:
  /// **'Negotiable'**
  String get listingNegotiable;

  /// No description provided for @listingHandoverMethod.
  ///
  /// In en, this message translates to:
  /// **'Handover Method'**
  String get listingHandoverMethod;

  /// No description provided for @listingHandoverMeet.
  ///
  /// In en, this message translates to:
  /// **'Meet in person'**
  String get listingHandoverMeet;

  /// No description provided for @listingHandoverDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get listingHandoverDelivery;

  /// No description provided for @listingSaveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save Draft'**
  String get listingSaveDraft;

  /// No description provided for @listingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get listingNext;

  /// No description provided for @listingBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get listingBack;

  /// No description provided for @listingStatusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get listingStatusDraft;

  /// No description provided for @listingStatusInReview.
  ///
  /// In en, this message translates to:
  /// **'In review'**
  String get listingStatusInReview;

  /// No description provided for @listingStatusChangesRequested.
  ///
  /// In en, this message translates to:
  /// **'Changes requested'**
  String get listingStatusChangesRequested;

  /// No description provided for @listingStatusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get listingStatusRejected;

  /// No description provided for @listingStatusLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get listingStatusLive;

  /// No description provided for @listingStatusSold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get listingStatusSold;

  /// No description provided for @listingConditionPrefix.
  ///
  /// In en, this message translates to:
  /// **'Condition: '**
  String get listingConditionPrefix;

  /// No description provided for @listingReasonPrefix.
  ///
  /// In en, this message translates to:
  /// **'Reason: '**
  String get listingReasonPrefix;
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
