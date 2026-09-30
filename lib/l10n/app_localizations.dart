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

  /// No description provided for @homeNonBeneficialNote.
  ///
  /// In en, this message translates to:
  /// **'Books in this list are curated by our admins. Whether a book benefits a reader often depends on their intention and grounding. Many classical mufassirun, for example, consulted the Torah and the Bible for added context in their tafsir. For the general reader, however, such books are not beneficial, and without due care they may even cause harm.'**
  String get homeNonBeneficialNote;

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
  /// **'Cheapest prices first'**
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

  /// No description provided for @catalogSortPriceAsc.
  ///
  /// In en, this message translates to:
  /// **'Price: Low–High'**
  String get catalogSortPriceAsc;

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

  /// No description provided for @bookDetailCartSoon.
  ///
  /// In en, this message translates to:
  /// **'Cart and checkout arrive in the next phase.'**
  String get bookDetailCartSoon;

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
