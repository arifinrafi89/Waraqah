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
