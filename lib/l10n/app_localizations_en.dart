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
  String get authEmailOrPhone => 'Email or phone';

  @override
  String get authEmailOrPhoneHint => 'you@example.com or 01XXXXXXXXX';

  @override
  String get authMobileNumber => 'Mobile number';

  @override
  String get authMobileNumberHint => '01XXXXXXXXX';

  @override
  String get authPassword => 'Password';

  @override
  String get authFullName => 'Full name';

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
  String get authEmailHint => 'you@example.com';

  @override
  String get authNameHint => 'Your name';

  @override
  String get authContinueAsGuest => 'Continue as guest';

  @override
  String get authInvalidEmail => 'Enter a valid email address.';

  @override
  String get authMissingPassword => 'Enter your password.';

  @override
  String get authOtpTitle => 'Verify your contact';

  @override
  String authOtpMessage(Object contact) {
    return 'Enter the 6-digit code sent to $contact.';
  }

  @override
  String get authOtpHint => '6-digit OTP';

  @override
  String get authVerifyOtp => 'Verify OTP';

  @override
  String get authOtpDemoNote => 'Demo code: 123456';

  @override
  String get authOtpInvalid => 'Enter the 6-digit OTP.';

  @override
  String get authWrongCode => 'Wrong code. Try again.';

  @override
  String get authInvalidMobileNumber =>
      'Enter a valid Bangladesh mobile number.';

  @override
  String get authForgotTitle => 'Reset your password';

  @override
  String get authForgotMessage =>
      'Enter your mobile number and we will send you a verification code.';

  @override
  String get authSendOtp => 'Send OTP';

  @override
  String get authResetPassword => 'Reset password';

  @override
  String get authPasswordReset => 'Password reset. You can now log in.';

  @override
  String get authBackToLogin => 'Back to log in';

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
  String get homeHideAyah => 'Hide Ayah of the Day';

  @override
  String get homeAyahHidden => 'Hidden. Turn it back on in Profile.';

  @override
  String get homeShowAyah => 'Show Ayah of the Day';

  @override
  String get homeSettingsTitle => 'Home';

  @override
  String get commonUndo => 'Undo';

  @override
  String get homeBookBites => 'Book-Bites';

  @override
  String get homeBookBitesSub => 'What readers are sharing';

  @override
  String get homeNewArrivals => 'New arrivals';

  @override
  String get homeNewArrivalsSub => 'Just added to Waraqah';

  @override
  String get homeBestsellers => 'Bestsellers';

  @override
  String get homeBestsellersSub => 'Most bought in the last 30 days';

  @override
  String get homeSeasonRamadan => 'Ramadan';

  @override
  String get homeSeasonBoiMela => 'Boi Mela';

  @override
  String get homeSeasonAdmission => 'Admission season';

  @override
  String get homeSeasonBackToSchool => 'Back to school';

  @override
  String get homeFromStudents => 'Used books from readers';

  @override
  String get homeFromStudentsSub => 'Second-hand · IUT campus';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonFilter => 'Filter';

  @override
  String get commonNotFound => 'Not found';

  @override
  String get commonBack => 'Back';

  @override
  String get authorEmpty => 'No books by this Author yet.';

  @override
  String get publisherEmpty => 'No books from this Publisher yet.';

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
  String get searchFieldHint => 'Search books';

  @override
  String get searchHint => 'Search by title, author, publisher or ISBN';

  @override
  String searchNoResults(String query) {
    return 'No books found for \'$query\'';
  }

  @override
  String get searchRecent => 'Recent searches';

  @override
  String get searchRecentClear => 'Clear all';

  @override
  String searchRecentRemove(String query) {
    return 'Remove \'$query\'';
  }

  @override
  String searchDidYouMean(String title) {
    return 'Did you mean $title?';
  }

  @override
  String get searchRequestBook => 'Request this book';

  @override
  String get searchRequestBookSoon =>
      'Asking us to stock a book is coming soon.';

  @override
  String get searchSort => 'Sort';

  @override
  String get searchSortRelevance => 'Relevance';

  @override
  String get searchSortPriceLow => 'Price: low to high';

  @override
  String get searchSortPriceHigh => 'Price: high to low';

  @override
  String get searchSortNewest => 'Newest';

  @override
  String get searchSortBestselling => 'Bestselling';

  @override
  String get searchFilter => 'Filter';

  @override
  String get searchFilterReset => 'Reset';

  @override
  String get searchFilterSection => 'Section';

  @override
  String get searchFilterPrice => 'Price';

  @override
  String get searchFilterFormat => 'Format';

  @override
  String get searchFilterLanguage => 'Language';

  @override
  String get searchFilterRating => 'Minimum rating';

  @override
  String get searchFilterAny => 'Any';

  @override
  String get searchFilterInStock => 'In stock only';

  @override
  String searchFilterShow(int count) {
    return 'Show $count books';
  }

  @override
  String get searchPriceUnder300 => 'Under ৳300';

  @override
  String get searchPrice300to600 => '৳300–600';

  @override
  String get searchPrice600to1000 => '৳600–1,000';

  @override
  String get searchPriceOver1000 => 'Over ৳1,000';

  @override
  String get searchRating3 => '3★+';

  @override
  String get searchRating4 => '4★+';

  @override
  String get searchRating45 => '4.5★+';

  @override
  String get catalogBrowseSections => 'Browse by Section';

  @override
  String get sectionAcademic => 'Academic';

  @override
  String get sectionReligious => 'Religious';

  @override
  String get sectionLiterature => 'Literature';

  @override
  String get sectionAdmissionJobPrep => 'Admission & Job Prep';

  @override
  String get sectionSchoolCollege => 'School & College';

  @override
  String get sectionNonFiction => 'Non-fiction';

  @override
  String get sectionSkillsTech => 'Skills & Tech';

  @override
  String get sectionChildren => 'Children';

  @override
  String sectionBookCount(int count) {
    return '$count books';
  }

  @override
  String get categoryEmpty => 'No books in this Category yet.';

  @override
  String get sectionEmpty => 'No books in this Section yet.';

  @override
  String get sectionClassRow => 'Class';

  @override
  String get sectionExamRow => 'Exam';

  @override
  String get sectionSubjectRow => 'Subject';

  @override
  String sectionClassChip(int n) {
    return 'Class $n';
  }

  @override
  String get sectionExamSsc => 'SSC';

  @override
  String get sectionExamHsc => 'HSC';

  @override
  String get sectionExamAdmission => 'Admission';

  @override
  String get sectionExamBcs => 'BCS';

  @override
  String get sectionFilterEmpty => 'No books for this choice yet.';

  @override
  String get sectionClearFilters => 'Clear filters';

  @override
  String get collectionStripTitle => 'Collections';

  @override
  String get collectionStripSub => 'Books our editors picked, and why';

  @override
  String get expertPicksTitle => 'Expert Picks';

  @override
  String get expertPicksSub =>
      'Shelves from verified teachers, scholars and writers';

  @override
  String expertBy(String name) {
    return 'by $name';
  }

  @override
  String expertPickedBy(String name) {
    return 'Picked by $name';
  }

  @override
  String get expertVerified => 'Verified';

  @override
  String get expertKindTeacher => 'Teacher';

  @override
  String get expertKindScholar => 'Scholar';

  @override
  String get expertKindWriter => 'Writer';

  @override
  String get expertTheirPicks => 'Their picks';

  @override
  String get booklistKindClassList => 'Class list';

  @override
  String get booklistKindExamPrep => 'Exam prep';

  @override
  String get booklistKindBookClub => 'Book club';

  @override
  String get booklistKindPersonal => 'My list';

  @override
  String get booklistPickerTitle => 'Add books';

  @override
  String get booklistPickerDone => 'Done';

  @override
  String get booklistPickerEmpty => 'No books match.';

  @override
  String get booklistTitle => 'Booklists';

  @override
  String get booklistEntrySub =>
      'Class lists, exam prep, book clubs and your own lists';

  @override
  String get booklistProfileLink => 'My booklists';

  @override
  String get booklistMine => 'My lists';

  @override
  String get booklistNew => 'New list';

  @override
  String get booklistMineEmpty =>
      'No lists yet. Make one for books you want to buy together.';

  @override
  String get booklistGuestHint => 'Log in to make your own lists.';

  @override
  String get booklistGroupClassLists => 'Class lists';

  @override
  String booklistNewTotal(int count, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'New: $price for $count books',
      one: 'New: $price for 1 book',
    );
    return '$_temp0';
  }

  @override
  String get booklistPriceNew => 'New';

  @override
  String get booklistPriceCertified => 'Certified Used';

  @override
  String get booklistPriceUsed => 'Used';

  @override
  String get booklistAddAll => 'Add whole list to cart';

  @override
  String booklistAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Added $count books',
      one: 'Added 1 book',
      zero: 'Nothing added',
    );
    return '$_temp0';
  }

  @override
  String booklistOutOfStock(int count) {
    return '$count out of stock';
  }

  @override
  String get booklistAddBooks => 'Add books';

  @override
  String get booklistRemoveBook => 'Remove from list';

  @override
  String get booklistEmpty => 'No books in this list yet.';

  @override
  String get booklistRename => 'Rename';

  @override
  String get booklistDelete => 'Delete list';

  @override
  String get booklistDeleteConfirm => 'Delete this list?';

  @override
  String get booklistDeleted => 'List deleted';

  @override
  String get booklistNameHint => 'List name';

  @override
  String get booklistCancel => 'Cancel';

  @override
  String get booklistSave => 'Save';

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
  String get bookConditionLikeNew => 'Like new';

  @override
  String get bookConditionVeryGood => 'Very good';

  @override
  String get bookConditionGood => 'Good';

  @override
  String get bookConditionAcceptable => 'Acceptable';

  @override
  String get bookOtherWays => 'Other ways to buy';

  @override
  String get bookCertifiedNote => 'checked and cleaned by Waraqah';

  @override
  String get bookAddUsedToCart => 'Add used copy to cart';

  @override
  String get bookFromReaders => 'From readers';

  @override
  String bookListingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count listings',
      one: '1 listing',
    );
    return '$_temp0';
  }

  @override
  String bookFromPrice(String price) {
    return 'from $price';
  }

  @override
  String bookResellsFor(String amount) {
    return 'Finished it? Copies like this usually resell for about $amount on Waraqah.';
  }

  @override
  String get bookReaderSaleNote =>
      'Make the seller an offer and agree on a meetup or courier. You pay the seller directly.';

  @override
  String get bookLookInside => 'Look inside';

  @override
  String get bookLookInsideNone => 'Nothing to show for this book yet.';

  @override
  String get bookContents => 'Contents';

  @override
  String get bookSamplePages => 'Sample pages';

  @override
  String bookPageOf(int page, int total) {
    return 'Page $page of $total';
  }

  @override
  String get bookSwipeForMore => 'swipe for more';

  @override
  String get bookSampleEnds => 'end of the sample';

  @override
  String bookSeriesPosition(int position, int total) {
    return 'Book $position of $total';
  }

  @override
  String get seriesOpen => 'View series';

  @override
  String get bookSeriesNotYet => 'Not in store yet';

  @override
  String get bookSeriesNotYetLong => 'Waraqah doesn\'t sell this one yet.';

  @override
  String get bookQuestionsTitle => 'Questions & answers';

  @override
  String bookQuestionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions',
      one: '1 question',
      zero: 'No questions yet',
    );
    return '$_temp0';
  }

  @override
  String get bookQuestionsEmpty => 'No questions yet. Be the first to ask.';

  @override
  String get bookAskQuestion => 'Ask a question';

  @override
  String get bookQuestionHint => 'What would you like to know about this book?';

  @override
  String get bookAnswerHint => 'Share what you know';

  @override
  String get bookAnswer => 'Answer';

  @override
  String get bookNoAnswerYet => 'No answer yet';

  @override
  String get bookFromWaraqah => 'Waraqah';

  @override
  String get bookPost => 'Post';

  @override
  String get bookPostTooShort => 'That\'s a bit short. Add a few more words.';

  @override
  String get bookPostTooLong => 'That\'s too long. Please shorten it.';

  @override
  String get bookQuestionPosted =>
      'Question posted. Readers and Waraqah can answer it.';

  @override
  String get bookAnswerPosted => 'Answer posted';

  @override
  String get bookLowest30Days => 'Lowest in 30 days';

  @override
  String get alertMine => 'My alerts';

  @override
  String get alertNotifyMe => 'Notify me';

  @override
  String get alertStockOn => 'We\'ll let you know · tap to stop';

  @override
  String get alertStockSet => 'We\'ll let you know when it\'s back.';

  @override
  String get alertTurnedOff => 'Alert turned off';

  @override
  String get alertTurnOff => 'Turn off alert';

  @override
  String get alertPriceTitle => 'Price drop alert';

  @override
  String alertPriceToday(String price) {
    return 'Today it\'s $price.';
  }

  @override
  String alertPriceWhen(String price) {
    return 'Alert me at $price or less';
  }

  @override
  String get alertSet => 'Set alert';

  @override
  String get alertPriceSet => 'We\'ll let you know when the price drops.';

  @override
  String get alertBackNow => 'Back in stock now';

  @override
  String get alertWaitingStock => 'Waiting for it to be back in stock';

  @override
  String alertPriceDropped(String price) {
    return 'Price dropped to $price';
  }

  @override
  String alertWaitingPrice(String target, String price) {
    return 'Alert at $target · now $price';
  }

  @override
  String get alertEmpty =>
      'No alerts yet. Tap Notify me on a sold-out book, or the bell on a wishlist book.';

  @override
  String get dealTitle => 'Deals';

  @override
  String get dealFlashSale => 'Flash sale';

  @override
  String get dealFlashEndsIn => 'Flash sale ends in';

  @override
  String get dealSeeAll => 'See deals';

  @override
  String get dealBundles => 'Bundles';

  @override
  String get dealInBundle => 'Buy it in a bundle';

  @override
  String get dealAddBundle => 'Add bundle to cart';

  @override
  String get dealPreorders => 'Coming soon · pre-order';

  @override
  String dealReleases(String date) {
    return 'Releases $date · ships on release day';
  }

  @override
  String get dealPreorderNow => 'Pre-order';

  @override
  String get pointsTitle => 'Waraqah points';

  @override
  String pointsBalance(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      one: '1 point',
    );
    return '$_temp0';
  }

  @override
  String get pointsRuleEarn => 'Earn 1 point for every ৳100 you pay for books.';

  @override
  String get pointsRuleSpend =>
      'Use them at checkout: 1 point = ৳1 off, once you have 50, for up to 20% of the books.';

  @override
  String get pointsRuleCancel =>
      'Cancelling an order gives back the points it used.';

  @override
  String get pointsHistory => 'History';

  @override
  String get pointsWelcome => 'Welcome bonus';

  @override
  String pointsEarnedOn(String order) {
    return 'Earned on $order';
  }

  @override
  String pointsSpentOn(String order) {
    return 'Used on $order';
  }

  @override
  String pointsRefunded(String order) {
    return 'Given back · $order cancelled';
  }

  @override
  String pointsReversed(String order) {
    return 'Taken back · $order cancelled';
  }

  @override
  String get cartTitle => 'Cart';

  @override
  String cartItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get cartEmptyTitle => 'Your cart is empty';

  @override
  String get cartEmptyBody => 'Books you add will show up here.';

  @override
  String get cartBrowse => 'Browse books';

  @override
  String get cartSubtotal => 'Subtotal';

  @override
  String cartYouSave(String amount) {
    return 'You save $amount';
  }

  @override
  String cartEach(String price) {
    return '$price each';
  }

  @override
  String get cartDeliveryNote =>
      'Delivery fee and coupons are added at checkout.';

  @override
  String get cartCheckout => 'Checkout';

  @override
  String get cartAdded => 'Added to cart';

  @override
  String get cartView => 'View cart';

  @override
  String get cartLimitReached => 'You can\'t add more of this one.';

  @override
  String get cartIncrease => 'Add one';

  @override
  String get cartDecrease => 'Remove one';

  @override
  String get cartRemove => 'Remove';

  @override
  String get cartSaveForLater => 'Save for later';

  @override
  String get cartMovedToWishlist => 'Moved to your wishlist';

  @override
  String get cartCertifiedUsed => 'Certified Used';

  @override
  String get cartFromReader => 'From a reader';

  @override
  String get cartNewBooks => 'New';

  @override
  String get cartUsedBooks => 'Used';

  @override
  String get cartBundle => 'Bundle';

  @override
  String get cartSmartBasket => 'Smart Basket';

  @override
  String cartUsedAvailable(int count, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books are available used, save $amount',
      one: '1 book is available used, save $amount',
    );
    return '$_temp0';
  }

  @override
  String get cartSwitch => 'Switch';

  @override
  String get cartSwitchAll => 'Switch all to used';

  @override
  String cartSwapped(String amount) {
    return 'Switched to used · saved $amount';
  }

  @override
  String cartToFreeDelivery(String amount) {
    return 'Add $amount more for free delivery';
  }

  @override
  String get cartSetBudget => 'Set a budget';

  @override
  String get cartBudgetTitle => 'Fit your budget';

  @override
  String get cartBudgetLabel => 'Your budget in taka';

  @override
  String cartBudgetFits(String total, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fits with $count used copies: $total',
      one: 'Fits with 1 used copy: $total',
      zero: 'Already fits: $total',
    );
    return '$_temp0';
  }

  @override
  String cartBudgetShort(String total) {
    return 'The cheapest mix is $total, still over your budget.';
  }

  @override
  String get cartBudgetApply => 'Apply';

  @override
  String get wishlistTitle => 'Wishlist';

  @override
  String get wishlistMine => 'My wishlist';

  @override
  String wishlistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
    );
    return '$_temp0';
  }

  @override
  String get wishlistSave => 'Save to wishlist';

  @override
  String get wishlistRemove => 'Remove from wishlist';

  @override
  String get wishlistSaved => 'Saved to your wishlist';

  @override
  String get wishlistRemoved => 'Removed from your wishlist';

  @override
  String get wishlistView => 'View';

  @override
  String get wishlistMoveToCart => 'Move to cart';

  @override
  String get wishlistEmptyTitle => 'Your wishlist is empty';

  @override
  String get wishlistEmptyBody =>
      'Tap the heart on any book to save it for later.';

  @override
  String get wishlistBrowse => 'Browse books';

  @override
  String get wishlistShare => 'Share wishlist';

  @override
  String get wishlistShareTitle => 'Share your wishlist';

  @override
  String get wishlistShareBody =>
      'Anyone with the link can see the books on your wishlist and buy you one as a gift. They can\'t change your list.';

  @override
  String get wishlistCopyLink => 'Copy link';

  @override
  String get wishlistLinkCopied => 'Link copied';

  @override
  String get wishlistPreview => 'See it as friends do';

  @override
  String wishlistSharedTitle(String name) {
    return '$name\'s wishlist';
  }

  @override
  String wishlistSharedGiftHint(String name) {
    return 'Buying one for $name? Add it to your cart and turn on \"Send as a gift\" at checkout.';
  }

  @override
  String get wishlistSharedMissing => 'This wishlist isn\'t shared any more.';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get checkoutStepAddress => 'Delivery address';

  @override
  String get checkoutStepDelivery => 'Delivery';

  @override
  String get checkoutStepPayment => 'Payment';

  @override
  String get checkoutPayBkash => 'bKash';

  @override
  String get checkoutPayNagad => 'Nagad';

  @override
  String get checkoutPayCod => 'Cash on delivery';

  @override
  String get checkoutPayCard => 'Card';

  @override
  String get checkoutPayBkashNote => 'Pay from your bKash account';

  @override
  String get checkoutPayNagadNote => 'Pay from your Nagad account';

  @override
  String get checkoutPayCodNote => 'Pay in cash when the books arrive';

  @override
  String get checkoutPayCardNote => 'Visa, Mastercard or Amex';

  @override
  String get checkoutCodUnavailable => 'Not available for eBook-only orders';

  @override
  String get checkoutDemoNote =>
      'Payments are simulated for now; no money moves.';

  @override
  String get checkoutEbooksOnly =>
      'eBooks are ready to read as soon as you pay';

  @override
  String get checkoutFreeDelivery => 'Free delivery';

  @override
  String checkoutDeliveryFeeIs(String amount) {
    return 'Delivery fee $amount';
  }

  @override
  String checkoutFreeDeliveryFrom(String amount) {
    return 'Free delivery on orders of $amount or more';
  }

  @override
  String get checkoutCouponHint => 'Coupon code';

  @override
  String get checkoutApply => 'Apply';

  @override
  String get checkoutCouponNotFound => 'That code doesn\'t exist.';

  @override
  String get checkoutCouponExpired => 'This code has expired.';

  @override
  String checkoutCouponMinimum(String amount) {
    return 'This code needs an order of $amount or more.';
  }

  @override
  String checkoutCouponApplied(String code) {
    return '$code applied';
  }

  @override
  String get checkoutRemoveCoupon => 'Remove coupon';

  @override
  String checkoutItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get checkoutDeliveryFee => 'Delivery fee';

  @override
  String get checkoutFree => 'Free';

  @override
  String get checkoutCouponDiscount => 'Coupon discount';

  @override
  String get checkoutTotal => 'Total';

  @override
  String get checkoutPlaceOrder => 'Place order';

  @override
  String checkoutUsePoints(int count) {
    return 'Use $count points';
  }

  @override
  String checkoutPointsSave(String amount, int balance) {
    return '$amount off · you have $balance';
  }

  @override
  String checkoutPointsNotYet(int balance) {
    return 'You have $balance points. You can use them once you have 50.';
  }

  @override
  String get checkoutPointsDiscount => 'Points';

  @override
  String get checkoutGiftTitle => 'Send as a gift';

  @override
  String get checkoutGiftNote =>
      'It goes to the address above with your card, and no prices.';

  @override
  String get checkoutGiftRecipient => 'Who is it for?';

  @override
  String get checkoutGiftRecipientHint => 'Their name, for the card';

  @override
  String get checkoutGiftMessage => 'Message on the card (optional)';

  @override
  String get checkoutGiftWrap => 'Gift wrap';

  @override
  String orderGiftFor(String name) {
    return 'Gift for $name';
  }

  @override
  String get orderGiftWrapped => 'Gift-wrapped';

  @override
  String orderPlacedGiftFor(String name) {
    return 'It\'s a gift for $name: we\'ll add your card and leave the prices out.';
  }

  @override
  String get adminOrderGiftPack => 'Add the card and leave the prices out.';

  @override
  String get adminOrderGiftWrap =>
      'Wrap it, add the card and leave the prices out.';

  @override
  String get giftDonateTitle => 'Donate books';

  @override
  String get giftDonateIntro =>
      'Every place here is checked by Waraqah. Pick a book they need and we\'ll deliver it free, with your note.';

  @override
  String get giftDonateVerified => 'Verified';

  @override
  String giftDonateKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'library': 'Community library',
      'school': 'School',
      'madrasa': 'Madrasa',
      'orphanage': 'Orphanage',
      'other': 'Place',
    });
    return '$_temp0';
  }

  @override
  String giftDonateProgress(int received, int wanted) {
    return '$received of $wanted books received';
  }

  @override
  String get giftDonateNeeds => 'Books they need';

  @override
  String giftDonateNeedProgress(int received, int wanted) {
    return '$received of $wanted received';
  }

  @override
  String giftDonatePerCopy(String amount) {
    return '$amount a copy';
  }

  @override
  String get giftDonateAction => 'Donate';

  @override
  String get giftDonateMet => 'All donated';

  @override
  String giftDonateFreeDelivery(String name) {
    return 'Delivered free to $name';
  }

  @override
  String get giftDonateHowMany => 'How many copies?';

  @override
  String get giftDonateFewer => 'One fewer';

  @override
  String get giftDonateMore => 'One more';

  @override
  String get giftDonateNote => 'A note for them (optional)';

  @override
  String giftDonateConfirm(String amount) {
    return 'Donate $amount';
  }

  @override
  String giftDonateThanks(String name) {
    return 'Thank you! Your books are on their way to $name.';
  }

  @override
  String get giftDonateMissing => 'We couldn\'t find this place.';

  @override
  String orderDonationTo(String name) {
    return 'Donation to $name';
  }

  @override
  String get walletTitle => 'Wallet';

  @override
  String get walletRuleIn =>
      'Money back from cancelled or returned orders, and from books you sell back to Waraqah, lands here.';

  @override
  String get walletRuleSpend =>
      'Use it at checkout like cash, for books and delivery.';

  @override
  String get walletHistory => 'History';

  @override
  String walletCancelRefund(String order) {
    return 'Refund for cancelled $order';
  }

  @override
  String walletReturnRefund(String order) {
    return 'Refund for returned $order';
  }

  @override
  String walletSellBack(String book) {
    return 'Sell Back: $book';
  }

  @override
  String walletSpentOn(String order) {
    return 'Used on $order';
  }

  @override
  String walletUseAtCheckout(String amount) {
    return 'Pay $amount from your wallet';
  }

  @override
  String walletYouHave(String amount) {
    return 'You have $amount';
  }

  @override
  String get orderRefundedToWallet => 'Refunded to your wallet';

  @override
  String orderPlacedFromWallet(String amount) {
    return '$amount came from your wallet.';
  }

  @override
  String get orderPlacedTitle => 'Order placed!';

  @override
  String orderPlacedNumber(String number) {
    return 'Order $number';
  }

  @override
  String orderPlacedPaid(String amount, String method) {
    return 'Paid $amount with $method';
  }

  @override
  String orderPlacedPayOnDelivery(String amount) {
    return 'Pay $amount in cash when it arrives';
  }

  @override
  String get orderPlacedContinue => 'Continue shopping';

  @override
  String orderPointsEarned(int count) {
    return 'You earned $count Waraqah points';
  }

  @override
  String get orderPointsEarnedRow => 'Points earned';

  @override
  String get orderTrack => 'Track order';

  @override
  String get orderMyOrders => 'My orders';

  @override
  String get orderEmptyTitle => 'No orders yet';

  @override
  String get orderEmptyBody =>
      'Books you order will show up here, with tracking.';

  @override
  String orderPlacedOn(String date) {
    return 'Placed on $date';
  }

  @override
  String get orderNotFound => 'We couldn\'t find this order.';

  @override
  String get orderStatusPlaced => 'Placed';

  @override
  String get orderStatusConfirmed => 'Confirmed';

  @override
  String get orderStatusPacked => 'Packed';

  @override
  String get orderStatusShipped => 'Shipped';

  @override
  String get orderStatusDelivered => 'Delivered';

  @override
  String get orderStatusCancelled => 'Cancelled';

  @override
  String get orderDeliverTo => 'Delivering to';

  @override
  String get orderPaid => 'Paid';

  @override
  String get orderPayOnDelivery => 'Pay on delivery';

  @override
  String get orderCancel => 'Cancel order';

  @override
  String get orderCancelTitle => 'Cancel this order?';

  @override
  String get orderCancelBody =>
      'This can\'t be undone. Anything you paid goes back to your Waraqah wallet.';

  @override
  String get orderKeep => 'Keep order';

  @override
  String get orderCancelled => 'Order cancelled';

  @override
  String get orderReturn => 'Request a return';

  @override
  String get orderReturnWhy => 'Why are you sending it back?';

  @override
  String get orderReturnDamaged => 'It arrived damaged';

  @override
  String get orderReturnWrongBook => 'I got the wrong book';

  @override
  String get orderReturnOther => 'Something else';

  @override
  String get orderReturnNoteHint => 'Tell us what happened (optional)';

  @override
  String get orderReturnAddPhotos => 'Add photos';

  @override
  String get orderReturnRemovePhoto => 'Remove photo';

  @override
  String get orderReturnPhotosHelp =>
      'Up to 3 photos. Pictures of the damage help us decide faster.';

  @override
  String get orderReturnSend => 'Send request';

  @override
  String get orderReturnSent => 'Return requested. We\'ll reply within 2 days.';

  @override
  String get orderReturnRequested => 'Return requested, waiting for review';

  @override
  String get orderReturnApproved => 'Return approved, we\'ll pick it up';

  @override
  String get orderReturnRejected => 'Return not approved';

  @override
  String get orderReturnWindow => 'Returns are open for 7 days after delivery.';

  @override
  String get orderBuyAgain => 'Buy again';

  @override
  String orderBackInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books are back in your cart.',
      one: '1 book is back in your cart.',
    );
    return '$_temp0';
  }

  @override
  String orderSomeUnavailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count can\'t be bought again right now.',
      one: '1 can\'t be bought again right now.',
    );
    return '$_temp0';
  }

  @override
  String get orderNoneAvailable =>
      'None of these books can be bought again right now.';

  @override
  String get orderInvoice => 'Invoice';

  @override
  String get orderInvoiceSeller => 'Waraqah · Invoice';

  @override
  String orderInvoiceQuantity(int count, String price) {
    return '$count × $price';
  }

  @override
  String get orderInvoiceShipTo => 'Ship to';

  @override
  String get orderInvoiceThanks => 'Thank you for reading with Waraqah.';

  @override
  String get orderReturnPolicy => 'Return policy';

  @override
  String get orderPolicyTitle => 'Returns and refunds';

  @override
  String get orderPolicyWhenTitle => 'Within 7 days of delivery';

  @override
  String get orderPolicyWhen =>
      'Ask for a return from the order\'s page within 7 days of delivery. The button is there while the window is open.';

  @override
  String get orderPolicyWhatTitle => 'What can go back';

  @override
  String get orderPolicyWhat =>
      'Printed books that arrived damaged, or the wrong book. For anything else, choose “Something else” and tell us what happened. Certified Used copies follow the same rules. eBooks can\'t be returned once they\'re in your library.';

  @override
  String get orderPolicyHowTitle => 'How it works';

  @override
  String get orderPolicyHow =>
      'Add up to 3 photos of the problem. We reply within 2 days, on the order\'s page. Once it\'s approved, we pick the book up from your address.';

  @override
  String get orderPolicyMoneyTitle => 'Your money';

  @override
  String get orderPolicyMoney =>
      'When a return is approved, the price of the books goes to your Waraqah wallet, ready for your next order. Delivery and gift wrap aren\'t refunded.';

  @override
  String get orderPolicyCancelTitle => 'Cancelling instead';

  @override
  String get orderPolicyCancel =>
      'Until your order ships, you can cancel it from the order\'s page. Everything you paid goes back to your wallet.';

  @override
  String get orderPolicyUsedTitle => 'Books from other readers';

  @override
  String get orderPolicyUsed =>
      'Copies you buy from other readers aren\'t sold by Waraqah, so they can\'t be returned here. Check the copy before you pay the seller.';

  @override
  String get adminOrderTitle => 'Orders';

  @override
  String get adminOrderTabOrders => 'Orders';

  @override
  String get adminOrderTabReturns => 'Returns';

  @override
  String get adminOrderTabCoupons => 'Coupons';

  @override
  String get adminOrderAll => 'All';

  @override
  String adminOrderMoveTo(String status) {
    return 'Mark as $status';
  }

  @override
  String get adminOrderNoOrders => 'No orders here.';

  @override
  String get adminOrderNoReturns => 'No returns waiting.';

  @override
  String get adminOrderApprove => 'Approve';

  @override
  String get adminOrderReject => 'Reject';

  @override
  String get adminOrderReturnApproved => 'Return approved';

  @override
  String get adminOrderReturnRejected => 'Return rejected';

  @override
  String get adminOrderNewCoupon => 'New coupon';

  @override
  String get adminOrderCouponCode => 'Code';

  @override
  String get adminOrderCouponCodeHint => 'e.g. BOISHAKH20';

  @override
  String get adminOrderCouponKindPercent => '% off';

  @override
  String get adminOrderCouponKindAmount => '৳ off';

  @override
  String get adminOrderCouponPercent => 'Percent off';

  @override
  String get adminOrderCouponCap => 'Most it can take off in taka (optional)';

  @override
  String get adminOrderCouponTaka => 'Taka off';

  @override
  String get adminOrderCouponMinOrder => 'Minimum order in taka (optional)';

  @override
  String get adminOrderCouponPickDate => 'Set end date';

  @override
  String get adminOrderCouponCreate => 'Create coupon';

  @override
  String get adminOrderCouponCreated => 'Coupon created';

  @override
  String get adminOrderCouponBadCode =>
      'Use 3–20 letters or digits for the code.';

  @override
  String get adminOrderCouponBadValue =>
      'Check the amounts: 1–90% off, or at least ৳1 off.';

  @override
  String get adminOrderCouponBadExpiry =>
      'The end date has to be in the future.';

  @override
  String get adminOrderCouponTaken => 'A coupon with this code already exists.';

  @override
  String adminOrderCouponPercentOff(int percent) {
    return '$percent% off';
  }

  @override
  String adminOrderCouponUpTo(String amount) {
    return 'up to $amount';
  }

  @override
  String adminOrderCouponAmountOff(String amount) {
    return '$amount off';
  }

  @override
  String adminOrderCouponFrom(String amount) {
    return 'orders from $amount';
  }

  @override
  String get adminOrderCouponExpired => 'Expired';

  @override
  String get adminOrderCouponNoEnd => 'No end date';

  @override
  String adminOrderCouponUntil(String date) {
    return 'Until $date';
  }

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
  String get profileEditProfile => 'Edit profile';

  @override
  String get profileEditName => 'Name';

  @override
  String get profileEditPhoto => 'Change photo';

  @override
  String get profilePhone => 'Phone number';

  @override
  String get profilePhoneHint => '01XXXXXXXXX';

  @override
  String get profileSaveChanges => 'Save changes';

  @override
  String get profileSaved => 'Profile updated';

  @override
  String get profileSavedAddresses => 'Saved addresses';

  @override
  String get profileAddAddress => 'Add address';

  @override
  String get profileNoAddresses => 'No saved addresses yet.';

  @override
  String get profileAddressLabel => 'Address label';

  @override
  String get profileAddressLine => 'House, road and area';

  @override
  String get profileDivision => 'Division';

  @override
  String get profileDistrict => 'District';

  @override
  String get profileUpazila => 'Upazila';

  @override
  String get profileSelectDivision => 'Select division';

  @override
  String get profileSelectDistrict => 'Select district';

  @override
  String get profileSelectUpazila => 'Select upazila';

  @override
  String get profileSaveAddress => 'Save address';

  @override
  String get profileAddressSaved => 'Address saved';

  @override
  String get profileEditAddress => 'Edit address';

  @override
  String get profileDeleteAddress => 'Delete address';

  @override
  String get profileDeleteAddressMessage => 'Remove this saved address?';

  @override
  String get profileAddressDeleted => 'Address deleted';

  @override
  String get profileNotifications => 'Notifications';

  @override
  String get profileNotificationCenter => 'Notification centre';

  @override
  String get profileMarkAllRead => 'Mark all read';

  @override
  String get profileNoNotifications => 'You are all caught up.';

  @override
  String get profilePushNotifications => 'Push notifications';

  @override
  String get profileOrderUpdates => 'Order updates';

  @override
  String get profilePromotions => 'Offers and recommendations';

  @override
  String get profilePrivacy => 'Privacy';

  @override
  String get profileProfileVisibility => 'Profile visibility';

  @override
  String get profileActivityVisibility => 'Reading activity visibility';

  @override
  String get profileDeleteAccount => 'Delete account';

  @override
  String get profileDeleteAccountMessage =>
      'This will permanently remove your account and saved data.';

  @override
  String get profileDeleteConfirm => 'Delete permanently';

  @override
  String get profileCancel => 'Cancel';

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
  String get adminCatalogTitle => 'Catalog';

  @override
  String get adminCatalogTabBooks => 'Books';

  @override
  String get adminCatalogTabCategories => 'Categories';

  @override
  String get adminCatalogTabAuthors => 'Authors';

  @override
  String get adminCatalogTabPublishers => 'Publishers';

  @override
  String get adminCatalogTabBanners => 'Banners';

  @override
  String get adminCatalogErrTitleBlank => 'Add a title';

  @override
  String get adminCatalogErrAuthorMissing => 'Pick an author';

  @override
  String get adminCatalogErrPublisherMissing => 'Pick a publisher';

  @override
  String get adminCatalogErrCategoryMissing => 'Pick a category';

  @override
  String get adminCatalogErrCategoryWrongSection =>
      'This category is in another section';

  @override
  String get adminCatalogErrClassNotAllowed =>
      'Classes 6–12, and only on School & College books.';

  @override
  String get adminCatalogErrExamNotAllowed =>
      'This Section doesn\'t offer that Exam.';

  @override
  String get adminCatalogFieldSubject => 'Subject';

  @override
  String get adminCatalogFieldNoSubject => 'No Subject';

  @override
  String get adminCatalogErrNoEditions => 'Add at least one edition';

  @override
  String get adminCatalogErrPriceNotPositive => 'Price must be more than ৳0';

  @override
  String get adminCatalogErrListPriceTooLow =>
      'List price must be more than the price';

  @override
  String get adminCatalogErrStockNegative => 'Stock can\'t be below 0';

  @override
  String get adminCatalogErrIsbnInvalid =>
      'Not a valid ISBN. Check the 10 or 13 digits.';

  @override
  String get adminCatalogErrIsbnTaken =>
      'Another edition already has this ISBN';

  @override
  String get adminCatalogErrEditionTaken =>
      'This book already has an edition in this format and language';

  @override
  String get adminCatalogErrNameBlank => 'Add a name';

  @override
  String get adminCatalogErrNameBnBlank => 'Add the Bangla name';

  @override
  String get adminCatalogErrBannerTitleBlank =>
      'Add the title in English and Bangla';

  @override
  String get adminCatalogErrBannerTargetBlank => 'Choose what the banner opens';

  @override
  String get adminCatalogAddBook => 'Add book';

  @override
  String get adminCatalogIsbnLookupField => 'ISBN to look up';

  @override
  String get adminCatalogLookUp => 'Look up';

  @override
  String get adminCatalogIsbnNotFound => 'Not found — fill in by hand.';

  @override
  String get adminCatalogIsbnInCatalog => 'Already in the catalog';

  @override
  String get adminCatalogOpen => 'Open';

  @override
  String get adminCatalogMoreTools => 'More tools';

  @override
  String get adminCatalogLowStock => 'Low stock';

  @override
  String get adminCatalogLowStockEmpty => 'All stocked up.';

  @override
  String adminCatalogStockLeft(int count) {
    return '$count left';
  }

  @override
  String get adminCatalogSetStock => 'Set stock';

  @override
  String get adminCatalogImport => 'Import CSV';

  @override
  String get adminCatalogImportHint =>
      'Paste rows with this header. One row is one Edition; rows with the same title and Author make one Book.';

  @override
  String get adminCatalogImportField => 'CSV rows';

  @override
  String get adminCatalogImportExample => 'Paste example';

  @override
  String get adminCatalogImportCheck => 'Check';

  @override
  String adminCatalogImportBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Import $count books',
      one: 'Import 1 book',
    );
    return '$_temp0';
  }

  @override
  String adminCatalogImportEditions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count editions',
      one: '1 edition',
    );
    return '$_temp0';
  }

  @override
  String get adminCatalogImportNewAuthor => 'new Author';

  @override
  String get adminCatalogImportNewPublisher => 'new Publisher';

  @override
  String adminCatalogImportRow(int row) {
    return 'Row $row:';
  }

  @override
  String get adminCatalogImportColumns => 'needs 12 columns';

  @override
  String get adminCatalogImportBlank =>
      'title, Author and Publisher are needed';

  @override
  String adminCatalogImportSection(String value) {
    return 'unknown Section “$value”';
  }

  @override
  String adminCatalogImportCategory(String value) {
    return 'unknown Category “$value”';
  }

  @override
  String adminCatalogImportFormat(String value) {
    return 'unknown format “$value”';
  }

  @override
  String adminCatalogImportLanguage(String value) {
    return 'unknown language “$value”';
  }

  @override
  String adminCatalogImportNumber(String value) {
    return '“$value” isn\'t a whole number';
  }

  @override
  String adminCatalogImportDone(int imported, int skipped) {
    return 'Imported $imported books, skipped $skipped.';
  }

  @override
  String get adminCatalogEditBook => 'Edit book';

  @override
  String get adminCatalogSearchBooks => 'Search title or author';

  @override
  String get adminCatalogShowHidden => 'Show hidden books';

  @override
  String get adminCatalogHidden => 'Hidden';

  @override
  String adminCatalogInStock(int count) {
    return '$count in stock';
  }

  @override
  String get adminCatalogNoBooks => 'No books match.';

  @override
  String get adminCatalogFieldTitle => 'Title';

  @override
  String get adminCatalogFieldTitleBn => 'Bangla title (optional)';

  @override
  String get adminCatalogFieldAuthor => 'Author';

  @override
  String get adminCatalogFieldPublisher => 'Publisher';

  @override
  String get adminCatalogFieldSection => 'Section';

  @override
  String get adminCatalogFieldCategory => 'Category';

  @override
  String get adminCatalogFieldLanguage => 'Original language';

  @override
  String get adminCatalogPick => 'Choose…';

  @override
  String get adminCatalogCover => 'Cover colours';

  @override
  String get adminCatalogEditions => 'Editions';

  @override
  String get adminCatalogAddEdition => 'Add edition';

  @override
  String get adminCatalogRemoveEdition => 'Remove edition';

  @override
  String get adminCatalogFieldFormat => 'Format';

  @override
  String get adminCatalogFieldEditionLanguage => 'Language';

  @override
  String get adminCatalogFieldPrice => 'Price (৳)';

  @override
  String get adminCatalogFieldListPrice => 'List price (৳, optional)';

  @override
  String get adminCatalogFieldStock => 'Stock';

  @override
  String get adminCatalogFieldPreorder => 'Pre-order';

  @override
  String get adminCatalogFieldIsbn => 'ISBN (optional)';

  @override
  String get adminCatalogEbookNote => 'eBooks never run out and have no ISBN.';

  @override
  String get adminCatalogDone => 'Done';

  @override
  String get adminCatalogSave => 'Save';

  @override
  String get adminCatalogSaved => 'Saved';

  @override
  String get adminCatalogSaveFailed =>
      'Couldn\'t save. Check the form and try again.';

  @override
  String get adminCatalogHide => 'Hide';

  @override
  String get adminCatalogUnhide => 'Show again';

  @override
  String get adminCatalogHideHint =>
      'A hidden book leaves lists, search, Home and collections, but its page still opens from old links and can be bought. To stop sales, set stock to 0.';

  @override
  String get adminCatalogSearchRecords => 'Search';

  @override
  String get adminCatalogAddNew => 'Add new…';

  @override
  String get adminCatalogFieldName => 'Name (English)';

  @override
  String get adminCatalogFieldNameBn => 'Name (Bangla)';

  @override
  String get adminCatalogFieldNameBnOptional => 'Name (Bangla, optional)';

  @override
  String adminCatalogBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
      zero: 'No books',
    );
    return '$_temp0';
  }

  @override
  String adminCatalogUsedBy(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Used by $count books',
      one: 'Used by 1 book',
    );
    return '$_temp0';
  }

  @override
  String get adminCatalogDelete => 'Delete';

  @override
  String get adminCatalogDeleted => 'Deleted';

  @override
  String get adminCatalogAdd => 'Add';

  @override
  String get adminCatalogNoRecords => 'Nothing here yet.';

  @override
  String get adminCatalogBannerNew => 'New banner';

  @override
  String get adminCatalogBannerEdit => 'Edit banner';

  @override
  String get adminCatalogFieldTitleEn => 'Title (English)';

  @override
  String get adminCatalogFieldTitleBnBanner => 'Title (Bangla)';

  @override
  String get adminCatalogFieldSubtitleEn => 'Subtitle (English)';

  @override
  String get adminCatalogFieldSubtitleBn => 'Subtitle (Bangla)';

  @override
  String get adminCatalogBannerColour => 'Colours';

  @override
  String get adminCatalogBannerOpens => 'Opens';

  @override
  String get adminCatalogTargetCollection => 'Collection';

  @override
  String get adminCatalogTargetBook => 'Book';

  @override
  String get adminCatalogTargetSearch => 'Search';

  @override
  String get adminCatalogSearchWords => 'Search words';

  @override
  String get adminCatalogMoveUp => 'Move up';

  @override
  String get adminCatalogMoveDown => 'Move down';

  @override
  String get adminCatalogEdit => 'Edit';

  @override
  String get adminCatalogDeleteBannerTitle => 'Delete this banner?';

  @override
  String get adminCatalogDeleteBannerBody => 'It leaves Home at once.';

  @override
  String get adminCatalogCancel => 'Cancel';

  @override
  String get adminCatalogNoBanners =>
      'No banners. Home shows none until you add one.';

  @override
  String get adminCatalogSeasonHome => 'Home\'s season';

  @override
  String get adminCatalogSeasonAuto => 'Automatic (by date)';

  @override
  String get adminCatalogSeason => 'Season';

  @override
  String get adminCatalogSeasonNone => 'None (all year)';

  @override
  String get adminCatalogTabCollections => 'Collections';

  @override
  String get adminCatalogListsBooklists => 'Booklists';

  @override
  String get adminCatalogNewCollection => 'New Collection';

  @override
  String get adminCatalogEditCollection => 'Edit Collection';

  @override
  String get adminCatalogNewBooklist => 'New Booklist';

  @override
  String get adminCatalogEditBooklist => 'Edit Booklist';

  @override
  String get adminCatalogFieldNoteEn => 'Why these books (English)';

  @override
  String get adminCatalogFieldNoteBn => 'Why these books (Bangla)';

  @override
  String get adminCatalogFieldSectionOptional => 'Section (optional)';

  @override
  String get adminCatalogNoSection => 'None (general)';

  @override
  String get adminCatalogFieldExpert => 'Expert (optional)';

  @override
  String get adminCatalogNoExpert => 'None (picked by Staff)';

  @override
  String get adminCatalogFieldKind => 'Kind';

  @override
  String get adminCatalogListBooks => 'Books';

  @override
  String get adminCatalogAddBooks => 'Add books';

  @override
  String get adminCatalogRemoveBook => 'Remove';

  @override
  String get adminCatalogErrListTitleBlank =>
      'Add the title in English and Bangla';

  @override
  String get adminCatalogErrListNoBooks => 'Add at least one book';

  @override
  String get adminCatalogErrListDuplicateBook => 'A book is in the list twice';

  @override
  String get adminCatalogErrListNoteTooLong =>
      'Keep each note to 300 characters';

  @override
  String get adminCatalogDeleteListTitle => 'Delete this list?';

  @override
  String get adminCatalogDeleteListBody => 'Readers stop seeing it at once.';

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

  @override
  String get moderationTabLog => 'Log';

  @override
  String get moderationApprove => 'Approve';

  @override
  String get moderationRequestChanges => 'Ask for changes';

  @override
  String get moderationReject => 'Reject';

  @override
  String get moderationReasonChangesTitle => 'What should the seller change?';

  @override
  String get moderationReasonRejectTitle => 'Why is it rejected?';

  @override
  String get moderationReasonLabel => 'Reason';

  @override
  String get moderationReasonHint => 'The seller sees this.';

  @override
  String get moderationReasonRequired => 'Add a reason for the seller.';

  @override
  String moderationReasonTooLong(int max) {
    return 'Keep it under $max characters.';
  }

  @override
  String get moderationQuickPhotos => 'Add clearer photos of your copy';

  @override
  String get moderationQuickPhotocopy => 'This looks like a photocopy';

  @override
  String get moderationQuickPrice => 'The price is higher than buying new';

  @override
  String get moderationQuickCondition =>
      'The condition doesn\'t match the photos';

  @override
  String get moderationSend => 'Send';

  @override
  String moderationApproved(String title) {
    return '$title is live.';
  }

  @override
  String moderationChangesSent(String name) {
    return 'Asked $name for changes.';
  }

  @override
  String moderationRejected(String title) {
    return '$title was rejected.';
  }

  @override
  String moderationStrikes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strikes',
      one: '1 strike',
      zero: 'No strikes',
    );
    return '$_temp0';
  }

  @override
  String get moderationBannedTag => 'Banned';

  @override
  String get moderationPhotoFront => 'Front';

  @override
  String get moderationPhotoBack => 'Back';

  @override
  String get moderationPhotoSpine => 'Spine';

  @override
  String get moderationPhotoInside => 'Inside';

  @override
  String get moderationPhotoDamage => 'Damage';

  @override
  String get moderationNoPhotos =>
      'No photos added. Ask for photos before approving.';

  @override
  String moderationNewPrice(String price) {
    return 'New $price';
  }

  @override
  String moderationReportCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reports',
      one: '1 report',
    );
    return '$_temp0';
  }

  @override
  String get moderationKindListing => 'Listing';

  @override
  String get moderationKindUser => 'Reader';

  @override
  String get moderationKindMessage => 'Message';

  @override
  String get moderationKindBite => 'Bite';

  @override
  String get moderationKindComment => 'Comment';

  @override
  String get moderationKindReview => 'Review';

  @override
  String moderationOwner(String name) {
    return 'By $name';
  }

  @override
  String moderationReporterNote(String note) {
    return 'Reporter: $note';
  }

  @override
  String get moderationRemove => 'Remove';

  @override
  String get moderationDismiss => 'Dismiss';

  @override
  String get moderationWarn => 'Warn';

  @override
  String get moderationBan => 'Ban';

  @override
  String moderationBanTitle(String name) {
    return 'Ban $name?';
  }

  @override
  String get moderationBanBody =>
      'They can\'t sell or post any more, and their listings leave the marketplace.';

  @override
  String get moderationCancel => 'Cancel';

  @override
  String get moderationDone => 'Done. It\'s in the log.';

  @override
  String get moderationEmptyLog =>
      'No actions yet. Everything moderators do shows up here.';

  @override
  String get moderationLogApproved => 'Approved';

  @override
  String get moderationLogChangesRequested => 'Asked for changes';

  @override
  String get moderationLogRejected => 'Rejected';

  @override
  String get moderationLogRemoved => 'Removed';

  @override
  String get moderationLogDismissed => 'Dismissed a report on';

  @override
  String get moderationLogWarned => 'Warned';

  @override
  String get moderationLogBanned => 'Banned';

  @override
  String get moderationLogThirdStrike => 'Third strike';

  @override
  String moderationLogBy(String by, String time) {
    return '$by · $time';
  }

  @override
  String get listingSellBook => 'Sell a Book';

  @override
  String get listingMyListings => 'My Listings';

  @override
  String get listingStepPickBook => 'Pick book';

  @override
  String get listingStepCondition => 'Condition';

  @override
  String get listingStepPhotos => 'Photos';

  @override
  String get listingStepPriceHandover => 'Price & Handover';

  @override
  String get listingBookTitle => 'Book title';

  @override
  String get listingBookTitleHint => 'The Pragmatic Programmer';

  @override
  String get listingConditionLikeNew => 'Like New';

  @override
  String get listingConditionVeryGood => 'Very Good';

  @override
  String get listingConditionGood => 'Good';

  @override
  String get listingConditionAcceptable => 'Acceptable';

  @override
  String get listingFlags => 'Flags (optional)';

  @override
  String get listingFlagHighlighting => 'Highlighting';

  @override
  String get listingFlagNotes => 'Notes';

  @override
  String get listingFlagDamage => 'Damage';

  @override
  String get listingPhotosDesc =>
      'Upload front cover, back cover, spine, inside page, any damage.';

  @override
  String get listingPrice => 'Price (৳)';

  @override
  String get listingPriceHint => '450';

  @override
  String get listingNegotiable => 'Negotiable';

  @override
  String get listingHandoverMethod => 'Handover Method';

  @override
  String get listingHandoverMeet => 'Meet in person';

  @override
  String get listingHandoverDelivery => 'Delivery';

  @override
  String get listingSaveDraft => 'Save Draft';

  @override
  String get listingNext => 'Next';

  @override
  String get listingBack => 'Back';

  @override
  String get listingStatusDraft => 'Draft';

  @override
  String get listingStatusInReview => 'In review';

  @override
  String get listingStatusChangesRequested => 'Changes requested';

  @override
  String get listingStatusRejected => 'Rejected';

  @override
  String get listingStatusLive => 'Live';

  @override
  String get listingStatusSold => 'Sold';

  @override
  String get listingConditionPrefix => 'Condition: ';

  @override
  String get listingReasonPrefix => 'Reason: ';

  @override
  String get reportAction => 'Report';

  @override
  String get reportMoreOptions => 'More options';

  @override
  String get reportTitleListing => 'Report this listing';

  @override
  String get reportTitleUser => 'Report this reader';

  @override
  String get reportTitleMessage => 'Report this message';

  @override
  String get reportTitleBite => 'Report this Bite';

  @override
  String get reportTitleComment => 'Report this comment';

  @override
  String get reportTitleReview => 'Report this review';

  @override
  String get reportWhy => 'Why are you reporting it?';

  @override
  String get reportReasonSpam => 'Spam or scam';

  @override
  String get reportReasonFake => 'Fake or misleading';

  @override
  String get reportReasonPhotocopy => 'Photocopy or pirated book';

  @override
  String get reportReasonHarassment => 'Harassment or hate';

  @override
  String get reportReasonOffensive => 'Offensive or inappropriate';

  @override
  String get reportReasonOther => 'Something else';

  @override
  String get reportNoteLabel => 'Tell us more';

  @override
  String get reportNoteHint => 'Optional. Helps moderators decide.';

  @override
  String get reportNoteRequired => 'Tell us what\'s wrong.';

  @override
  String reportNoteTooLong(int max) {
    return 'Keep it under $max characters.';
  }

  @override
  String get reportPrivacy =>
      'They won\'t know who reported them. A moderator will review it.';

  @override
  String get reportSend => 'Send report';

  @override
  String get reportSent => 'Thanks. A moderator will review your report.';

  @override
  String reportBlockUser(String name) {
    return 'Block $name';
  }

  @override
  String reportUnblockUser(String name) {
    return 'Unblock $name';
  }

  @override
  String reportBlockTitle(String name) {
    return 'Block $name?';
  }

  @override
  String get reportBlockBody =>
      'Their listings won\'t show in the marketplace. You can unblock them any time from Profile.';

  @override
  String get reportBlockConfirm => 'Block';

  @override
  String get reportCancel => 'Cancel';

  @override
  String reportBlocked(String name) {
    return '$name is blocked.';
  }

  @override
  String reportUnblocked(String name) {
    return '$name is unblocked.';
  }

  @override
  String reportBlockedNotice(String name) {
    return 'You blocked $name. Unblock them to make an offer.';
  }

  @override
  String get reportUnblock => 'Unblock';

  @override
  String get reportBlockedTitle => 'Blocked readers';

  @override
  String get reportBlockedEmpty => 'You haven\'t blocked anyone.';

  @override
  String get reportBlockedEmptyBody =>
      'Block a reader from their profile or a listing\'s menu. Their listings stop showing in the marketplace.';

  @override
  String reportBlockedSince(String date) {
    return 'Blocked $date';
  }

  @override
  String get listingRulesTitle => 'Before you list';

  @override
  String get listingRuleOriginal =>
      'Only original printed books. No photocopies.';

  @override
  String get listingRulePirated =>
      'No pirated books, PDF printouts or unofficial copies.';

  @override
  String get listingRuleHonest =>
      'Describe the condition honestly, with photos of your own copy.';

  @override
  String get listingRuleWarning =>
      'Moderators reject listings that break these rules, and repeat breaks can get an account banned.';

  @override
  String listingFairPrice(String low, String high) {
    return 'Fair price: $low–$high';
  }

  @override
  String listingFairPriceBasis(String price) {
    return 'From the new price ($price), the condition and the flags.';
  }

  @override
  String get listingFairPriceUnknown =>
      'Scan or pick the book from the catalog to see a fair price.';

  @override
  String get listingPriceLow => 'Lower than most: it should sell fast.';

  @override
  String get listingPriceFair => 'A fair price.';

  @override
  String get listingPriceHigh =>
      'Higher than most used copies, so it may take longer to sell.';

  @override
  String listingPriceAboveNew(String price) {
    return 'That\'s as much as buying it new ($price). Buyers will buy new instead.';
  }

  @override
  String listingFinishedTitle(String title) {
    return 'Finished $title?';
  }

  @override
  String get listingFinishedBody =>
      'Pass it on: another reader gets it for less, and you get money back.';

  @override
  String listingFinishedListRange(String low, String high) {
    return 'Readers pay about $low–$high for a copy read once.';
  }

  @override
  String get listingFinishedList => 'List it for readers';

  @override
  String listingFinishedSellBackLine(String price) {
    return 'Or Waraqah pays $price now, and a courier picks it up.';
  }

  @override
  String get listingFinishedSellBack => 'Sell it back to Waraqah';

  @override
  String get listingFinishedKeep => 'Keep it';

  @override
  String get listingFinishedCardTitle => 'Finished a book you bought?';

  @override
  String get listingFinishedCardBody => 'Tap it to sell it on.';

  @override
  String get scanTitle => 'Scan a book';

  @override
  String get scanAim =>
      'Point the camera at the barcode on the back of the book.';

  @override
  String get scanNoCamera =>
      'The camera isn\'t available here. Type the ISBN from the back of the book instead.';

  @override
  String get scanCameraError =>
      'Couldn\'t open the camera. Type the ISBN instead.';

  @override
  String get scanIsbnLabel => 'Or type the ISBN';

  @override
  String get scanIsbnHint => '978…';

  @override
  String get scanFind => 'Find';

  @override
  String get scanInvalid =>
      'That isn\'t a valid ISBN. Check the 10 or 13 digits.';

  @override
  String scanIsbn(String isbn) {
    return 'ISBN $isbn';
  }

  @override
  String scanNewFrom(String price) {
    return 'New from $price';
  }

  @override
  String get scanOpenBook => 'Open book page';

  @override
  String get scanSellCopy => 'Sell your copy';

  @override
  String get scanNotFoundTitle => 'We don\'t have this book yet';

  @override
  String scanNotFoundBody(String isbn) {
    return 'ISBN $isbn isn\'t in Waraqah\'s catalog.';
  }

  @override
  String get scanRequest => 'Request this book';

  @override
  String get scanListAnyway => 'List it anyway';

  @override
  String scanSelling(String title) {
    return 'From the catalog: $title';
  }

  @override
  String get requestTitle => 'Request a book';

  @override
  String get requestIntro =>
      'Tell us what you\'re looking for. Readers who have it are told, and Waraqah sees what readers want.';

  @override
  String get requestBookTitle => 'Book title';

  @override
  String get requestBookTitleHint => 'Calculus';

  @override
  String get requestAuthor => 'Author (optional)';

  @override
  String get requestAuthorHint => 'James Stewart';

  @override
  String get requestMaxPrice => 'Most you\'d pay, in ৳ (optional)';

  @override
  String get requestMaxPriceHint => '900';

  @override
  String get requestNote => 'Note (optional)';

  @override
  String get requestNoteHint => 'Edition, condition, your area…';

  @override
  String get requestTitleMissing => 'Add the book\'s title.';

  @override
  String requestTitleTooLong(int max) {
    return 'Keep the title under $max characters.';
  }

  @override
  String get requestBadPrice => 'Enter a price above ৳0.';

  @override
  String requestNoteTooLong(int max) {
    return 'Keep the note under $max characters.';
  }

  @override
  String get requestSend => 'Send request';

  @override
  String requestSent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Request sent. $count readers who have it were told.',
      one: 'Request sent. 1 reader who has it was told.',
      zero: 'Request sent. Readers who list it will see it.',
    );
    return '$_temp0';
  }

  @override
  String get requestMine => 'My book requests';

  @override
  String get requestNew => 'New request';

  @override
  String get requestEmptyTitle => 'No requests yet';

  @override
  String get requestEmptyBody =>
      'Ask for a book you can\'t find. Readers who have it will see your request.';

  @override
  String requestUnder(String price) {
    return 'Under $price';
  }

  @override
  String requestMatches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count copies on sale now',
      one: '1 copy on sale now',
      zero: 'No copies on sale yet',
    );
    return '$_temp0';
  }

  @override
  String get requestSeeCopies => 'See copies';

  @override
  String get requestClose => 'Close';

  @override
  String get requestClosed => 'Closed';

  @override
  String get requestClosedDone => 'Request closed.';

  @override
  String get requestWantedTitle => 'Readers want your books';

  @override
  String requestWantedLine(String name, String title) {
    return '$name is looking for $title';
  }

  @override
  String get requestOpenListing => 'Your listing';

  @override
  String get sellBackTitle => 'Sell Back to Waraqah';

  @override
  String get sellBackIntro =>
      'Get an instant price for a book you own. A courier picks it up, we check it, and the money goes to your wallet.';

  @override
  String get sellBackFindLabel => 'Which book?';

  @override
  String get sellBackFindHint => 'Title or author';

  @override
  String get sellBackNoBooks =>
      'No books found. Waraqah buys back printed books from its catalog.';

  @override
  String get sellBackChange => 'Change';

  @override
  String get sellBackCondition => 'Its condition';

  @override
  String sellBackQuote(String price) {
    return 'Waraqah pays $price';
  }

  @override
  String get sellBackQuoteNote =>
      'If our check finds a different condition, the price follows our grade.';

  @override
  String get sellBackAddress => 'Pickup address';

  @override
  String get sellBackAddressHint => 'House, road, area';

  @override
  String sellBackAccept(String price) {
    return 'Accept $price and book a pickup';
  }

  @override
  String get sellBackBooked =>
      'Pickup booked. We\'ll pay into your wallet once we\'ve checked the book.';

  @override
  String get sellBackMine => 'My Sell Backs';

  @override
  String get sellBackEmpty => 'Nothing sold back yet.';

  @override
  String get sellBackStatusScheduled => 'Pickup booked';

  @override
  String get sellBackStatusPickedUp => 'Being checked';

  @override
  String sellBackStatusPaid(String price) {
    return 'Paid $price';
  }

  @override
  String get sellBackStatusReturned => 'Sent back to you';

  @override
  String sellBackQuoted(String price) {
    return 'Quoted $price';
  }

  @override
  String sellBackFrom(String name) {
    return 'Sold by $name';
  }

  @override
  String sellBackReaderSays(String condition) {
    return 'Reader says: $condition';
  }

  @override
  String get sellBackGradeAs => 'Our grade';

  @override
  String sellBackPayAndPublish(String pay, String resell) {
    return 'Pay $pay · sell for $resell';
  }

  @override
  String get sellBackReturn => 'Send it back';

  @override
  String get sellBackGraded => 'Paid, and on sale as Certified Used.';

  @override
  String get sellBackReturned => 'Sent back to the reader.';

  @override
  String get sellBackAdminTitle => 'Trade-ins';

  @override
  String get sellBackAdminHint =>
      'Grade Sell Back books and publish them as Certified Used';

  @override
  String get sellBackAdminEmpty => 'No books waiting to be graded.';

  @override
  String get usedMarketTitle => 'P2P Marketplace';

  @override
  String get usedSearchHint => 'Search second-hand books...';

  @override
  String get usedHandledTitle => 'Let Waraqah handle it';

  @override
  String get usedHandledBody =>
      'Pay in the app and a courier brings the book. Waraqah holds your money until you confirm it\'s as described.';

  @override
  String usedHandledBuy(String price) {
    return 'Buy for $price';
  }

  @override
  String get usedBuyTitle => 'Buy through Waraqah';

  @override
  String get usedBuyBook => 'Book';

  @override
  String get usedBuyDelivery => 'Courier delivery';

  @override
  String get usedBuyTotal => 'You pay';

  @override
  String get usedBuyHeld =>
      'Waraqah holds this until you confirm the book is as described.';

  @override
  String get usedBuyPayWith => 'Pay with';

  @override
  String get usedBuyNoCod =>
      'No cash on delivery: Waraqah holds the money until you confirm.';

  @override
  String usedBuyPay(String price) {
    return 'Pay $price';
  }

  @override
  String get usedBuyUnavailable => 'This book isn\'t on sale any more.';

  @override
  String get usedSaleTitle => 'Handled sale';

  @override
  String usedSaleFrom(String name) {
    return 'From $name';
  }

  @override
  String usedSaleTo(String name) {
    return 'To $name';
  }

  @override
  String get usedSaleStatusPaid => 'Paid';

  @override
  String get usedSaleStatusSent => 'On its way';

  @override
  String get usedSaleStatusCompleted => 'Completed';

  @override
  String get usedSaleStatusDisputed => 'In dispute';

  @override
  String get usedSaleStatusRefunded => 'Refunded';

  @override
  String get usedSaleStatusReleased => 'Paid to the seller';

  @override
  String get usedSaleStatusCancelled => 'Cancelled';

  @override
  String usedSaleHintBuyerPaid(String name, String price) {
    return 'Waraqah is holding $price. $name will hand the book to the courier.';
  }

  @override
  String usedSaleHintSellerPaid(String name, String price) {
    return '$name paid. Hand the book to the courier, then mark it sent. You get $price once they confirm.';
  }

  @override
  String get usedSaleHintBuyerSent =>
      'Check the book when it arrives. Confirm it\'s as described, or report a problem.';

  @override
  String usedSaleHintSellerSent(String name, String price) {
    return 'On its way to $name. Waraqah pays you $price when they confirm.';
  }

  @override
  String get usedSaleHintDisputed =>
      'A moderator is looking at it. The money stays with Waraqah until they decide.';

  @override
  String usedSaleHintBuyerDone(String name) {
    return 'You confirmed it, and $name has been paid.';
  }

  @override
  String usedSaleHintSellerDone(String price) {
    return '$price is yours. It goes out with your next payout.';
  }

  @override
  String usedSaleHintBuyerRefunded(String price) {
    return 'A moderator refunded you: $price is back in your wallet.';
  }

  @override
  String get usedSaleHintSellerRefunded =>
      'A moderator refunded the buyer. The book comes back to you.';

  @override
  String get usedSaleHintBuyerReleased =>
      'A moderator decided for the seller and paid them.';

  @override
  String usedSaleHintSellerReleased(String price) {
    return 'A moderator decided for you: $price is yours.';
  }

  @override
  String get usedSaleHintCancelled =>
      'Cancelled before it was sent. The money went back to the buyer\'s wallet.';

  @override
  String get usedSaleSend => 'Mark as sent';

  @override
  String get usedSaleCancel => 'Cancel and refund';

  @override
  String get usedSaleConfirm => 'It\'s as described';

  @override
  String get usedSaleProblem => 'Report a problem';

  @override
  String get usedSaleFee => 'Waraqah fee (5%)';

  @override
  String get usedSaleYouGet => 'You get';

  @override
  String get usedDisputeTitle => 'What\'s wrong with the book?';

  @override
  String get usedDisputeNotAsDescribed => 'Not as described';

  @override
  String get usedDisputeDamaged => 'Damaged';

  @override
  String get usedDisputePhotocopy => 'It\'s a photocopy';

  @override
  String get usedDisputeWrongBook => 'Wrong book';

  @override
  String get usedDisputeNotReceived => 'It never arrived';

  @override
  String get usedDisputeNoteHint => 'Tell the moderator what happened';

  @override
  String get usedDisputeSend => 'Send to a moderator';

  @override
  String get usedDisputeSent => 'Sent. A moderator will look at it.';

  @override
  String get usedSalesTitle => 'Waraqah-handled sales';

  @override
  String get usedSalesBuying => 'Buying';

  @override
  String get usedSalesSelling => 'Selling';

  @override
  String get usedSalesEmpty =>
      'No handled sales yet. On a used book, choose \"Let Waraqah handle it\".';

  @override
  String get usedEarningsTitle => 'Earnings';

  @override
  String get usedEarningsHeld => 'Held by Waraqah';

  @override
  String get usedEarningsEarned => 'Earned';

  @override
  String get usedEarningsPaidOut => 'Paid out';

  @override
  String get usedEarningsAvailable => 'Ready to pay out';

  @override
  String usedEarningsPayout(String price) {
    return 'Pay $price to my bKash';
  }

  @override
  String usedEarningsPaid(String price) {
    return '$price is on its way to your bKash.';
  }

  @override
  String get usedEarningsPayouts => 'Payouts';

  @override
  String get usedEarningsNoPayouts => 'No payouts yet.';

  @override
  String usedEarningsPayoutLine(String price) {
    return '$price to bKash';
  }

  @override
  String usedDisputeCase(String buyer, String seller) {
    return '$buyer bought from $seller';
  }

  @override
  String usedDisputeHeld(String price) {
    return 'Waraqah holds $price';
  }

  @override
  String get usedDisputeRefund => 'Refund the buyer';

  @override
  String get usedDisputePaySeller => 'Pay the seller';

  @override
  String get moderationLogRefunded => 'Refunded the buyer for';

  @override
  String get moderationLogPaidSeller => 'Paid the seller for';

  @override
  String get usedListingTitle => 'Used copy';

  @override
  String get usedListingMissing => 'This listing isn\'t available.';

  @override
  String get usedStatusAvailable => 'Available';

  @override
  String get usedStatusReserved => 'Reserved';

  @override
  String get usedNegotiable => 'Price negotiable';

  @override
  String get usedFixedPrice => 'Fixed price';

  @override
  String get usedPrefersMeetup => 'Prefers to meet up';

  @override
  String get usedPrefersCourier => 'Prefers courier';

  @override
  String get usedYourListing => 'Your listing';

  @override
  String get usedMessage => 'Message';

  @override
  String get usedOpenChat => 'Open chat';

  @override
  String usedSoldBy(String name, String place) {
    return '$name · $place';
  }

  @override
  String usedSaveVsNew(String amount) {
    return 'Save $amount vs new';
  }

  @override
  String get usedSellerNote => 'From the seller';

  @override
  String usedConditionAndSafety(String condition) {
    return 'Described as $condition. Check the copy before you pay, and meet somewhere public and busy.';
  }

  @override
  String usedOfferWaiting(String amount, String name) {
    return 'Your offer of $amount is waiting for $name.';
  }

  @override
  String get usedOffersAndMessages => 'Offers and messages';

  @override
  String get usedNoOffersYet =>
      'No offers yet. Buyers\' offers and messages show up here and in your inbox.';

  @override
  String get inboxTitle => 'Inbox';

  @override
  String inboxUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new',
      one: '1 new',
      zero: 'All caught up',
    );
    return '$_temp0';
  }

  @override
  String get inboxBuying => 'Buying';

  @override
  String get inboxSelling => 'Selling';

  @override
  String get inboxMissing => 'This conversation isn\'t available.';

  @override
  String get inboxEmptyTitle => 'No offers or messages yet';

  @override
  String get inboxEmptyBody =>
      'When you make an offer on a used book, or someone wants one of yours, the conversation shows up here.';

  @override
  String get inboxBrowse => 'Browse used books';

  @override
  String get chatHint => 'Write a message';

  @override
  String get chatSend => 'Send';

  @override
  String chatYou(String text) {
    return 'You: $text';
  }

  @override
  String chatEventAcceptedByMe(String name, String amount) {
    return 'You accepted $name\'s offer of $amount. The book is reserved for $name.';
  }

  @override
  String chatEventAcceptedByThem(String name, String amount) {
    return '$name accepted your offer of $amount. The book is reserved for you.';
  }

  @override
  String chatEventDeclinedByMe(String name, String amount) {
    return 'You declined $name\'s offer of $amount.';
  }

  @override
  String chatEventDeclinedByThem(String name, String amount) {
    return '$name declined your offer of $amount.';
  }

  @override
  String get chatEventReservedElsewhere =>
      'This book is now reserved for another buyer.';

  @override
  String get chatEventAvailableByMe => 'You made the book available again.';

  @override
  String chatEventAvailableByThem(String name) {
    return '$name made the book available again.';
  }

  @override
  String chatEventSoldByMe(String name) {
    return 'You marked the book as sold to $name.';
  }

  @override
  String chatEventSoldByThem(String name) {
    return '$name marked the book as sold to you.';
  }

  @override
  String get chatEventSoldElsewhere => 'This book was sold to another buyer.';

  @override
  String get chatReservedForYou => 'Reserved for you';

  @override
  String get chatPayOnHandover =>
      'Agree on the time and place here. You pay the seller directly at the handover; Waraqah doesn\'t handle the money.';

  @override
  String chatReservedFor(String name) {
    return 'Reserved for $name';
  }

  @override
  String chatSellerNext(String name) {
    return 'Agree on the handover here. Mark it sold once $name has the book.';
  }

  @override
  String get chatBoughtIt => 'You bought this book';

  @override
  String chatSoldTo(String name) {
    return 'Sold to $name';
  }

  @override
  String get chatSoldElsewhere => 'Sold to another buyer';

  @override
  String get chatReservedElsewhere => 'Reserved for another buyer';

  @override
  String get chatMarkSold => 'Mark as sold';

  @override
  String get chatMakeAvailable => 'Make available';

  @override
  String get chatMarkSoldTitle => 'Mark as sold?';

  @override
  String chatMarkSoldBody(String name) {
    return 'Do this after $name has the book. Other buyers will be told it\'s sold.';
  }

  @override
  String get chatMakeAvailableTitle => 'Make the book available again?';

  @override
  String chatMakeAvailableBody(String name) {
    return '$name\'s reservation ends and other buyers can make offers again.';
  }

  @override
  String get offerMake => 'Make an offer';

  @override
  String offerTo(String name, String amount) {
    return 'To $name · asking $amount';
  }

  @override
  String get offerYourPrice => 'Your price (৳)';

  @override
  String offerFixedPrice(String name, String amount) {
    return '$name\'s price of $amount isn\'t negotiable.';
  }

  @override
  String offerTooHigh(String amount) {
    return 'Offer $amount or less.';
  }

  @override
  String get offerHandover => 'How do you want the book?';

  @override
  String get offerMeetup => 'Meetup';

  @override
  String get offerCourier => 'Courier';

  @override
  String offerSellerPrefers(String name, String method) {
    String _temp0 = intl.Intl.selectLogic(method, {
      'delivery': '$name prefers to send it by courier.',
      'other': '$name prefers to meet up.',
    });
    return '$_temp0';
  }

  @override
  String get offerSend => 'Send offer';

  @override
  String offerSent(String name) {
    return 'Offer sent to $name';
  }

  @override
  String offerCardTitle(String amount) {
    return 'Offer · $amount';
  }

  @override
  String offerWaitingFor(String name) {
    return 'Waiting for $name';
  }

  @override
  String get offerStatusPending => 'Waiting';

  @override
  String get offerStatusAccepted => 'Accepted';

  @override
  String get offerStatusDeclined => 'Declined';

  @override
  String get offerStatusClosed => 'Closed';

  @override
  String get offerAccept => 'Accept';

  @override
  String get offerDecline => 'Decline';

  @override
  String get offerReservedHint =>
      'The book is reserved for another buyer. Make it available again to accept this offer.';

  @override
  String get sellerTitle => 'Reader profile';

  @override
  String get sellerMissing => 'This reader isn\'t on the marketplace.';

  @override
  String sellerMemberSince(String date) {
    return 'Member since $date';
  }

  @override
  String sellerBooksSold(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books sold',
      one: '1 book sold',
      zero: 'No books sold yet',
    );
    return '$_temp0';
  }

  @override
  String sellerRating(String average, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ratings',
      one: '1 rating',
    );
    return '$average · $_temp0';
  }

  @override
  String get sellerNoRatings => 'No ratings yet';

  @override
  String get sellerReviews => 'What people say';

  @override
  String get sellerOnSale => 'On sale now';

  @override
  String get sellerNothingOnSale => 'Nothing on sale right now.';

  @override
  String get sellerSeeProfile => 'See their profile';

  @override
  String chatRateTitle(String name) {
    return 'How was the deal with $name?';
  }

  @override
  String chatRateStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stars',
      one: '1 star',
    );
    return '$_temp0';
  }

  @override
  String get chatRateHint => 'A few words (optional)';

  @override
  String get chatRateSend => 'Send rating';

  @override
  String chatRated(String name) {
    return 'Thanks! It shows on $name\'s profile.';
  }

  @override
  String chatYouRated(String name) {
    return 'You rated $name';
  }

  @override
  String chatTheyRated(String name) {
    return '$name rated you';
  }

  @override
  String chatNotRatedYet(String name) {
    return '$name hasn\'t rated you yet.';
  }
}
