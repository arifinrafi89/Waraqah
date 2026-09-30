// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppL10nEn extends AppL10n {
  AppL10nEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Waraqah';

  @override
  String get appTagline => 'Read. Compare. Share. Reflect.';

  @override
  String get navHome => 'Home';

  @override
  String get navCatalog => 'Catalog';

  @override
  String get navP2p => 'P2P';

  @override
  String get navBites => 'Bites';

  @override
  String get navProfile => 'Profile';

  @override
  String get navHomeHint => 'Home: today\'s ayah, new books and nearby swaps';

  @override
  String get navCatalogHint => 'Catalog: browse new books';

  @override
  String get navP2pHint => 'P2P: buy and sell second-hand books with students';

  @override
  String get navBitesHint =>
      'Bites: short book reviews and quotes from readers';

  @override
  String get navProfileHint => 'Profile: your account, theme and language';

  @override
  String get navAiHint => 'Reading Assistant: ask Gemini about any book';

  @override
  String get bitesTitle => 'Book-Bites';

  @override
  String get bitesComposerHint =>
      'Share a thought about what you are reading...';

  @override
  String get bitesPost => 'Post bite';

  @override
  String get bitesReply => 'Reply';

  @override
  String get bitesRepost => 'Repost';

  @override
  String get bitesLike => 'Like';

  @override
  String get bitesPosted => 'Your bite was added to the feed.';

  @override
  String get bitesYou => 'You';

  @override
  String get bitesReaderHandle => 'reader';

  @override
  String get authLogIn => 'Log In';

  @override
  String get authSignUp => 'Sign Up';

  @override
  String get authEmail => 'Email';

  @override
  String get authPassword => 'Password';

  @override
  String get authFullName => 'Full name';

  @override
  String get authStudentId => 'Student ID';

  @override
  String get authOptional => '(optional)';

  @override
  String get authConfirmPassword => 'Confirm password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authOrContinueWith => 'or continue with';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authCreateAccount => 'Create Account';

  @override
  String get authAgreeTerms =>
      'I agree to the Terms of Service and Privacy Policy';

  @override
  String get authNewHere => 'New to Waraqah?';

  @override
  String get authHaveAccount => 'Already have an account?';

  @override
  String get authEmailHint => 'you@iut-dhaka.edu';

  @override
  String get authNameHint => 'Your name';

  @override
  String get authStudentIdHint => '220041118';

  @override
  String get authContinueAsGuest => 'Continue as guest';

  @override
  String get authInvalidEmail => 'Enter a valid email address.';

  @override
  String get authMissingPassword => 'Enter your password.';

  @override
  String get authLogOut => 'Log out';

  @override
  String get authGuestName => 'Guest';

  @override
  String get authGuestNote =>
      'Log in to buy books, sell used ones and post Bites.';

  @override
  String get authRoleReader => 'Reader';

  @override
  String get authRoleModerator => 'Moderator';

  @override
  String get authRoleCatalogManager => 'Catalog manager';

  @override
  String get authRoleSupport => 'Support';

  @override
  String get authRoleSuperAdmin => 'Admin';

  @override
  String get homeAyahOfTheDay => 'Ayah of the Day';

  @override
  String get homeAllBooks => 'All Books';

  @override
  String get homeBeneficial => 'Beneficial';

  @override
  String get homeNonBeneficial => 'Non-Beneficial';

  @override
  String get homeNonBeneficialNote =>
      'Books in this list are curated by our admins. Whether a book benefits a reader often depends on their intention and grounding. Many classical mufassirun, for example, consulted the Torah and the Bible for added context in their tafsir. For the general reader, however, such books are not beneficial, and without due care they may even cause harm.';

  @override
  String get homeBookBites => 'Book-Bites';

  @override
  String get homeBookBitesSub => 'What readers are sharing';

  @override
  String get homeNewBooks => 'New Books';

  @override
  String get homeNewBooksSub => 'Cheapest prices first';

  @override
  String get homeFromStudents => 'From Students Near You';

  @override
  String get homeFromStudentsSub => 'Second-hand · IUT campus';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonSort => 'Sort';

  @override
  String get commonFilter => 'Filter';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonSomethingWentWrong => 'Something went wrong';

  @override
  String get catalogTitle => 'Catalog';

  @override
  String catalogSubtitle(String count) {
    return '$count books';
  }

  @override
  String get catalogSearchHint => 'Search title, author, ISBN...';

  @override
  String catalogResults(int count) {
    return '$count results';
  }

  @override
  String get catalogSortPriceAsc => 'Price: Low–High';

  @override
  String get catalogCategoryAll => 'All';

  @override
  String get catalogCategoryIslamic => 'Islamic Studies';

  @override
  String get catalogCategoryAcademic => 'Academic';

  @override
  String get catalogCategoryFiction => 'Fiction';

  @override
  String get catalogCategorySelfHelp => 'Self-Help';

  @override
  String get catalogCategoryBusiness => 'Business';

  @override
  String get bookFormatPaperback => 'Paperback';

  @override
  String get bookFormatHardcover => 'Hardcover';

  @override
  String get bookFormatEbook => 'eBook';

  @override
  String get stockInStock => 'In stock';

  @override
  String get stockPreorder => 'Pre-order';

  @override
  String get stockOutOfStock => 'Out of stock';

  @override
  String get bookLanguageBangla => 'Bangla';

  @override
  String get bookLanguageEnglish => 'English';

  @override
  String get bookLanguageArabic => 'Arabic';

  @override
  String get bookDetailAbout => 'About this book';

  @override
  String bookDetailPages(int count) {
    return '$count pages';
  }

  @override
  String get bookDetailReviews => 'Reviews';

  @override
  String bookDetailReviewsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reader reviews',
      one: '1 reader review',
      zero: 'No reviews yet',
    );
    return '$_temp0';
  }

  @override
  String get bookDetailNoReviews => 'Nobody has reviewed this book yet.';

  @override
  String get bookDetailBestPrice => 'From price';

  @override
  String get bookDetailAddToCart => 'Add to cart';

  @override
  String get bookDetailCartSoon =>
      'Cart and checkout arrive in the next phase.';

  @override
  String get bookDetailNotFound => 'We couldn\'t find this book.';

  @override
  String get bookEditionTitle => 'Choose an edition';

  @override
  String bookEditionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count editions',
      one: '1 edition',
    );
    return '$_temp0';
  }

  @override
  String get bookEditionTranslation => 'Translation';

  @override
  String bookStockOnlyLeft(int count) {
    return 'Only $count left';
  }

  @override
  String get bookInstantDownload => 'Instant download';

  @override
  String bookDeliverTo(String area) {
    return 'Deliver to $area';
  }

  @override
  String get bookAreaInsideDhaka => 'Inside Dhaka';

  @override
  String get bookAreaOutsideDhaka => 'Outside Dhaka';

  @override
  String bookArrivesInDays(int min, int max) {
    return 'Arrives in $min–$max days';
  }

  @override
  String get bookShipsOnRelease => 'Ships when it\'s released';

  @override
  String get bookNotAvailable => 'Not available right now';

  @override
  String get bookChangeArea => 'Change';

  @override
  String get bookChooseArea => 'Where should we deliver?';

  @override
  String get bookPrice => 'Price';

  @override
  String get bookBuyNow => 'Buy now';

  @override
  String get bookShare => 'Share';

  @override
  String get bookCopied => 'Book details copied. Paste them anywhere to share.';

  @override
  String get aiTitle => 'Reading Assistant';

  @override
  String get aiSubtitle => 'Powered by Gemini';

  @override
  String get aiInputHint => 'Ask about any book...';

  @override
  String get aiPromptBudget => 'Books under ৳500';

  @override
  String get aiPromptIslamic => 'Beneficial Islamic reads';

  @override
  String get aiPromptExam => 'Help me prep for exams';

  @override
  String get aiViewBook => 'View book';

  @override
  String get homeAppBarLightMode => 'Light mode';

  @override
  String get homeAppBarDarkMode => 'Dark mode';

  @override
  String get homeAppBarEnglish => 'English';

  @override
  String get homeAppBarBangla => 'বাংলা';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileAppearance => 'Appearance';

  @override
  String get profileThemeLight => 'Light';

  @override
  String get profileThemeDark => 'Dark';

  @override
  String get profileThemeSystem => 'System';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileEnglish => 'English';

  @override
  String get profileBangla => 'বাংলা';

  @override
  String get profileStats => 'Your activity';

  @override
  String get profileBooksRead => 'Books read';

  @override
  String get profileBitesPosted => 'Bites posted';

  @override
  String get profileListings => 'Listings';

  @override
  String get comingSoonTitle => 'Coming soon';

  @override
  String get comingSoonP2p =>
      'The second-hand marketplace is being built in the next phase.';

  @override
  String get comingSoonBites =>
      'The full Book-Bites feed arrives with the social phase.';

  @override
  String get adminAreaTitle => 'Admin area';

  @override
  String get adminDashboard => 'Dashboard';

  @override
  String get adminDashboardHint => 'Sales, orders and stock at a glance';

  @override
  String get adminCatalog => 'Catalog';

  @override
  String get adminCatalogHint => 'Add and edit books, editions and stock';

  @override
  String get adminOrders => 'Orders';

  @override
  String get adminOrdersHint => 'Orders, returns, refunds and coupons';

  @override
  String get adminModeration => 'Moderation';

  @override
  String get adminModerationHint => 'Review used-book listings and reports';

  @override
  String get adminComingSoon => 'This section is being built. Check back soon.';

  @override
  String get moderationCenterTitle => 'Moderation Center';

  @override
  String get moderationTabListings => 'Listings to approve';

  @override
  String get moderationTabReports => 'Reports';

  @override
  String get moderationTabDisputes => 'Disputes';

  @override
  String get moderationEmptyListings => 'No listings need approval.';

  @override
  String get moderationEmptyReports => 'No pending reports.';

  @override
  String get moderationEmptyDisputes => 'No active disputes.';
}
