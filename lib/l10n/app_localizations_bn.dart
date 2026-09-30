// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppL10nBn extends AppL10n {
  AppL10nBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'ওয়ারাকাহ';

  @override
  String get appTagline => 'পড়ুন। তুলনা করুন। ভাগ করুন। ভাবুন।';

  @override
  String get navHome => 'হোম';

  @override
  String get navCatalog => 'ক্যাটালগ';

  @override
  String get navP2p => 'পিটুপি';

  @override
  String get navBites => 'বাইটস';

  @override
  String get navProfile => 'প্রোফাইল';

  @override
  String get navHomeHint => 'হোম: আজকের আয়াত, নতুন বই ও কাছের বইয়ের লেনদেন';

  @override
  String get navCatalogHint => 'ক্যাটালগ: নতুন বই ঘুরে দেখুন';

  @override
  String get navP2pHint => 'P2P: শিক্ষার্থীদের সাথে পুরোনো বই কেনাবেচা করুন';

  @override
  String get navBitesHint => 'বাইটস: পাঠকদের ছোট বইয়ের রিভিউ ও উদ্ধৃতি';

  @override
  String get navProfileHint => 'প্রোফাইল: আপনার অ্যাকাউন্ট, থিম ও ভাষা';

  @override
  String get navAiHint =>
      'রিডিং অ্যাসিস্ট্যান্ট: যেকোনো বই নিয়ে Gemini-কে জিজ্ঞাসা করুন';

  @override
  String get bitesTitle => 'বুক-বাইটস';

  @override
  String get bitesComposerHint => 'আপনি যা পড়ছেন সে বিষয়ে একটি ভাবনা লিখুন...';

  @override
  String get bitesPost => 'বাইট পোস্ট করুন';

  @override
  String get bitesReply => 'উত্তর দিন';

  @override
  String get bitesRepost => 'আবার পোস্ট করুন';

  @override
  String get bitesLike => 'ভালো লাগা';

  @override
  String get bitesPosted => 'আপনার বাইট ফিডে যোগ হয়েছে।';

  @override
  String get bitesYou => 'আপনি';

  @override
  String get bitesReaderHandle => 'পাঠক';

  @override
  String get authLogIn => 'লগ ইন';

  @override
  String get authSignUp => 'সাইন আপ';

  @override
  String get authEmail => 'ইমেইল';

  @override
  String get authPassword => 'পাসওয়ার্ড';

  @override
  String get authFullName => 'পুরো নাম';

  @override
  String get authStudentId => 'স্টুডেন্ট আইডি';

  @override
  String get authOptional => '(ঐচ্ছিক)';

  @override
  String get authConfirmPassword => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get authForgotPassword => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get authOrContinueWith => 'অথবা চালিয়ে যান';

  @override
  String get authContinueWithGoogle => 'গুগল দিয়ে চালিয়ে যান';

  @override
  String get authCreateAccount => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String get authAgreeTerms => 'আমি সেবার শর্তাবলি ও গোপনীয়তা নীতিতে সম্মত';

  @override
  String get authNewHere => 'ওয়ারাকাহতে নতুন?';

  @override
  String get authHaveAccount => 'ইতিমধ্যে অ্যাকাউন্ট আছে?';

  @override
  String get authEmailHint => 'you@iut-dhaka.edu';

  @override
  String get authNameHint => 'আপনার নাম';

  @override
  String get authStudentIdHint => '২২০০৪১১১৮';

  @override
  String get authContinueAsGuest => 'অতিথি হিসেবে চালিয়ে যান';

  @override
  String get authInvalidEmail => 'একটি সঠিক ইমেইল ঠিকানা লিখুন।';

  @override
  String get authMissingPassword => 'আপনার পাসওয়ার্ড লিখুন।';

  @override
  String get authLogOut => 'লগ আউট';

  @override
  String get authGuestName => 'অতিথি';

  @override
  String get authGuestNote =>
      'বই কিনতে, পুরোনো বই বিক্রি করতে এবং বাইটস পোস্ট করতে লগ ইন করুন।';

  @override
  String get authRoleReader => 'পাঠক';

  @override
  String get authRoleModerator => 'মডারেটর';

  @override
  String get authRoleCatalogManager => 'ক্যাটালগ ম্যানেজার';

  @override
  String get authRoleSupport => 'সাপোর্ট';

  @override
  String get authRoleSuperAdmin => 'অ্যাডমিন';

  @override
  String get homeAyahOfTheDay => 'আজকের আয়াত';

  @override
  String get homeAllBooks => 'সব বই';

  @override
  String get homeBeneficial => 'উপকারী';

  @override
  String get homeNonBeneficial => 'অনুপকারী';

  @override
  String get homeNonBeneficialNote =>
      'এই তালিকার বইগুলো আমাদের অ্যাডমিন বাছাই করেছেন। কোনো বই পাঠকের উপকারে আসবে কি না, তা অনেক সময় তার নিয়ত ও জ্ঞানের ভিত্তির ওপর নির্ভর করে। যেমন, অনেক প্রসিদ্ধ মুফাসসির তাফসিরে বাড়তি প্রেক্ষাপট ও ব্যাখ্যার জন্য তাওরাত ও বাইবেল পড়েছেন। তবে সাধারণ পাঠকের জন্য এ ধরনের বই উপকারী নয়, এবং সতর্ক না হলে ক্ষতিকরও হতে পারে।';

  @override
  String get homeBookBites => 'বুক-বাইটস';

  @override
  String get homeBookBitesSub => 'পাঠকরা যা শেয়ার করছেন';

  @override
  String get homeNewBooks => 'নতুন বই';

  @override
  String get homeNewBooksSub => 'সবচেয়ে কম দাম আগে';

  @override
  String get homeFromStudents => 'আপনার কাছের শিক্ষার্থীদের থেকে';

  @override
  String get homeFromStudentsSub => 'সেকেন্ড-হ্যান্ড · আইইউটি ক্যাম্পাস';

  @override
  String get commonSeeAll => 'সব দেখুন';

  @override
  String get commonSort => 'সাজান';

  @override
  String get commonFilter => 'ফিল্টার';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get commonSomethingWentWrong => 'কিছু ভুল হয়েছে';

  @override
  String get catalogTitle => 'ক্যাটালগ';

  @override
  String catalogSubtitle(String count) {
    return '$count বই';
  }

  @override
  String get catalogSearchHint => 'নাম, লেখক, আইএসবিএন খুঁজুন...';

  @override
  String catalogResults(int count) {
    return '$count টি ফলাফল';
  }

  @override
  String get catalogSortPriceAsc => 'দাম: কম–বেশি';

  @override
  String get catalogCategoryAll => 'সব';

  @override
  String get catalogCategoryIslamic => 'ইসলামিক স্টাডিজ';

  @override
  String get catalogCategoryAcademic => 'একাডেমিক';

  @override
  String get catalogCategoryFiction => 'ফিকশন';

  @override
  String get catalogCategorySelfHelp => 'সেলফ-হেল্প';

  @override
  String get catalogCategoryBusiness => 'ব্যবসা';

  @override
  String get bookFormatPaperback => 'পেপারব্যাক';

  @override
  String get bookFormatHardcover => 'হার্ডকভার';

  @override
  String get bookFormatEbook => 'ই-বুক';

  @override
  String get stockInStock => 'স্টকে আছে';

  @override
  String get stockPreorder => 'প্রি-অর্ডার';

  @override
  String get stockOutOfStock => 'স্টকে নেই';

  @override
  String get bookLanguageBangla => 'বাংলা';

  @override
  String get bookLanguageEnglish => 'ইংরেজি';

  @override
  String get bookLanguageArabic => 'আরবি';

  @override
  String get bookDetailAbout => 'বইটি সম্পর্কে';

  @override
  String bookDetailPages(int count) {
    return '$count পৃষ্ঠা';
  }

  @override
  String get bookDetailReviews => 'রিভিউ';

  @override
  String bookDetailReviewsSub(int count) {
    return '$countটি পাঠক রিভিউ';
  }

  @override
  String get bookDetailNoReviews => 'এই বইটির এখনো কোনো রিভিউ নেই।';

  @override
  String get bookDetailBestPrice => 'শুরু দাম';

  @override
  String get bookDetailAddToCart => 'কার্টে যোগ করুন';

  @override
  String get bookDetailNotFound => 'বইটি খুঁজে পাওয়া যায়নি।';

  @override
  String get bookEditionTitle => 'সংস্করণ বেছে নিন';

  @override
  String bookEditionCount(int count) {
    return '$countটি সংস্করণ';
  }

  @override
  String get bookEditionTranslation => 'অনুবাদ';

  @override
  String bookStockOnlyLeft(int count) {
    return 'মাত্র $countটি বাকি';
  }

  @override
  String get bookInstantDownload => 'সাথে সাথে ডাউনলোড';

  @override
  String bookDeliverTo(String area) {
    return '$area-এ ডেলিভারি';
  }

  @override
  String get bookAreaInsideDhaka => 'ঢাকার ভেতরে';

  @override
  String get bookAreaOutsideDhaka => 'ঢাকার বাইরে';

  @override
  String bookArrivesInDays(int min, int max) {
    return '$min–$max দিনে পৌঁছাবে';
  }

  @override
  String get bookShipsOnRelease => 'প্রকাশের পর পাঠানো হবে';

  @override
  String get bookNotAvailable => 'এখন পাওয়া যাচ্ছে না';

  @override
  String get bookChangeArea => 'পরিবর্তন';

  @override
  String get bookChooseArea => 'কোথায় ডেলিভারি দেব?';

  @override
  String get bookPrice => 'দাম';

  @override
  String get bookBuyNow => 'এখনই কিনুন';

  @override
  String get bookShare => 'শেয়ার';

  @override
  String get bookCopied =>
      'বইয়ের তথ্য কপি হয়েছে। শেয়ার করতে যেকোনো জায়গায় পেস্ট করুন।';

  @override
  String get cartTitle => 'কার্ট';

  @override
  String cartItemCount(int count) {
    return '$countটি বই';
  }

  @override
  String get cartEmptyTitle => 'আপনার কার্ট খালি';

  @override
  String get cartEmptyBody => 'যে বই যোগ করবেন, সেগুলো এখানে দেখাবে।';

  @override
  String get cartBrowse => 'বই দেখুন';

  @override
  String get cartSubtotal => 'সাবটোটাল';

  @override
  String cartYouSave(String amount) {
    return 'আপনার সাশ্রয় $amount';
  }

  @override
  String cartEach(String price) {
    return 'প্রতিটি $price';
  }

  @override
  String get cartDeliveryNote => 'ডেলিভারি চার্জ ও কুপন চেকআউটে যোগ হবে।';

  @override
  String get cartCheckout => 'চেকআউট';

  @override
  String get cartCheckoutSoon => 'চেকআউট শীঘ্রই আসছে।';

  @override
  String get cartAdded => 'কার্টে যোগ হয়েছে';

  @override
  String get cartView => 'কার্ট দেখুন';

  @override
  String get cartLimitReached => 'এটি আর বেশি যোগ করা যাবে না।';

  @override
  String get cartIncrease => 'একটি বাড়ান';

  @override
  String get cartDecrease => 'একটি কমান';

  @override
  String get cartRemove => 'সরিয়ে দিন';

  @override
  String get cartSaveForLater => 'পরে কিনব';

  @override
  String get cartMovedToWishlist => 'উইশলিস্টে সরানো হয়েছে';

  @override
  String get wishlistTitle => 'উইশলিস্ট';

  @override
  String get wishlistMine => 'আমার উইশলিস্ট';

  @override
  String wishlistCount(int count) {
    return '$countটি বই';
  }

  @override
  String get wishlistSave => 'উইশলিস্টে রাখুন';

  @override
  String get wishlistRemove => 'উইশলিস্ট থেকে সরান';

  @override
  String get wishlistSaved => 'উইশলিস্টে রাখা হয়েছে';

  @override
  String get wishlistRemoved => 'উইশলিস্ট থেকে সরানো হয়েছে';

  @override
  String get wishlistView => 'দেখুন';

  @override
  String get wishlistMoveToCart => 'কার্টে নিন';

  @override
  String get wishlistEmptyTitle => 'আপনার উইশলিস্ট খালি';

  @override
  String get wishlistEmptyBody =>
      'যেকোনো বইয়ের হার্টে চাপ দিয়ে পরে কেনার জন্য রেখে দিন।';

  @override
  String get wishlistBrowse => 'বই দেখুন';

  @override
  String get aiTitle => 'রিডিং অ্যাসিস্ট্যান্ট';

  @override
  String get aiSubtitle => 'জেমিনি দ্বারা পরিচালিত';

  @override
  String get aiInputHint => 'যেকোনো বই সম্পর্কে জিজ্ঞাসা করুন...';

  @override
  String get aiPromptBudget => '৫০০ টাকার নিচে বই';

  @override
  String get aiPromptIslamic => 'উপকারী ইসলামিক বই';

  @override
  String get aiPromptExam => 'পরীক্ষার প্রস্তুতিতে সাহায্য করুন';

  @override
  String get aiViewBook => 'বই দেখুন';

  @override
  String get homeAppBarLightMode => 'লাইট মোড';

  @override
  String get homeAppBarDarkMode => 'ডার্ক মোড';

  @override
  String get homeAppBarEnglish => 'English';

  @override
  String get homeAppBarBangla => 'বাংলা';

  @override
  String get profileTitle => 'প্রোফাইল';

  @override
  String get profileAppearance => 'থিম';

  @override
  String get profileThemeLight => 'লাইট';

  @override
  String get profileThemeDark => 'ডার্ক';

  @override
  String get profileThemeSystem => 'সিস্টেম';

  @override
  String get profileLanguage => 'ভাষা';

  @override
  String get profileEnglish => 'English';

  @override
  String get profileBangla => 'বাংলা';

  @override
  String get profileStats => 'আপনার কার্যক্রম';

  @override
  String get profileBooksRead => 'পড়া বই';

  @override
  String get profileBitesPosted => 'পোস্ট করা বাইটস';

  @override
  String get profileListings => 'লিস্টিং';

  @override
  String get comingSoonTitle => 'শীঘ্রই আসছে';

  @override
  String get comingSoonP2p =>
      'সেকেন্ড-হ্যান্ড মার্কেটপ্লেস পরবর্তী ধাপে তৈরি হচ্ছে।';

  @override
  String get comingSoonBites => 'সম্পূর্ণ বুক-বাইটস ফিড সোশ্যাল ফেজে আসছে।';

  @override
  String get adminAreaTitle => 'অ্যাডমিন এরিয়া';

  @override
  String get adminDashboard => 'ড্যাশবোর্ড';

  @override
  String get adminDashboardHint => 'বিক্রি, অর্ডার আর স্টক এক নজরে';

  @override
  String get adminCatalog => 'ক্যাটালগ';

  @override
  String get adminCatalogHint => 'বই, সংস্করণ আর স্টক যোগ ও সম্পাদনা';

  @override
  String get adminOrders => 'অর্ডার';

  @override
  String get adminOrdersHint => 'অর্ডার, রিটার্ন, রিফান্ড আর কুপন';

  @override
  String get adminModeration => 'মডারেশন';

  @override
  String get adminModerationHint => 'পুরোনো বইয়ের লিস্টিং আর রিপোর্ট যাচাই';

  @override
  String get adminComingSoon => 'এই অংশটি তৈরি হচ্ছে। শীঘ্রই আবার দেখুন।';

  @override
  String get moderationCenterTitle => 'মডারেশন সেন্টার';

  @override
  String get moderationTabListings => 'অ্যাপ্রুভালের জন্য লিস্টিং';

  @override
  String get moderationTabReports => 'রিপোর্ট';

  @override
  String get moderationTabDisputes => 'ডিসপিউট';

  @override
  String get moderationEmptyListings => 'অ্যাপ্রুভালের জন্য কোনো লিস্টিং নেই।';

  @override
  String get moderationEmptyReports => 'কোনো পেন্ডিং রিপোর্ট নেই।';

  @override
  String get moderationEmptyDisputes => 'কোনো অ্যাক্টিভ ডিসপিউট নেই।';
}
