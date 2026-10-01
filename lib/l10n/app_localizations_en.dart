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
  String get homeHideAyah => 'Hide Ayah of the Day';

  @override
  String get homeAyahHidden => 'Hidden. Turn it back on in Profile.';

  @override
  String get homeShowAyah => 'Show Ayah of the Day';

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
  String get collectionStripTitle => 'Collections';

  @override
  String get collectionStripSub => 'Books our editors picked, and why';

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
  String get profileHome => 'Home';

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
}
