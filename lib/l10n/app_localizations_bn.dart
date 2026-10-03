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
  String get bitesPost => 'পোস্ট';

  @override
  String get bitesLike => 'ভালো লাগা';

  @override
  String get bitesPosted => 'আপনার বাইট ফিডে যোগ হয়েছে।';

  @override
  String get bitesForYou => 'আপনার জন্য';

  @override
  String get bitesFollowing => 'ফলো করছেন';

  @override
  String get bitesFollowingLogin =>
      'যাদের ফলো করেন তাদের বাইট দেখতে লগ ইন করুন।';

  @override
  String get bitesLogIn => 'লগ ইন';

  @override
  String get bitesEmpty => 'এখানে এখনো কোনো বাইট নেই।';

  @override
  String get bitesFollowingEmpty =>
      'পাঠকদের ফলো করুন, তাদের বাইট এখানে দেখবেন।';

  @override
  String get bitesEdited => 'সম্পাদিত';

  @override
  String get bitesNow => 'এখন';

  @override
  String bitesMinutesAgo(int n) {
    return '$n মি.';
  }

  @override
  String bitesHoursAgo(int n) {
    return '$n ঘ.';
  }

  @override
  String bitesDaysAgo(int n) {
    return '$n দিন';
  }

  @override
  String get bitesComments => 'মন্তব্য';

  @override
  String get bitesShare => 'শেয়ার';

  @override
  String get bitesCopied =>
      'লিংক কপি হয়েছে। যেকোনো জায়গায় পেস্ট করে শেয়ার করুন।';

  @override
  String get bitesMore => 'আরও';

  @override
  String get bitesEdit => 'সম্পাদনা';

  @override
  String get bitesDelete => 'মুছুন';

  @override
  String get bitesDeleteConfirm => 'এই বাইটটি মুছবেন?';

  @override
  String get bitesDeleteBody => 'এর মন্তব্যগুলোও মুছে যাবে।';

  @override
  String get bitesCancel => 'বাতিল';

  @override
  String get bitesDeleted => 'বাইট মুছে ফেলা হয়েছে।';

  @override
  String get bitesMakeQuote => 'উদ্ধৃতি কার্ড বানান';

  @override
  String bitesSpoilerAbout(String title) {
    return '$title নিয়ে স্পয়লার: দেখতে ট্যাপ করুন';
  }

  @override
  String get bitesComposeTitle => 'নতুন বাইট';

  @override
  String get bitesEditTitle => 'বাইট সম্পাদনা';

  @override
  String get bitesTagBook => 'একটি বই ট্যাগ করুন';

  @override
  String get bitesTagHint => 'নাম বা লেখক দিয়ে খুঁজুন';

  @override
  String get bitesRemoveTag => 'ট্যাগ সরান';

  @override
  String get bitesSpoiler => 'স্পয়লার';

  @override
  String get bitesSpoilerHint =>
      'পাঠক ট্যাপ না করা পর্যন্ত ঝাপসা থাকবে। বই ট্যাগ লাগবে।';

  @override
  String get bitesSave => 'সংরক্ষণ';

  @override
  String get bitesSaved => 'বাইট সংরক্ষিত হয়েছে।';

  @override
  String bitesTooLong(int max) {
    return 'বেশি লম্বা: সর্বোচ্চ $max অক্ষর।';
  }

  @override
  String get bitesWrite => 'বাইট লিখুন';

  @override
  String get bitesBite => 'বাইট';

  @override
  String get bitesNoComments => 'এখনো কোনো মন্তব্য নেই। আলাপ শুরু করুন।';

  @override
  String get bitesCommentHint => 'মন্তব্য লিখুন…';

  @override
  String get bitesReply => 'উত্তর দিন';

  @override
  String bitesReplyingTo(String name) {
    return '$name-কে উত্তর দিচ্ছেন';
  }

  @override
  String get bitesCancelReply => 'উত্তর বাতিল';

  @override
  String get bitesLogInToComment => 'মন্তব্য করতে লগ ইন করুন';

  @override
  String get bitesSend => 'পাঠান';

  @override
  String get bitesDeleteComment => 'মন্তব্য মুছুন';

  @override
  String get bitesCommentDeleted => 'মন্তব্য মুছে ফেলা হয়েছে।';

  @override
  String get bitesAboutBook => 'এই বই নিয়ে বাইট';

  @override
  String get bitesPostAboutBook => 'এই বই নিয়ে বাইট পোস্ট করুন';

  @override
  String get bitesNoneAboutBook => 'এই বই নিয়ে এখনো কোনো বাইট নেই।';

  @override
  String get bitesSeeAll => 'সব দেখুন';

  @override
  String get reviewTitle => 'রিভিউ';

  @override
  String reviewSummary(String average, int count) {
    return '$average · $countটি রিভিউ';
  }

  @override
  String get reviewNone => 'এখনো কোনো রিভিউ নেই। প্রথমজন হোন।';

  @override
  String get reviewWrite => 'রিভিউ লিখুন';

  @override
  String get reviewEdit => 'আপনার রিভিউ সম্পাদনা';

  @override
  String get reviewVerified => 'যাচাইকৃত ক্রয়';

  @override
  String get reviewYourRating => 'আপনার রেটিং';

  @override
  String reviewStar(int n) {
    return '৫-এর মধ্যে $n তারা';
  }

  @override
  String get reviewTextHint => 'কেমন লাগল? (ঐচ্ছিক)';

  @override
  String get reviewSave => 'রিভিউ সংরক্ষণ';

  @override
  String get reviewSaved => 'রিভিউ সংরক্ষিত হয়েছে।';

  @override
  String get reviewDelete => 'মুছুন';

  @override
  String get reviewDeleteConfirm => 'আপনার রিভিউ মুছবেন?';

  @override
  String get reviewDeleted => 'রিভিউ মুছে ফেলা হয়েছে।';

  @override
  String get reviewCancel => 'বাতিল';

  @override
  String get reviewMore => 'আরও';

  @override
  String get reviewYou => 'আপনি';

  @override
  String get reviewEdited => 'সম্পাদিত';

  @override
  String get readerTitle => 'পাঠক';

  @override
  String readerMemberSince(String date) {
    return 'সদস্য $date থেকে';
  }

  @override
  String readerFollowers(int count) {
    return '$count জন ফলোয়ার';
  }

  @override
  String readerFollowingCount(int count) {
    return '$count জনকে ফলো করছেন';
  }

  @override
  String get readerFollow => 'ফলো করুন';

  @override
  String get readerFollowing => 'ফলো করছেন';

  @override
  String readerSeeBooks(int count) {
    return 'তাদের বিক্রির বই দেখুন ($count)';
  }

  @override
  String get readerBites => 'বাইট';

  @override
  String get readerNoBites => 'এখনো কোনো বাইট নেই।';

  @override
  String get readerPrivate => 'এই পাঠক তাদের প্রোফাইল গোপন রাখেন।';

  @override
  String get readerSeeBites => 'তাদের বাইট দেখুন';

  @override
  String get readerYourPage => 'আপনার পাঠক পাতা';

  @override
  String get quoteTitle => 'উদ্ধৃতি কার্ড';

  @override
  String get quoteHint => 'ভালো লাগা একটি লাইন লিখুন';

  @override
  String get quoteStyle => 'স্টাইল';

  @override
  String get quoteStylePaper => 'কাগজ';

  @override
  String get quoteStyleInk => 'কালি';

  @override
  String get quoteStyleLeaf => 'পাতা';

  @override
  String get quoteStyleCover => 'প্রচ্ছদ';

  @override
  String get quoteShare => 'ছবি শেয়ার করুন';

  @override
  String get quoteMark => 'ওয়ারাকাহ';

  @override
  String get bitesYou => 'আপনি';

  @override
  String get authLogIn => 'লগ ইন';

  @override
  String get authSignUp => 'সাইন আপ';

  @override
  String get authEmail => 'ইমেইল';

  @override
  String get authEmailOrPhone => 'ইমেইল বা ফোন';

  @override
  String get authEmailOrPhoneHint => 'you@example.com বা ০১XXXXXXXXX';

  @override
  String get authMobileNumber => 'মোবাইল নম্বর';

  @override
  String get authMobileNumberHint => '০১XXXXXXXXX';

  @override
  String get authPassword => 'পাসওয়ার্ড';

  @override
  String get authFullName => 'পুরো নাম';

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
  String get authEmailHint => 'you@example.com';

  @override
  String get authNameHint => 'আপনার নাম';

  @override
  String get authContinueAsGuest => 'অতিথি হিসেবে চালিয়ে যান';

  @override
  String get authInvalidEmail => 'একটি সঠিক ইমেইল ঠিকানা লিখুন।';

  @override
  String get authMissingPassword => 'আপনার পাসওয়ার্ড লিখুন।';

  @override
  String get authOtpTitle => 'আপনার যোগাযোগ যাচাই করুন';

  @override
  String authOtpMessage(Object contact) {
    return '$contact-এ পাঠানো ৬ সংখ্যার কোড লিখুন।';
  }

  @override
  String get authOtpHint => '৬ সংখ্যার OTP';

  @override
  String get authVerifyOtp => 'OTP যাচাই করুন';

  @override
  String get authOtpDemoNote => 'ডেমো কোড: ১২৩৪৫৬';

  @override
  String get authOtpInvalid => '৬ সংখ্যার OTP লিখুন।';

  @override
  String get authWrongCode => 'ভুল কোড। আবার চেষ্টা করুন।';

  @override
  String get authInvalidMobileNumber =>
      'একটি সঠিক বাংলাদেশি মোবাইল নম্বর লিখুন।';

  @override
  String get authForgotTitle => 'পাসওয়ার্ড রিসেট করুন';

  @override
  String get authForgotMessage =>
      'আপনার মোবাইল নম্বর লিখুন, আমরা একটি যাচাইকরণ কোড পাঠাব।';

  @override
  String get authSendOtp => 'OTP পাঠান';

  @override
  String get authResetPassword => 'পাসওয়ার্ড রিসেট করুন';

  @override
  String get authPasswordReset =>
      'পাসওয়ার্ড রিসেট হয়েছে। এখন লগ ইন করতে পারেন।';

  @override
  String get authBackToLogin => 'লগ ইনে ফিরে যান';

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
  String get homeHideAyah => 'আজকের আয়াত লুকান';

  @override
  String get homeAyahHidden => 'লুকানো হয়েছে। প্রোফাইল থেকে আবার চালু করুন।';

  @override
  String get homeShowAyah => 'আজকের আয়াত দেখান';

  @override
  String get homeSettingsTitle => 'হোম';

  @override
  String get commonUndo => 'আগের অবস্থায় ফেরান';

  @override
  String get homeBookBites => 'বুক-বাইটস';

  @override
  String get homeBookBitesSub => 'পাঠকরা যা শেয়ার করছেন';

  @override
  String get homeNewArrivals => 'নতুন এসেছে';

  @override
  String get homeNewArrivalsSub => 'ওয়ারাকাহ-তে সদ্য যোগ হয়েছে';

  @override
  String get homeBestsellers => 'বেস্টসেলার';

  @override
  String get homeBestsellersSub => 'গত ৩০ দিনে সবচেয়ে বেশি কেনা';

  @override
  String get homeSeasonRamadan => 'রমজান';

  @override
  String get homeSeasonBoiMela => 'বইমেলা';

  @override
  String get homeSeasonAdmission => 'ভর্তি মৌসুম';

  @override
  String get homeSeasonBackToSchool => 'স্কুলে ফেরা';

  @override
  String get homeFromStudents => 'পাঠকদের পুরোনো বই';

  @override
  String get homeFromStudentsSub => 'সেকেন্ড-হ্যান্ড · আইইউটি ক্যাম্পাস';

  @override
  String get commonSeeAll => 'সব দেখুন';

  @override
  String get commonFilter => 'ফিল্টার';

  @override
  String get commonNotFound => 'পাওয়া যায়নি';

  @override
  String get commonBack => 'ফিরে যান';

  @override
  String get authorEmpty => 'এই লেখকের কোনো বই এখনো নেই।';

  @override
  String get publisherEmpty => 'এই প্রকাশনীর কোনো বই এখনো নেই।';

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
  String get searchFieldHint => 'বই খুঁজুন';

  @override
  String get searchHint => 'নাম, লেখক, প্রকাশনী বা আইএসবিএন দিয়ে খুঁজুন';

  @override
  String searchNoResults(String query) {
    return '\'$query\' নামে কোনো বই পাওয়া যায়নি';
  }

  @override
  String get searchRecent => 'সাম্প্রতিক অনুসন্ধান';

  @override
  String get searchRecentClear => 'সব মুছুন';

  @override
  String searchRecentRemove(String query) {
    return '\'$query\' মুছুন';
  }

  @override
  String searchDidYouMean(String title) {
    return 'আপনি কি $title খুঁজছেন?';
  }

  @override
  String get searchRequestBook => 'এই বইটি অনুরোধ করুন';

  @override
  String get searchRequestBookSoon => 'পছন্দের বই আনার অনুরোধ শীঘ্রই আসছে।';

  @override
  String get searchSort => 'সাজান';

  @override
  String get searchSortRelevance => 'প্রাসঙ্গিকতা';

  @override
  String get searchSortPriceLow => 'দাম: কম থেকে বেশি';

  @override
  String get searchSortPriceHigh => 'দাম: বেশি থেকে কম';

  @override
  String get searchSortNewest => 'নতুন';

  @override
  String get searchSortBestselling => 'সবচেয়ে বেশি বিক্রিত';

  @override
  String get searchFilter => 'ফিল্টার';

  @override
  String get searchFilterReset => 'রিসেট';

  @override
  String get searchFilterSection => 'বিভাগ';

  @override
  String get searchFilterPrice => 'দাম';

  @override
  String get searchFilterFormat => 'ধরন';

  @override
  String get searchFilterLanguage => 'ভাষা';

  @override
  String get searchFilterRating => 'ন্যূনতম রেটিং';

  @override
  String get searchFilterAny => 'যেকোনো';

  @override
  String get searchFilterInStock => 'শুধু স্টকে আছে';

  @override
  String searchFilterShow(int count) {
    return '$count টি বই দেখুন';
  }

  @override
  String get searchPriceUnder300 => '৳৩০০-এর কম';

  @override
  String get searchPrice300to600 => '৳৩০০–৬০০';

  @override
  String get searchPrice600to1000 => '৳৬০০–১,০০০';

  @override
  String get searchPriceOver1000 => '৳১,০০০-এর বেশি';

  @override
  String get searchRating3 => '৩★+';

  @override
  String get searchRating4 => '৪★+';

  @override
  String get searchRating45 => '৪.৫★+';

  @override
  String get catalogBrowseSections => 'বিভাগ অনুযায়ী দেখুন';

  @override
  String get sectionAcademic => 'একাডেমিক';

  @override
  String get sectionReligious => 'ধর্মীয়';

  @override
  String get sectionLiterature => 'সাহিত্য';

  @override
  String get sectionAdmissionJobPrep => 'ভর্তি ও চাকরির প্রস্তুতি';

  @override
  String get sectionSchoolCollege => 'স্কুল ও কলেজ';

  @override
  String get sectionNonFiction => 'নন-ফিকশন';

  @override
  String get sectionSkillsTech => 'দক্ষতা ও প্রযুক্তি';

  @override
  String get sectionChildren => 'শিশু-কিশোর';

  @override
  String sectionBookCount(int count) {
    return '$countটি বই';
  }

  @override
  String get categoryEmpty => 'এই ক্যাটাগরিতে এখনো কোনো বই নেই।';

  @override
  String get sectionEmpty => 'এই বিভাগে এখনো কোনো বই নেই।';

  @override
  String get sectionClassRow => 'শ্রেণি';

  @override
  String get sectionExamRow => 'পরীক্ষা';

  @override
  String get sectionSubjectRow => 'বিষয়';

  @override
  String sectionClassChip(int n) {
    return 'শ্রেণি $n';
  }

  @override
  String get sectionExamSsc => 'এসএসসি';

  @override
  String get sectionExamHsc => 'এইচএসসি';

  @override
  String get sectionExamAdmission => 'ভর্তি';

  @override
  String get sectionExamBcs => 'বিসিএস';

  @override
  String get sectionFilterEmpty => 'এই বাছাইয়ে এখনো কোনো বই নেই।';

  @override
  String get sectionClearFilters => 'ফিল্টার মুছুন';

  @override
  String get collectionStripTitle => 'সংকলন';

  @override
  String get collectionStripSub => 'সম্পাদকদের বাছাই করা বই, আর কেন';

  @override
  String get expertPicksTitle => 'বিশেষজ্ঞদের বাছাই';

  @override
  String get expertPicksSub => 'যাচাই করা শিক্ষক, আলেম ও লেখকদের বাছাই করা বই';

  @override
  String expertBy(String name) {
    return '$name-এর বাছাই';
  }

  @override
  String expertPickedBy(String name) {
    return 'বাছাই করেছেন $name';
  }

  @override
  String get expertVerified => 'যাচাইকৃত';

  @override
  String get expertKindTeacher => 'শিক্ষক';

  @override
  String get expertKindScholar => 'আলেম';

  @override
  String get expertKindWriter => 'লেখক';

  @override
  String get expertTheirPicks => 'তাঁর বাছাই';

  @override
  String get booklistKindClassList => 'ক্লাসের বইয়ের তালিকা';

  @override
  String get booklistKindExamPrep => 'পরীক্ষার প্রস্তুতি';

  @override
  String get booklistKindBookClub => 'বুক ক্লাব';

  @override
  String get booklistKindPersonal => 'আমার তালিকা';

  @override
  String get booklistPickerTitle => 'বই যোগ করুন';

  @override
  String get booklistPickerDone => 'হয়েছে';

  @override
  String get booklistPickerEmpty => 'কোনো বই মেলেনি।';

  @override
  String get booklistTitle => 'বুকলিস্ট';

  @override
  String get booklistEntrySub =>
      'ক্লাসের তালিকা, পরীক্ষার প্রস্তুতি, বুক ক্লাব আর নিজের তালিকা';

  @override
  String get booklistProfileLink => 'আমার বুকলিস্ট';

  @override
  String get booklistMine => 'আমার তালিকা';

  @override
  String get booklistNew => 'নতুন তালিকা';

  @override
  String get booklistMineEmpty =>
      'এখনো কোনো তালিকা নেই। একসাথে কিনতে চান এমন বইয়ের তালিকা বানান।';

  @override
  String get booklistGuestHint => 'নিজের তালিকা বানাতে লগ ইন করুন।';

  @override
  String get booklistGroupClassLists => 'ক্লাসের বইয়ের তালিকা';

  @override
  String booklistNewTotal(int count, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'নতুন: $countটি বই $price',
    );
    return '$_temp0';
  }

  @override
  String get booklistPriceNew => 'নতুন';

  @override
  String get booklistPriceCertified => 'সার্টিফায়েড ব্যবহৃত';

  @override
  String get booklistPriceUsed => 'ব্যবহৃত';

  @override
  String get booklistAddAll => 'পুরো তালিকা কার্টে যোগ করুন';

  @override
  String booklistAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বই যোগ হয়েছে',
      zero: 'কিছু যোগ হয়নি',
    );
    return '$_temp0';
  }

  @override
  String booklistOutOfStock(int count) {
    return '$countটি স্টকে নেই';
  }

  @override
  String get booklistAddBooks => 'বই যোগ করুন';

  @override
  String get booklistRemoveBook => 'তালিকা থেকে সরান';

  @override
  String get booklistEmpty => 'এই তালিকায় এখনো কোনো বই নেই।';

  @override
  String get booklistRename => 'নাম বদলান';

  @override
  String get booklistDelete => 'তালিকা মুছুন';

  @override
  String get booklistDeleteConfirm => 'এই তালিকা মুছবেন?';

  @override
  String get booklistDeleted => 'তালিকা মুছে ফেলা হয়েছে';

  @override
  String get booklistNameHint => 'তালিকার নাম';

  @override
  String get booklistCancel => 'বাতিল';

  @override
  String get booklistSave => 'সেভ করুন';

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
  String get bookConditionLikeNew => 'প্রায় নতুন';

  @override
  String get bookConditionVeryGood => 'খুব ভালো';

  @override
  String get bookConditionGood => 'ভালো';

  @override
  String get bookConditionAcceptable => 'চলনসই';

  @override
  String get bookOtherWays => 'আরও যেভাবে কেনা যায়';

  @override
  String get bookCertifiedNote => 'ওয়ারাকাহ যাচাই ও পরিষ্কার করেছে';

  @override
  String get bookAddUsedToCart => 'ব্যবহৃত কপি কার্টে যোগ করুন';

  @override
  String get bookFromReaders => 'পাঠকদের কাছ থেকে';

  @override
  String bookListingCount(int count) {
    return '$countটি লিস্টিং';
  }

  @override
  String bookFromPrice(String price) {
    return '$price থেকে';
  }

  @override
  String bookResellsFor(String amount) {
    return 'পড়া শেষ? এমন কপি ওয়ারাকাহতে সাধারণত প্রায় $amount-এ আবার বিক্রি হয়।';
  }

  @override
  String get bookReaderSaleNote =>
      'বিক্রেতাকে দামের প্রস্তাব দিন এবং দেখা করা বা কুরিয়ারে পাঠানো ঠিক করুন। টাকা সরাসরি বিক্রেতাকে দেবেন।';

  @override
  String get bookLookInside => 'ভেতরে দেখুন';

  @override
  String get bookLookInsideNone => 'এই বইয়ের জন্য এখনো দেখানোর কিছু নেই।';

  @override
  String get bookContents => 'সূচিপত্র';

  @override
  String get bookSamplePages => 'নমুনা পাতা';

  @override
  String bookPageOf(int page, int total) {
    return '$totalটির মধ্যে $page নম্বর পাতা';
  }

  @override
  String get bookSwipeForMore => 'আরও দেখতে সোয়াইপ করুন';

  @override
  String get bookSampleEnds => 'নমুনা এখানেই শেষ';

  @override
  String bookSeriesPosition(int position, int total) {
    return '$totalটির মধ্যে $position নম্বর বই';
  }

  @override
  String get seriesOpen => 'সিরিজ দেখুন';

  @override
  String get bookSeriesNotYet => 'এখনো স্টোরে নেই';

  @override
  String get bookSeriesNotYetLong => 'এই বইটি এখনো ওয়ারাকাহতে বিক্রি হয় না।';

  @override
  String get bookQuestionsTitle => 'প্রশ্ন ও উত্তর';

  @override
  String bookQuestionsCount(int count) {
    return '$countটি প্রশ্ন';
  }

  @override
  String get bookQuestionsEmpty =>
      'এখনো কোনো প্রশ্ন নেই। প্রথম প্রশ্নটি আপনিই করুন।';

  @override
  String get bookAskQuestion => 'প্রশ্ন করুন';

  @override
  String get bookQuestionHint => 'এই বই সম্পর্কে কী জানতে চান?';

  @override
  String get bookAnswerHint => 'আপনি যা জানেন লিখুন';

  @override
  String get bookAnswer => 'উত্তর দিন';

  @override
  String get bookNoAnswerYet => 'এখনো কোনো উত্তর নেই';

  @override
  String get bookFromWaraqah => 'ওয়ারাকাহ';

  @override
  String get bookPost => 'পোস্ট করুন';

  @override
  String get bookPostTooShort => 'লেখাটি খুব ছোট। আরও কয়েকটি শব্দ লিখুন।';

  @override
  String get bookPostTooLong => 'লেখাটি অনেক বড়। একটু ছোট করুন।';

  @override
  String get bookQuestionPosted =>
      'প্রশ্ন পোস্ট হয়েছে। পাঠক ও ওয়ারাকাহ উত্তর দিতে পারবে।';

  @override
  String get bookAnswerPosted => 'উত্তর পোস্ট হয়েছে';

  @override
  String get bookLowest30Days => '৩০ দিনে সর্বনিম্ন';

  @override
  String get alertMine => 'আমার অ্যালার্ট';

  @override
  String get alertNotifyMe => 'জানাবেন';

  @override
  String get alertStockOn => 'ফিরে এলে জানাব · বন্ধ করতে চাপুন';

  @override
  String get alertStockSet => 'বইটি ফিরে এলে আপনাকে জানাব।';

  @override
  String get alertTurnedOff => 'অ্যালার্ট বন্ধ হয়েছে';

  @override
  String get alertTurnOff => 'অ্যালার্ট বন্ধ করুন';

  @override
  String get alertPriceTitle => 'দাম কমার অ্যালার্ট';

  @override
  String alertPriceToday(String price) {
    return 'আজকের দাম $price।';
  }

  @override
  String alertPriceWhen(String price) {
    return '$price বা কম হলে জানাবেন';
  }

  @override
  String get alertSet => 'অ্যালার্ট দিন';

  @override
  String get alertPriceSet => 'দাম কমলে আপনাকে জানাব।';

  @override
  String get alertBackNow => 'এখন স্টকে আছে';

  @override
  String get alertWaitingStock => 'স্টকে ফেরার অপেক্ষায়';

  @override
  String alertPriceDropped(String price) {
    return 'দাম কমে $price হয়েছে';
  }

  @override
  String alertWaitingPrice(String target, String price) {
    return '$target-এ অ্যালার্ট · এখন $price';
  }

  @override
  String get alertEmpty =>
      'এখনো কোনো অ্যালার্ট নেই। স্টকে না থাকা বইয়ে \'জানাবেন\' বা উইশলিস্টের বইয়ে ঘণ্টায় চাপ দিন।';

  @override
  String get dealTitle => 'ডিল';

  @override
  String get dealFlashSale => 'ফ্ল্যাশ সেল';

  @override
  String get dealFlashEndsIn => 'ফ্ল্যাশ সেল শেষ হবে';

  @override
  String get dealSeeAll => 'ডিল দেখুন';

  @override
  String get dealBundles => 'বান্ডেল';

  @override
  String get dealInBundle => 'বান্ডেলে কিনুন';

  @override
  String get dealAddBundle => 'বান্ডেল কার্টে যোগ করুন';

  @override
  String get dealPreorders => 'শীঘ্রই আসছে · প্রি-অর্ডার';

  @override
  String dealReleases(String date) {
    return 'প্রকাশ $date · প্রকাশের দিন পাঠানো হবে';
  }

  @override
  String get dealPreorderNow => 'প্রি-অর্ডার করুন';

  @override
  String get pointsTitle => 'ওয়ারাকাহ পয়েন্ট';

  @override
  String pointsBalance(int count) {
    return '$count পয়েন্ট';
  }

  @override
  String get pointsRuleEarn =>
      'বইয়ের জন্য প্রতি ৳১০০ পরিশোধে ১ পয়েন্ট পাবেন।';

  @override
  String get pointsRuleSpend =>
      'চেকআউটে ব্যবহার করুন: ১ পয়েন্ট = ৳১ ছাড়, ৫০ পয়েন্ট হলে, বইয়ের দামের সর্বোচ্চ ২০% পর্যন্ত।';

  @override
  String get pointsRuleCancel => 'অর্ডার বাতিল করলে ব্যবহৃত পয়েন্ট ফেরত আসে।';

  @override
  String get pointsHistory => 'ইতিহাস';

  @override
  String get pointsWelcome => 'স্বাগত বোনাস';

  @override
  String pointsEarnedOn(String order) {
    return '$order অর্ডারে পাওয়া';
  }

  @override
  String pointsSpentOn(String order) {
    return '$order অর্ডারে ব্যবহার';
  }

  @override
  String pointsRefunded(String order) {
    return 'ফেরত · $order বাতিল';
  }

  @override
  String pointsReversed(String order) {
    return 'কেটে নেওয়া · $order বাতিল';
  }

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
  String get cartCertifiedUsed => 'সার্টিফায়েড ব্যবহৃত';

  @override
  String get cartFromReader => 'পাঠকের কাছ থেকে';

  @override
  String get cartNewBooks => 'নতুন বই';

  @override
  String get cartUsedBooks => 'পুরোনো বই';

  @override
  String get cartBundle => 'বান্ডেল';

  @override
  String get cartSmartBasket => 'স্মার্ট বাস্কেট';

  @override
  String cartUsedAvailable(int count, String amount) {
    return '$countটি বই পুরোনো পাওয়া যাচ্ছে, সাশ্রয় $amount';
  }

  @override
  String get cartSwitch => 'বদলান';

  @override
  String get cartSwitchAll => 'সবগুলো পুরোনোতে বদলান';

  @override
  String cartSwapped(String amount) {
    return 'পুরোনো কপিতে বদলানো হয়েছে · সাশ্রয় $amount';
  }

  @override
  String cartToFreeDelivery(String amount) {
    return 'আরও $amount যোগ করলে ফ্রি ডেলিভারি';
  }

  @override
  String get cartSetBudget => 'বাজেট দিন';

  @override
  String get cartBudgetTitle => 'বাজেটের মধ্যে রাখুন';

  @override
  String get cartBudgetLabel => 'আপনার বাজেট (টাকায়)';

  @override
  String cartBudgetFits(String total, int count) {
    return '$countটি পুরোনো কপিতে বাজেটে আসে: $total';
  }

  @override
  String cartBudgetShort(String total) {
    return 'সবচেয়ে কম খরচ $total, তবুও বাজেটের বেশি।';
  }

  @override
  String get cartBudgetApply => 'প্রয়োগ করুন';

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
  String get wishlistShare => 'উইশলিস্ট শেয়ার করুন';

  @override
  String get wishlistShareTitle => 'আপনার উইশলিস্ট শেয়ার করুন';

  @override
  String get wishlistShareBody =>
      'লিংকটি যার কাছে থাকবে, সে আপনার উইশলিস্টের বই দেখতে পারবে আর উপহার হিসেবে একটি কিনে দিতে পারবে। তালিকা বদলাতে পারবে না।';

  @override
  String get wishlistCopyLink => 'লিংক কপি করুন';

  @override
  String get wishlistLinkCopied => 'লিংক কপি হয়েছে';

  @override
  String get wishlistPreview => 'বন্ধুরা যেভাবে দেখবে';

  @override
  String wishlistSharedTitle(String name) {
    return '$name-এর উইশলিস্ট';
  }

  @override
  String wishlistSharedGiftHint(String name) {
    return '$name-কে কিনে দেবেন? কার্টে যোগ করুন, আর চেকআউটে \"উপহার হিসেবে পাঠান\" চালু করুন।';
  }

  @override
  String get wishlistSharedMissing => 'এই উইশলিস্ট আর শেয়ার করা নেই।';

  @override
  String get checkoutTitle => 'চেকআউট';

  @override
  String get checkoutStepAddress => 'ডেলিভারির ঠিকানা';

  @override
  String get checkoutStepDelivery => 'ডেলিভারি';

  @override
  String get checkoutStepPayment => 'পেমেন্ট';

  @override
  String get checkoutPayBkash => 'বিকাশ';

  @override
  String get checkoutPayNagad => 'নগদ';

  @override
  String get checkoutPayCod => 'ক্যাশ অন ডেলিভারি';

  @override
  String get checkoutPayCard => 'কার্ড';

  @override
  String get checkoutPayBkashNote => 'আপনার বিকাশ অ্যাকাউন্ট থেকে পরিশোধ করুন';

  @override
  String get checkoutPayNagadNote => 'আপনার নগদ অ্যাকাউন্ট থেকে পরিশোধ করুন';

  @override
  String get checkoutPayCodNote => 'বই হাতে পেয়ে নগদে পরিশোধ করুন';

  @override
  String get checkoutPayCardNote => 'ভিসা, মাস্টারকার্ড বা অ্যামেক্স';

  @override
  String get checkoutCodUnavailable => 'শুধু ই-বুকের অর্ডারে প্রযোজ্য নয়';

  @override
  String get checkoutDemoNote =>
      'আপাতত পেমেন্ট শুধু ডেমো; কোনো টাকা কাটা হবে না।';

  @override
  String get checkoutEbooksOnly => 'পরিশোধের সাথে সাথেই ই-বুক পড়া যাবে';

  @override
  String get checkoutFreeDelivery => 'ফ্রি ডেলিভারি';

  @override
  String checkoutDeliveryFeeIs(String amount) {
    return 'ডেলিভারি চার্জ $amount';
  }

  @override
  String checkoutFreeDeliveryFrom(String amount) {
    return '$amount বা তার বেশি অর্ডারে ফ্রি ডেলিভারি';
  }

  @override
  String get checkoutCouponHint => 'কুপন কোড';

  @override
  String get checkoutApply => 'প্রয়োগ';

  @override
  String get checkoutCouponNotFound => 'এই কোডটি পাওয়া যায়নি।';

  @override
  String get checkoutCouponExpired => 'এই কোডের মেয়াদ শেষ হয়ে গেছে।';

  @override
  String checkoutCouponMinimum(String amount) {
    return 'এই কোডের জন্য কমপক্ষে $amount অর্ডার লাগবে।';
  }

  @override
  String checkoutCouponApplied(String code) {
    return '$code প্রয়োগ হয়েছে';
  }

  @override
  String get checkoutRemoveCoupon => 'কুপন সরান';

  @override
  String checkoutItems(int count) {
    return '$countটি বই';
  }

  @override
  String get checkoutDeliveryFee => 'ডেলিভারি চার্জ';

  @override
  String get checkoutFree => 'ফ্রি';

  @override
  String get checkoutCouponDiscount => 'কুপন ছাড়';

  @override
  String get checkoutTotal => 'মোট';

  @override
  String get checkoutPlaceOrder => 'অর্ডার করুন';

  @override
  String checkoutUsePoints(int count) {
    return '$count পয়েন্ট ব্যবহার করুন';
  }

  @override
  String checkoutPointsSave(String amount, int balance) {
    return '$amount ছাড় · আপনার আছে $balance';
  }

  @override
  String checkoutPointsNotYet(int balance) {
    return 'আপনার $balance পয়েন্ট আছে। ৫০ পয়েন্ট হলে ব্যবহার করতে পারবেন।';
  }

  @override
  String get checkoutPointsDiscount => 'পয়েন্ট';

  @override
  String get checkoutGiftTitle => 'উপহার হিসেবে পাঠান';

  @override
  String get checkoutGiftNote =>
      'উপরের ঠিকানায় যাবে, আপনার কার্ডসহ, দাম ছাড়া।';

  @override
  String get checkoutGiftRecipient => 'কার জন্য?';

  @override
  String get checkoutGiftRecipientHint => 'কার্ডে লেখার জন্য তার নাম';

  @override
  String get checkoutGiftMessage => 'কার্ডের বার্তা (ঐচ্ছিক)';

  @override
  String get checkoutGiftWrap => 'গিফট র‍্যাপ';

  @override
  String orderGiftFor(String name) {
    return '$name-এর জন্য উপহার';
  }

  @override
  String get orderGiftWrapped => 'গিফট র‍্যাপ করা';

  @override
  String orderPlacedGiftFor(String name) {
    return 'এটি $name-এর জন্য উপহার: আমরা আপনার কার্ড দেব, দাম লিখব না।';
  }

  @override
  String get adminOrderGiftPack => 'কার্ড দিন, দাম লিখবেন না।';

  @override
  String get adminOrderGiftWrap => 'র‍্যাপ করুন, কার্ড দিন, দাম লিখবেন না।';

  @override
  String get giftDonateTitle => 'বই দান করুন';

  @override
  String get giftDonateIntro =>
      'এখানের প্রতিটি প্রতিষ্ঠান ওয়ারাকাহ যাচাই করেছে। তাদের দরকারি একটি বই বেছে নিন, আমরা আপনার নোটসহ বিনা খরচে পৌঁছে দেব।';

  @override
  String get giftDonateVerified => 'যাচাইকৃত';

  @override
  String giftDonateKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'library': 'পাঠাগার',
      'school': 'স্কুল',
      'madrasa': 'মাদ্রাসা',
      'orphanage': 'এতিমখানা',
      'other': 'প্রতিষ্ঠান',
    });
    return '$_temp0';
  }

  @override
  String giftDonateProgress(int received, int wanted) {
    return '$wantedটির মধ্যে $receivedটি বই পেয়েছে';
  }

  @override
  String get giftDonateNeeds => 'তাদের যে বই দরকার';

  @override
  String giftDonateNeedProgress(int received, int wanted) {
    return '$wantedটির মধ্যে $receivedটি পেয়েছে';
  }

  @override
  String giftDonatePerCopy(String amount) {
    return 'প্রতি কপি $amount';
  }

  @override
  String get giftDonateAction => 'দান করুন';

  @override
  String get giftDonateMet => 'সব পেয়ে গেছে';

  @override
  String giftDonateFreeDelivery(String name) {
    return '$name-এ বিনা খরচে পৌঁছে দেওয়া হবে';
  }

  @override
  String get giftDonateHowMany => 'কয় কপি?';

  @override
  String get giftDonateFewer => 'এক কপি কম';

  @override
  String get giftDonateMore => 'এক কপি বেশি';

  @override
  String get giftDonateNote => 'তাদের জন্য একটি নোট (ঐচ্ছিক)';

  @override
  String giftDonateConfirm(String amount) {
    return '$amount দান করুন';
  }

  @override
  String giftDonateThanks(String name) {
    return 'ধন্যবাদ! আপনার বই $name-এর পথে।';
  }

  @override
  String get giftDonateMissing => 'প্রতিষ্ঠানটি খুঁজে পাওয়া যায়নি।';

  @override
  String orderDonationTo(String name) {
    return '$name-কে দান';
  }

  @override
  String get walletTitle => 'ওয়ালেট';

  @override
  String get walletRuleIn =>
      'বাতিল বা ফেরত দেওয়া অর্ডারের টাকা, আর ওয়ারাকাহকে বিক্রি করা বইয়ের টাকা এখানে জমা হয়।';

  @override
  String get walletRuleSpend =>
      'চেকআউটে নগদ টাকার মতো ব্যবহার করুন, বই আর ডেলিভারি দুটোতেই।';

  @override
  String get walletHistory => 'ইতিহাস';

  @override
  String walletCancelRefund(String order) {
    return 'বাতিল $order-এর রিফান্ড';
  }

  @override
  String walletReturnRefund(String order) {
    return 'ফেরত $order-এর রিফান্ড';
  }

  @override
  String walletSellBack(String book) {
    return 'সেল ব্যাক: $book';
  }

  @override
  String walletSpentOn(String order) {
    return '$order-এ ব্যবহার';
  }

  @override
  String walletUseAtCheckout(String amount) {
    return 'ওয়ালেট থেকে $amount দিন';
  }

  @override
  String walletYouHave(String amount) {
    return 'আপনার আছে $amount';
  }

  @override
  String get orderRefundedToWallet => 'আপনার ওয়ালেটে ফেরত';

  @override
  String orderPlacedFromWallet(String amount) {
    return '$amount আপনার ওয়ালেট থেকে দেওয়া হয়েছে।';
  }

  @override
  String get orderPlacedTitle => 'অর্ডার সম্পন্ন হয়েছে!';

  @override
  String orderPlacedNumber(String number) {
    return 'অর্ডার $number';
  }

  @override
  String orderPlacedPaid(String amount, String method) {
    return '$method দিয়ে $amount পরিশোধ হয়েছে';
  }

  @override
  String orderPlacedPayOnDelivery(String amount) {
    return 'বই হাতে পেয়ে নগদে $amount পরিশোধ করুন';
  }

  @override
  String get orderPlacedContinue => 'কেনাকাটা চালিয়ে যান';

  @override
  String orderPointsEarned(int count) {
    return 'আপনি $countটি ওয়ারাকাহ পয়েন্ট পেয়েছেন';
  }

  @override
  String get orderPointsEarnedRow => 'পাওয়া পয়েন্ট';

  @override
  String get orderTrack => 'অর্ডার ট্র্যাক করুন';

  @override
  String get orderMyOrders => 'আমার অর্ডার';

  @override
  String get orderEmptyTitle => 'এখনো কোনো অর্ডার নেই';

  @override
  String get orderEmptyBody => 'আপনার অর্ডার করা বই ট্র্যাকিংসহ এখানে দেখাবে।';

  @override
  String orderPlacedOn(String date) {
    return 'অর্ডারের তারিখ $date';
  }

  @override
  String get orderNotFound => 'অর্ডারটি পাওয়া যায়নি।';

  @override
  String get orderStatusPlaced => 'অর্ডার হয়েছে';

  @override
  String get orderStatusConfirmed => 'নিশ্চিত হয়েছে';

  @override
  String get orderStatusPacked => 'প্যাক হয়েছে';

  @override
  String get orderStatusShipped => 'পাঠানো হয়েছে';

  @override
  String get orderStatusDelivered => 'পৌঁছে গেছে';

  @override
  String get orderStatusCancelled => 'বাতিল';

  @override
  String get orderDeliverTo => 'যেখানে পৌঁছাবে';

  @override
  String get orderPaid => 'পরিশোধিত';

  @override
  String get orderPayOnDelivery => 'হাতে পেয়ে পরিশোধ';

  @override
  String get orderCancel => 'অর্ডার বাতিল করুন';

  @override
  String get orderCancelTitle => 'অর্ডারটি বাতিল করবেন?';

  @override
  String get orderCancelBody =>
      'এটি আর ফেরানো যাবে না। যা পরিশোধ করেছেন, তা আপনার ওয়ারাকাহ ওয়ালেটে ফেরত যাবে।';

  @override
  String get orderKeep => 'অর্ডার রাখুন';

  @override
  String get orderCancelled => 'অর্ডার বাতিল হয়েছে';

  @override
  String get orderReturn => 'ফেরতের অনুরোধ করুন';

  @override
  String get orderReturnWhy => 'কেন ফেরত দিচ্ছেন?';

  @override
  String get orderReturnDamaged => 'বই নষ্ট অবস্থায় এসেছে';

  @override
  String get orderReturnWrongBook => 'ভুল বই এসেছে';

  @override
  String get orderReturnOther => 'অন্য কারণ';

  @override
  String get orderReturnNoteHint => 'কী হয়েছে জানান (ঐচ্ছিক)';

  @override
  String get orderReturnAddPhotos => 'ছবি যোগ করুন';

  @override
  String get orderReturnRemovePhoto => 'ছবি সরান';

  @override
  String get orderReturnPhotosHelp =>
      'সর্বোচ্চ ৩টি ছবি। ক্ষতির ছবি থাকলে দ্রুত সিদ্ধান্ত নেওয়া যায়।';

  @override
  String get orderReturnSend => 'অনুরোধ পাঠান';

  @override
  String get orderReturnSent =>
      'ফেরতের অনুরোধ পাঠানো হয়েছে। ২ দিনের মধ্যে জানানো হবে।';

  @override
  String get orderReturnRequested => 'ফেরতের অনুরোধ পর্যালোচনার অপেক্ষায়';

  @override
  String get orderReturnApproved => 'ফেরত অনুমোদিত, আমরা বইটি নিয়ে আসব';

  @override
  String get orderReturnRejected => 'ফেরত অনুমোদিত হয়নি';

  @override
  String get orderReturnWindow => 'পৌঁছানোর ৭ দিনের মধ্যে ফেরত দেওয়া যায়।';

  @override
  String get orderBuyAgain => 'আবার কিনুন';

  @override
  String orderBackInCart(int count) {
    return '$countটি বই আবার আপনার কার্টে।';
  }

  @override
  String orderSomeUnavailable(int count) {
    return '$countটি এখন আর কেনা যাচ্ছে না।';
  }

  @override
  String get orderNoneAvailable => 'এই বইগুলোর কোনোটিই এখন আর কেনা যাচ্ছে না।';

  @override
  String get orderInvoice => 'ইনভয়েস';

  @override
  String get orderInvoiceSeller => 'ওয়ারাকাহ · ইনভয়েস';

  @override
  String orderInvoiceQuantity(int count, String price) {
    return '$count × $price';
  }

  @override
  String get orderInvoiceShipTo => 'যে ঠিকানায় পাঠানো হয়';

  @override
  String get orderInvoiceThanks => 'ওয়ারাকাহর সাথে পড়ার জন্য ধন্যবাদ।';

  @override
  String get orderReturnPolicy => 'ফেরত নীতি';

  @override
  String get orderPolicyTitle => 'ফেরত ও রিফান্ড';

  @override
  String get orderPolicyWhenTitle => 'ডেলিভারির ৭ দিনের মধ্যে';

  @override
  String get orderPolicyWhen =>
      'ডেলিভারির ৭ দিনের মধ্যে অর্ডারের পাতা থেকে ফেরতের অনুরোধ করুন। সময় থাকা পর্যন্ত বোতামটি সেখানে থাকবে।';

  @override
  String get orderPolicyWhatTitle => 'কী ফেরত দেওয়া যায়';

  @override
  String get orderPolicyWhat =>
      'যে ছাপা বই নষ্ট অবস্থায় এসেছে, বা ভুল বই এসেছে। অন্য কিছু হলে “অন্য কারণ” বেছে নিয়ে কী হয়েছে লিখুন। সার্টিফায়েড ইউজড বইয়েও একই নিয়ম। লাইব্রেরিতে যোগ হওয়া ই-বুক ফেরত দেওয়া যায় না।';

  @override
  String get orderPolicyHowTitle => 'কীভাবে হয়';

  @override
  String get orderPolicyHow =>
      'সমস্যার ৩টি পর্যন্ত ছবি দিন। আমরা ২ দিনের মধ্যে অর্ডারের পাতায় উত্তর দিই। অনুমোদন হলে আপনার ঠিকানা থেকে বইটি নিয়ে আসি।';

  @override
  String get orderPolicyMoneyTitle => 'আপনার টাকা';

  @override
  String get orderPolicyMoney =>
      'ফেরত অনুমোদন হলে বইয়ের দাম আপনার ওয়ারাকাহ ওয়ালেটে যায়, পরের অর্ডারে ব্যবহার করতে পারবেন। ডেলিভারি আর গিফট র‍্যাপের টাকা ফেরত হয় না।';

  @override
  String get orderPolicyCancelTitle => 'বরং বাতিল করতে চাইলে';

  @override
  String get orderPolicyCancel =>
      'অর্ডার পাঠানোর আগ পর্যন্ত অর্ডারের পাতা থেকে বাতিল করা যায়। যা দিয়েছেন, সব ওয়ালেটে ফেরত যায়।';

  @override
  String get orderPolicyUsedTitle => 'অন্য পাঠকদের বই';

  @override
  String get orderPolicyUsed =>
      'অন্য পাঠকদের কাছ থেকে কেনা বই ওয়ারাকাহ বিক্রি করে না, তাই এখানে ফেরত দেওয়া যায় না। বিক্রেতাকে টাকা দেওয়ার আগে বইটি দেখে নিন।';

  @override
  String get adminOrderTitle => 'অর্ডার';

  @override
  String get adminOrderTabOrders => 'অর্ডার';

  @override
  String get adminOrderTabReturns => 'ফেরত';

  @override
  String get adminOrderTabCoupons => 'কুপন';

  @override
  String get adminOrderAll => 'সব';

  @override
  String adminOrderMoveTo(String status) {
    return '$status হিসেবে চিহ্নিত করুন';
  }

  @override
  String get adminOrderNoOrders => 'এখানে কোনো অর্ডার নেই।';

  @override
  String get adminOrderNoReturns => 'অপেক্ষমাণ কোনো ফেরত নেই।';

  @override
  String get adminOrderApprove => 'অনুমোদন';

  @override
  String get adminOrderReject => 'বাতিল';

  @override
  String get adminOrderReturnApproved => 'ফেরত অনুমোদিত হয়েছে';

  @override
  String get adminOrderReturnRejected => 'ফেরত বাতিল হয়েছে';

  @override
  String get adminOrderNewCoupon => 'নতুন কুপন';

  @override
  String get adminOrderCouponCode => 'কোড';

  @override
  String get adminOrderCouponCodeHint => 'যেমন BOISHAKH20';

  @override
  String get adminOrderCouponKindPercent => '% ছাড়';

  @override
  String get adminOrderCouponKindAmount => '৳ ছাড়';

  @override
  String get adminOrderCouponPercent => 'কত শতাংশ ছাড়';

  @override
  String get adminOrderCouponCap => 'সর্বোচ্চ কত টাকা ছাড় (ঐচ্ছিক)';

  @override
  String get adminOrderCouponTaka => 'কত টাকা ছাড়';

  @override
  String get adminOrderCouponMinOrder => 'ন্যূনতম অর্ডার, টাকায় (ঐচ্ছিক)';

  @override
  String get adminOrderCouponPickDate => 'শেষ তারিখ দিন';

  @override
  String get adminOrderCouponCreate => 'কুপন তৈরি করুন';

  @override
  String get adminOrderCouponCreated => 'কুপন তৈরি হয়েছে';

  @override
  String get adminOrderCouponBadCode => 'কোডে ৩–২০টি অক্ষর বা সংখ্যা দিন।';

  @override
  String get adminOrderCouponBadValue =>
      'পরিমাণ দেখুন: ১–৯০% ছাড়, বা কমপক্ষে ৳১ ছাড়।';

  @override
  String get adminOrderCouponBadExpiry => 'শেষ তারিখ ভবিষ্যতের হতে হবে।';

  @override
  String get adminOrderCouponTaken => 'এই কোডের কুপন আগে থেকেই আছে।';

  @override
  String adminOrderCouponPercentOff(int percent) {
    return '$percent% ছাড়';
  }

  @override
  String adminOrderCouponUpTo(String amount) {
    return 'সর্বোচ্চ $amount';
  }

  @override
  String adminOrderCouponAmountOff(String amount) {
    return '$amount ছাড়';
  }

  @override
  String adminOrderCouponFrom(String amount) {
    return '$amount বা বেশি অর্ডারে';
  }

  @override
  String get adminOrderCouponExpired => 'মেয়াদ শেষ';

  @override
  String get adminOrderCouponNoEnd => 'কোনো শেষ তারিখ নেই';

  @override
  String adminOrderCouponUntil(String date) {
    return '$date পর্যন্ত';
  }

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
  String get profileEditProfile => 'প্রোফাইল সম্পাদনা';

  @override
  String get profileEditName => 'নাম';

  @override
  String get profileEditPhoto => 'ছবি পরিবর্তন করুন';

  @override
  String get profilePhone => 'ফোন নম্বর';

  @override
  String get profilePhoneHint => '০১XXXXXXXXX';

  @override
  String get profileSaveChanges => 'পরিবর্তন সংরক্ষণ করুন';

  @override
  String get profileSaved => 'প্রোফাইল আপডেট হয়েছে';

  @override
  String get profileRemovePhoto => 'ছবি সরান';

  @override
  String profileNameLength(int min, int max) {
    return 'নাম $min–$max অক্ষরের হতে হবে।';
  }

  @override
  String get profilePhoneInvalid =>
      'বাংলাদেশি মোবাইল নম্বর লিখুন, যেমন 01712345678।';

  @override
  String get profileSettings => 'সেটিংস';

  @override
  String get profileSavedAddresses => 'সংরক্ষিত ঠিকানা';

  @override
  String get profileAddAddress => 'ঠিকানা যোগ করুন';

  @override
  String get profileNoAddresses => 'এখনও কোনো ঠিকানা সংরক্ষিত নেই।';

  @override
  String get profileAddressLabel => 'ঠিকানার নাম';

  @override
  String get profileAddressLine => 'বাড়ি, সড়ক ও এলাকা';

  @override
  String get profileDivision => 'বিভাগ';

  @override
  String get profileDistrict => 'জেলা';

  @override
  String get profileUpazila => 'উপজেলা';

  @override
  String get profileSelectDivision => 'বিভাগ নির্বাচন করুন';

  @override
  String get profileSelectDistrict => 'জেলা নির্বাচন করুন';

  @override
  String get profileSelectUpazila => 'উপজেলা নির্বাচন করুন';

  @override
  String get profileSaveAddress => 'ঠিকানা সংরক্ষণ করুন';

  @override
  String get profileAddressSaved => 'ঠিকানা সংরক্ষণ হয়েছে';

  @override
  String get profileEditAddress => 'ঠিকানা সম্পাদনা';

  @override
  String get profileDeleteAddress => 'ঠিকানা মুছুন';

  @override
  String get profileDeleteAddressMessage =>
      'এই সংরক্ষিত ঠিকানাটি সরিয়ে দেবেন?';

  @override
  String get profileAddressDeleted => 'ঠিকানা মুছে ফেলা হয়েছে';

  @override
  String get profileAddressLabelHint => 'বাসা, অফিস…';

  @override
  String get profileRecipient => 'প্রাপকের নাম';

  @override
  String get profileDefaultAddress => 'ডিফল্ট';

  @override
  String get profileMakeDefault => 'ডিফল্ট করুন';

  @override
  String get profileAddNewAddress => 'নতুন ঠিকানা যোগ করুন';

  @override
  String get profileAddressLabelMissing => 'ঠিকানার একটি নাম দিন, যেমন বাসা।';

  @override
  String get profileRecipientMissing => 'কে পার্সেল নেবেন তা লিখুন।';

  @override
  String get profileAddressLineMissing => 'বাসা, রোড ও এলাকা লিখুন।';

  @override
  String get profileAddressPlaceMissing => 'বিভাগ, জেলা ও উপজেলা বেছে নিন।';

  @override
  String get profileNotifications => 'নোটিফিকেশন';

  @override
  String get profileNotifyOrders => 'অর্ডার ও রিটার্ন';

  @override
  String get profileNotifyUsedBooks => 'পুরোনো বই';

  @override
  String get profileNotifyUsedBooksSub =>
      'লিস্টিং, ওয়ারাকাহ-পরিচালিত বিক্রি, সেল ব্যাক ও বইয়ের অনুরোধ';

  @override
  String get profileNotifyAlerts => 'দাম ও স্টক অ্যালার্ট';

  @override
  String get profileNotifyCommunity => 'কমিউনিটি';

  @override
  String get profileNotifyCommunitySub => 'বাইটে লাইক, মন্তব্য ও নতুন ফলোয়ার';

  @override
  String get profileNotifyModerationNote => 'মডারেশন সতর্কতা সবসময় আসবে।';

  @override
  String get profileAccountDeleted => 'আপনার অ্যাকাউন্ট মুছে ফেলা হয়েছে।';

  @override
  String get profileNotificationCenter => 'নোটিফিকেশন সেন্টার';

  @override
  String get profileMarkAllRead => 'সব পড়া হয়েছে হিসেবে চিহ্নিত করুন';

  @override
  String get profileNoNotifications => 'সব নোটিফিকেশন দেখা হয়েছে।';

  @override
  String get notificationEmptyBody =>
      'অর্ডারের খবর, লিস্টিংয়ের সিদ্ধান্ত, বিক্রি ও দামের অ্যালার্ট এখানে দেখাবে।';

  @override
  String notificationOrderStatus(String number, String status) {
    return 'অর্ডার $number: $status';
  }

  @override
  String get notificationOrderStatusBody => 'অর্ডার দেখতে ট্যাপ করুন।';

  @override
  String notificationReturnApproved(String number) {
    return '$number-এর রিটার্ন অনুমোদিত';
  }

  @override
  String get notificationReturnApprovedBody => 'টাকা আপনার ওয়ালেটে ফেরত গেছে।';

  @override
  String notificationReturnRejected(String number) {
    return '$number-এর রিটার্ন অনুমোদিত হয়নি';
  }

  @override
  String get notificationReturnRejectedBody =>
      'এরপর কী হবে দেখতে অর্ডারটি খুলুন।';

  @override
  String notificationListingApproved(String title) {
    return '$title এখন লাইভ';
  }

  @override
  String get notificationListingApprovedBody =>
      'পাঠকেরা এখন এটি দেখতে ও অফার দিতে পারবেন।';

  @override
  String notificationListingChanges(String title) {
    return '$title-এ পরিবর্তন দরকার';
  }

  @override
  String notificationListingRejected(String title) {
    return '$title অনুমোদিত হয়নি';
  }

  @override
  String get notificationWarning => 'আপনি একটি সতর্কতা পেয়েছেন';

  @override
  String notificationWarningBody(String strikes, String max) {
    return '$maxটির মধ্যে $strikesটি স্ট্রাইক। $maxটি হলে আর বিক্রি বা পোস্ট করতে পারবেন না।';
  }

  @override
  String get notificationBanned => 'আপনার অ্যাকাউন্ট নিষিদ্ধ করা হয়েছে';

  @override
  String get notificationBannedBody =>
      'বারবার সতর্কতার পর আপনার লিস্টিং সরিয়ে নেওয়া হয়েছে।';

  @override
  String notificationSaleSent(String title) {
    return '$title পথে আছে';
  }

  @override
  String get notificationSaleSentBody => 'বর্ণনামতো পৌঁছালে নিশ্চিত করুন।';

  @override
  String notificationSaleCompleted(String title) {
    return '$title: বিক্রি সম্পন্ন';
  }

  @override
  String notificationEarned(String amount) {
    return 'আপনি $amount আয় করেছেন।';
  }

  @override
  String notificationSaleRefunded(String title) {
    return '$title-এর টাকা ফেরত';
  }

  @override
  String notificationSaleSettled(String title) {
    return '$title-এর অভিযোগ মীমাংসা হয়েছে';
  }

  @override
  String get notificationSaleRefundedSeller =>
      'ক্রেতা টাকা ফেরত পেয়েছেন, আপনার লিস্টিং আবার লাইভ।';

  @override
  String get notificationSalePaidBuyer => 'বিক্রেতাকে টাকা দেওয়া হয়েছে।';

  @override
  String notificationInWallet(String amount) {
    return '$amount আপনার ওয়ালেটে আছে।';
  }

  @override
  String notificationSellBackPaid(String title) {
    return 'সেল ব্যাকের টাকা দেওয়া হয়েছে: $title';
  }

  @override
  String notificationSellBackReturned(String title) {
    return '$title আপনার কাছে ফেরত আসছে';
  }

  @override
  String get notificationSellBackReturnedBody =>
      'এবার আমরা কিনতে পারিনি; কুরিয়ার এটি ফেরত আনছে।';

  @override
  String notificationBackInStock(String title) {
    return '$title আবার স্টকে এসেছে';
  }

  @override
  String notificationPriceDrop(String title) {
    return '$title-এর দাম কমেছে';
  }

  @override
  String get notificationAlertBody => 'শেষ হওয়ার আগে দেখতে ট্যাপ করুন।';

  @override
  String notificationBookWanted(String title) {
    return 'একজন পাঠক $title চান';
  }

  @override
  String get notificationBookWantedBody =>
      'আপনার একটি কপি লিস্ট করা আছে। আমার লিস্টিংয়ে তাদের অনুরোধ দেখুন।';

  @override
  String notificationNewFollower(String name) {
    return '$name আপনাকে ফলো করা শুরু করেছেন';
  }

  @override
  String get notificationNewFollowerBody =>
      'আপনিও ফলো করলে তাদের বাইট আপনার ফলোয়িং ফিডে দেখাবে।';

  @override
  String notificationBiteComment(String name) {
    return '$name আপনার বাইটে মন্তব্য করেছেন';
  }

  @override
  String notificationCommentReply(String name) {
    return '$name আপনার মন্তব্যের উত্তর দিয়েছেন';
  }

  @override
  String get notificationCommentReplyBody => 'পড়তে বাইটটি খুলুন।';

  @override
  String get profilePrivacy => 'গোপনীয়তা';

  @override
  String get profileProfileVisibility => 'প্রোফাইল দৃশ্যমানতা';

  @override
  String get profileActivityVisibility => 'পড়ার কার্যক্রমের দৃশ্যমানতা';

  @override
  String get profileDeleteAccount => 'অ্যাকাউন্ট মুছে ফেলুন';

  @override
  String get profileDeleteAccountMessage =>
      'এতে আপনার অ্যাকাউন্ট ও সংরক্ষিত তথ্য স্থায়ীভাবে মুছে যাবে।';

  @override
  String get profileDeleteConfirm => 'স্থায়ীভাবে মুছুন';

  @override
  String get profileCancel => 'বাতিল';

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
  String get adminCatalogTitle => 'ক্যাটালগ';

  @override
  String get adminCatalogTabBooks => 'বই';

  @override
  String get adminCatalogTabCategories => 'ক্যাটাগরি';

  @override
  String get adminCatalogTabAuthors => 'লেখক';

  @override
  String get adminCatalogTabPublishers => 'প্রকাশক';

  @override
  String get adminCatalogTabBanners => 'ব্যানার';

  @override
  String get adminCatalogErrTitleBlank => 'শিরোনাম লিখুন';

  @override
  String get adminCatalogErrAuthorMissing => 'লেখক বেছে নিন';

  @override
  String get adminCatalogErrPublisherMissing => 'প্রকাশক বেছে নিন';

  @override
  String get adminCatalogErrCategoryMissing => 'ক্যাটাগরি বেছে নিন';

  @override
  String get adminCatalogErrCategoryWrongSection => 'এই ক্যাটাগরি অন্য সেকশনের';

  @override
  String get adminCatalogErrClassNotAllowed =>
      'শ্রেণি ৬–১২, আর শুধু স্কুল ও কলেজের বইয়ে।';

  @override
  String get adminCatalogErrExamNotAllowed => 'এই বিভাগে এই পরীক্ষা নেই।';

  @override
  String get adminCatalogFieldSubject => 'বিষয়';

  @override
  String get adminCatalogFieldNoSubject => 'কোনো বিষয় নেই';

  @override
  String get adminCatalogErrNoEditions => 'অন্তত একটি সংস্করণ যোগ করুন';

  @override
  String get adminCatalogErrPriceNotPositive => 'দাম ৳০-এর বেশি হতে হবে';

  @override
  String get adminCatalogErrListPriceTooLow =>
      'তালিকা মূল্য দামের চেয়ে বেশি হতে হবে';

  @override
  String get adminCatalogErrStockNegative => 'স্টক ০-এর কম হতে পারে না';

  @override
  String get adminCatalogErrIsbnInvalid =>
      'সঠিক ISBN নয়। ১০ বা ১৩টি অঙ্ক মিলিয়ে দেখুন।';

  @override
  String get adminCatalogErrIsbnTaken => 'এই ISBN আরেকটি সংস্করণে আছে';

  @override
  String get adminCatalogErrEditionTaken =>
      'এই ফরম্যাট ও ভাষায় বইটির একটি সংস্করণ আগেই আছে';

  @override
  String get adminCatalogErrNameBlank => 'নাম লিখুন';

  @override
  String get adminCatalogErrNameBnBlank => 'বাংলা নাম লিখুন';

  @override
  String get adminCatalogErrBannerTitleBlank =>
      'ইংরেজি ও বাংলায় শিরোনাম লিখুন';

  @override
  String get adminCatalogErrBannerTargetBlank =>
      'ব্যানারটি কী খুলবে তা বেছে নিন';

  @override
  String get adminCatalogAddBook => 'বই যোগ করুন';

  @override
  String get adminCatalogIsbnLookupField => 'খোঁজার জন্য আইএসবিএন';

  @override
  String get adminCatalogLookUp => 'খুঁজুন';

  @override
  String get adminCatalogIsbnNotFound => 'পাওয়া যায়নি — নিজে পূরণ করুন।';

  @override
  String get adminCatalogIsbnInCatalog => 'ক্যাটালগে আগেই আছে';

  @override
  String get adminCatalogOpen => 'খুলুন';

  @override
  String get adminCatalogMoreTools => 'আরও টুল';

  @override
  String get adminCatalogLowStock => 'স্টক কম';

  @override
  String get adminCatalogLowStockEmpty => 'সব বইয়ের যথেষ্ট স্টক আছে।';

  @override
  String adminCatalogStockLeft(int count) {
    return '$countটি বাকি';
  }

  @override
  String get adminCatalogSetStock => 'স্টক বদলান';

  @override
  String get adminCatalogImport => 'CSV ইমপোর্ট';

  @override
  String get adminCatalogImportHint =>
      'এই হেডারসহ সারি পেস্ট করুন। এক সারি মানে এক সংস্করণ; একই শিরোনাম আর লেখকের সারিগুলো মিলে একটি বই।';

  @override
  String get adminCatalogImportField => 'CSV সারি';

  @override
  String get adminCatalogImportExample => 'উদাহরণ বসান';

  @override
  String get adminCatalogImportCheck => 'যাচাই করুন';

  @override
  String adminCatalogImportBooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বই ইমপোর্ট করুন',
    );
    return '$_temp0';
  }

  @override
  String adminCatalogImportEditions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি সংস্করণ',
    );
    return '$_temp0';
  }

  @override
  String get adminCatalogImportNewAuthor => 'নতুন লেখক';

  @override
  String get adminCatalogImportNewPublisher => 'নতুন প্রকাশক';

  @override
  String adminCatalogImportRow(int row) {
    return 'সারি $row:';
  }

  @override
  String get adminCatalogImportColumns => '১২টি কলাম লাগবে';

  @override
  String get adminCatalogImportBlank => 'শিরোনাম, লেখক আর প্রকাশক লাগবে';

  @override
  String adminCatalogImportSection(String value) {
    return 'অজানা বিভাগ “$value”';
  }

  @override
  String adminCatalogImportCategory(String value) {
    return 'অজানা ক্যাটাগরি “$value”';
  }

  @override
  String adminCatalogImportFormat(String value) {
    return 'অজানা ফরম্যাট “$value”';
  }

  @override
  String adminCatalogImportLanguage(String value) {
    return 'অজানা ভাষা “$value”';
  }

  @override
  String adminCatalogImportNumber(String value) {
    return '“$value” পূর্ণসংখ্যা নয়';
  }

  @override
  String adminCatalogImportDone(int imported, int skipped) {
    return '$importedটি বই ইমপোর্ট হয়েছে, $skippedটি বাদ গেছে।';
  }

  @override
  String get adminCatalogEditBook => 'বই সম্পাদনা';

  @override
  String get adminCatalogSearchBooks => 'শিরোনাম বা লেখক খুঁজুন';

  @override
  String get adminCatalogShowHidden => 'লুকানো বইও দেখান';

  @override
  String get adminCatalogHidden => 'লুকানো';

  @override
  String adminCatalogInStock(int count) {
    return 'স্টকে $countটি';
  }

  @override
  String get adminCatalogNoBooks => 'কোনো বই মেলেনি।';

  @override
  String get adminCatalogFieldTitle => 'শিরোনাম';

  @override
  String get adminCatalogFieldTitleBn => 'বাংলা শিরোনাম (ঐচ্ছিক)';

  @override
  String get adminCatalogFieldAuthor => 'লেখক';

  @override
  String get adminCatalogFieldPublisher => 'প্রকাশক';

  @override
  String get adminCatalogFieldSection => 'সেকশন';

  @override
  String get adminCatalogFieldCategory => 'ক্যাটাগরি';

  @override
  String get adminCatalogFieldLanguage => 'মূল ভাষা';

  @override
  String get adminCatalogPick => 'বেছে নিন…';

  @override
  String get adminCatalogCover => 'প্রচ্ছদের রং';

  @override
  String get adminCatalogEditions => 'সংস্করণ';

  @override
  String get adminCatalogAddEdition => 'সংস্করণ যোগ করুন';

  @override
  String get adminCatalogRemoveEdition => 'সংস্করণ সরান';

  @override
  String get adminCatalogFieldFormat => 'ফরম্যাট';

  @override
  String get adminCatalogFieldEditionLanguage => 'ভাষা';

  @override
  String get adminCatalogFieldPrice => 'দাম (৳)';

  @override
  String get adminCatalogFieldListPrice => 'তালিকা মূল্য (৳, ঐচ্ছিক)';

  @override
  String get adminCatalogFieldStock => 'স্টক';

  @override
  String get adminCatalogFieldPreorder => 'প্রি-অর্ডার';

  @override
  String get adminCatalogFieldIsbn => 'ISBN (ঐচ্ছিক)';

  @override
  String get adminCatalogEbookNote => 'ই-বুক কখনো শেষ হয় না, আর এর ISBN নেই।';

  @override
  String get adminCatalogDone => 'ঠিক আছে';

  @override
  String get adminCatalogSave => 'সেভ করুন';

  @override
  String get adminCatalogSaved => 'সেভ হয়েছে';

  @override
  String get adminCatalogSaveFailed =>
      'সেভ করা যায়নি। ফর্মটি দেখে আবার চেষ্টা করুন।';

  @override
  String get adminCatalogHide => 'লুকান';

  @override
  String get adminCatalogUnhide => 'আবার দেখান';

  @override
  String get adminCatalogHideHint =>
      'লুকানো বই তালিকা, সার্চ, হোম ও সংকলন থেকে সরে যায়, কিন্তু পুরোনো লিংক থেকে এর পেজ খোলে এবং কেনা যায়। বিক্রি বন্ধ করতে স্টক ০ করুন।';

  @override
  String get adminCatalogSearchRecords => 'খুঁজুন';

  @override
  String get adminCatalogAddNew => 'নতুন যোগ করুন…';

  @override
  String get adminCatalogFieldName => 'নাম (ইংরেজি)';

  @override
  String get adminCatalogFieldNameBn => 'নাম (বাংলা)';

  @override
  String get adminCatalogFieldNameBnOptional => 'নাম (বাংলা, ঐচ্ছিক)';

  @override
  String adminCatalogBookCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বই',
      zero: 'কোনো বই নেই',
    );
    return '$_temp0';
  }

  @override
  String adminCatalogUsedBy(int count) {
    return '$countটি বইয়ে ব্যবহৃত';
  }

  @override
  String get adminCatalogDelete => 'মুছে ফেলুন';

  @override
  String get adminCatalogDeleted => 'মুছে ফেলা হয়েছে';

  @override
  String get adminCatalogAdd => 'যোগ করুন';

  @override
  String get adminCatalogNoRecords => 'এখানে এখনো কিছু নেই।';

  @override
  String get adminCatalogBannerNew => 'নতুন ব্যানার';

  @override
  String get adminCatalogBannerEdit => 'ব্যানার সম্পাদনা';

  @override
  String get adminCatalogFieldTitleEn => 'শিরোনাম (ইংরেজি)';

  @override
  String get adminCatalogFieldTitleBnBanner => 'শিরোনাম (বাংলা)';

  @override
  String get adminCatalogFieldSubtitleEn => 'উপশিরোনাম (ইংরেজি)';

  @override
  String get adminCatalogFieldSubtitleBn => 'উপশিরোনাম (বাংলা)';

  @override
  String get adminCatalogBannerColour => 'রং';

  @override
  String get adminCatalogBannerOpens => 'যা খুলবে';

  @override
  String get adminCatalogTargetCollection => 'সংকলন';

  @override
  String get adminCatalogTargetBook => 'বই';

  @override
  String get adminCatalogTargetSearch => 'সার্চ';

  @override
  String get adminCatalogSearchWords => 'সার্চের শব্দ';

  @override
  String get adminCatalogMoveUp => 'উপরে নিন';

  @override
  String get adminCatalogMoveDown => 'নিচে নিন';

  @override
  String get adminCatalogEdit => 'সম্পাদনা';

  @override
  String get adminCatalogDeleteBannerTitle => 'এই ব্যানারটি মুছে ফেলবেন?';

  @override
  String get adminCatalogDeleteBannerBody =>
      'এটি সঙ্গে সঙ্গে হোম থেকে সরে যাবে।';

  @override
  String get adminCatalogCancel => 'বাতিল';

  @override
  String get adminCatalogNoBanners =>
      'কোনো ব্যানার নেই। আপনি যোগ না করা পর্যন্ত হোমে কিছু দেখাবে না।';

  @override
  String get adminCatalogSeasonHome => 'হোমের মৌসুম';

  @override
  String get adminCatalogSeasonAuto => 'স্বয়ংক্রিয় (তারিখ অনুযায়ী)';

  @override
  String get adminCatalogSeason => 'মৌসুম';

  @override
  String get adminCatalogSeasonNone => 'নেই (সারা বছর)';

  @override
  String get adminCatalogTabCollections => 'সংকলন';

  @override
  String get adminCatalogListsBooklists => 'বুকলিস্ট';

  @override
  String get adminCatalogNewCollection => 'নতুন সংকলন';

  @override
  String get adminCatalogEditCollection => 'সংকলন সম্পাদনা';

  @override
  String get adminCatalogNewBooklist => 'নতুন বুকলিস্ট';

  @override
  String get adminCatalogEditBooklist => 'বুকলিস্ট সম্পাদনা';

  @override
  String get adminCatalogFieldNoteEn => 'কেন এই বইগুলো (ইংরেজি)';

  @override
  String get adminCatalogFieldNoteBn => 'কেন এই বইগুলো (বাংলা)';

  @override
  String get adminCatalogFieldSectionOptional => 'বিভাগ (ঐচ্ছিক)';

  @override
  String get adminCatalogNoSection => 'নেই (সাধারণ)';

  @override
  String get adminCatalogFieldExpert => 'বিশেষজ্ঞ (ঐচ্ছিক)';

  @override
  String get adminCatalogNoExpert => 'নেই (স্টাফের বাছাই)';

  @override
  String get adminCatalogFieldKind => 'ধরন';

  @override
  String get adminCatalogListBooks => 'বই';

  @override
  String get adminCatalogAddBooks => 'বই যোগ করুন';

  @override
  String get adminCatalogRemoveBook => 'সরান';

  @override
  String get adminCatalogErrListTitleBlank => 'ইংরেজি ও বাংলায় শিরোনাম দিন';

  @override
  String get adminCatalogErrListNoBooks => 'অন্তত একটি বই যোগ করুন';

  @override
  String get adminCatalogErrListDuplicateBook => 'একটি বই তালিকায় দুবার আছে';

  @override
  String get adminCatalogErrListNoteTooLong =>
      'প্রতিটি নোট ৩০০ অক্ষরের মধ্যে রাখুন';

  @override
  String get adminCatalogDeleteListTitle => 'এই তালিকা মুছবেন?';

  @override
  String get adminCatalogDeleteListBody =>
      'পাঠকেরা সঙ্গে সঙ্গে আর এটি দেখবেন না।';

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
  String get moderationEmptyDisputes => 'কোনো সক্রিয় বিরোধ নেই।';

  @override
  String get moderationTabLog => 'লগ';

  @override
  String get moderationApprove => 'অনুমোদন';

  @override
  String get moderationRequestChanges => 'পরিবর্তন চান';

  @override
  String get moderationReject => 'বাতিল করুন';

  @override
  String get moderationReasonChangesTitle => 'বিক্রেতাকে কী বদলাতে হবে?';

  @override
  String get moderationReasonRejectTitle => 'কেন বাতিল করা হচ্ছে?';

  @override
  String get moderationReasonLabel => 'কারণ';

  @override
  String get moderationReasonHint => 'বিক্রেতা এটি দেখবেন।';

  @override
  String get moderationReasonRequired => 'বিক্রেতার জন্য একটি কারণ লিখুন।';

  @override
  String moderationReasonTooLong(int max) {
    return '$max অক্ষরের মধ্যে রাখুন।';
  }

  @override
  String get moderationQuickPhotos => 'আপনার কপির আরও পরিষ্কার ছবি দিন';

  @override
  String get moderationQuickPhotocopy => 'এটি ফটোকপি মনে হচ্ছে';

  @override
  String get moderationQuickPrice => 'দাম নতুন কেনার চেয়ে বেশি';

  @override
  String get moderationQuickCondition => 'অবস্থা ছবির সঙ্গে মিলছে না';

  @override
  String get moderationSend => 'পাঠান';

  @override
  String moderationApproved(String title) {
    return '$title এখন লাইভ।';
  }

  @override
  String moderationChangesSent(String name) {
    return '$name-এর কাছে পরিবর্তন চাওয়া হয়েছে।';
  }

  @override
  String moderationRejected(String title) {
    return '$title বাতিল করা হয়েছে।';
  }

  @override
  String moderationStrikes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি স্ট্রাইক',
      zero: 'কোনো স্ট্রাইক নেই',
    );
    return '$_temp0';
  }

  @override
  String get moderationBannedTag => 'নিষিদ্ধ';

  @override
  String get moderationPhotoFront => 'সামনে';

  @override
  String get moderationPhotoBack => 'পেছনে';

  @override
  String get moderationPhotoSpine => 'বাঁধাই';

  @override
  String get moderationPhotoInside => 'ভেতরে';

  @override
  String get moderationPhotoDamage => 'ক্ষতি';

  @override
  String get moderationNoPhotos => 'কোনো ছবি নেই। অনুমোদনের আগে ছবি চান।';

  @override
  String moderationNewPrice(String price) {
    return 'নতুন $price';
  }

  @override
  String moderationReportCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি রিপোর্ট',
    );
    return '$_temp0';
  }

  @override
  String get moderationKindListing => 'লিস্টিং';

  @override
  String get moderationKindUser => 'পাঠক';

  @override
  String get moderationKindMessage => 'মেসেজ';

  @override
  String get moderationKindBite => 'বাইট';

  @override
  String get moderationKindComment => 'মন্তব্য';

  @override
  String get moderationKindReview => 'রিভিউ';

  @override
  String moderationOwner(String name) {
    return '$name-এর';
  }

  @override
  String moderationReporterNote(String note) {
    return 'রিপোর্টকারী: $note';
  }

  @override
  String get moderationRemove => 'সরান';

  @override
  String get moderationDismiss => 'খারিজ';

  @override
  String get moderationWarn => 'সতর্ক করুন';

  @override
  String get moderationBan => 'নিষিদ্ধ করুন';

  @override
  String moderationBanTitle(String name) {
    return '$name-কে নিষিদ্ধ করবেন?';
  }

  @override
  String get moderationBanBody =>
      'তাঁরা আর বিক্রি বা পোস্ট করতে পারবেন না, তাঁদের লিস্টিং মার্কেটপ্লেস থেকে সরে যাবে।';

  @override
  String get moderationCancel => 'বাতিল';

  @override
  String get moderationDone => 'সম্পন্ন। লগে রাখা হয়েছে।';

  @override
  String get moderationEmptyLog =>
      'এখনো কোনো কাজ হয়নি। মডারেটরদের সব কাজ এখানে দেখাবে।';

  @override
  String get moderationLogApproved => 'অনুমোদন করেছেন';

  @override
  String get moderationLogChangesRequested => 'পরিবর্তন চেয়েছেন';

  @override
  String get moderationLogRejected => 'বাতিল করেছেন';

  @override
  String get moderationLogRemoved => 'সরিয়েছেন';

  @override
  String get moderationLogDismissed => 'রিপোর্ট খারিজ করেছেন:';

  @override
  String get moderationLogWarned => 'সতর্ক করেছেন';

  @override
  String get moderationLogBanned => 'নিষিদ্ধ করেছেন';

  @override
  String get moderationLogThirdStrike => 'তৃতীয় স্ট্রাইক';

  @override
  String moderationLogBy(String by, String time) {
    return '$by · $time';
  }

  @override
  String get listingSellBook => 'বই বিক্রি করুন';

  @override
  String get listingMyListings => 'আমার লিস্টিং';

  @override
  String get listingStepPickBook => 'বই নির্বাচন করুন';

  @override
  String get listingStepCondition => 'অবস্থা';

  @override
  String get listingStepPhotos => 'ছবি';

  @override
  String get listingStepPriceHandover => 'দাম ও হস্তান্তর';

  @override
  String get listingBookTitle => 'বইয়ের নাম';

  @override
  String get listingBookTitleHint => 'The Pragmatic Programmer';

  @override
  String get listingConditionLikeNew => 'নতুনের মত';

  @override
  String get listingConditionVeryGood => 'খুব ভালো';

  @override
  String get listingConditionGood => 'ভালো';

  @override
  String get listingConditionAcceptable => 'চলনসই';

  @override
  String get listingFlags => 'ফ্ল্যাগ (ঐচ্ছিক)';

  @override
  String get listingFlagHighlighting => 'হাইলাইটিং';

  @override
  String get listingFlagNotes => 'নোট';

  @override
  String get listingFlagDamage => 'ক্ষতি';

  @override
  String get listingPhotosDesc =>
      'সামনের কভার, পেছনের কভার, স্পাইন, ভেতরের পাতা এবং কোনো ক্ষতির ছবি আপলোড করুন।';

  @override
  String get listingPrice => 'দাম (৳)';

  @override
  String get listingPriceHint => '৪৫০';

  @override
  String get listingNegotiable => 'আলোচনা সাপেক্ষে';

  @override
  String get listingHandoverMethod => 'হস্তান্তর পদ্ধতি';

  @override
  String get listingHandoverMeet => 'সরাসরি দেখা করে';

  @override
  String get listingHandoverDelivery => 'ডেলিভারি';

  @override
  String get listingSaveDraft => 'খসড়া সংরক্ষণ করুন';

  @override
  String get listingNext => 'পরবর্তী';

  @override
  String get listingBack => 'পেছনে';

  @override
  String get listingStatusDraft => 'খসড়া';

  @override
  String get listingStatusInReview => 'রিভিউতে আছে';

  @override
  String get listingStatusChangesRequested => 'পরিবর্তন চাওয়া হয়েছে';

  @override
  String get listingStatusRejected => 'বাতিল';

  @override
  String get listingStatusLive => 'লাইভ';

  @override
  String get listingStatusSold => 'বিক্রি হয়েছে';

  @override
  String get listingConditionPrefix => 'অবস্থা: ';

  @override
  String get listingReasonPrefix => 'কারণ: ';

  @override
  String get reportAction => 'রিপোর্ট করুন';

  @override
  String get reportMoreOptions => 'আরও অপশন';

  @override
  String get reportTitleListing => 'এই লিস্টিং রিপোর্ট করুন';

  @override
  String get reportTitleUser => 'এই পাঠককে রিপোর্ট করুন';

  @override
  String get reportTitleMessage => 'এই মেসেজ রিপোর্ট করুন';

  @override
  String get reportTitleBite => 'এই বাইট রিপোর্ট করুন';

  @override
  String get reportTitleComment => 'এই মন্তব্য রিপোর্ট করুন';

  @override
  String get reportTitleReview => 'এই রিভিউ রিপোর্ট করুন';

  @override
  String get reportWhy => 'কেন রিপোর্ট করছেন?';

  @override
  String get reportReasonSpam => 'স্প্যাম বা প্রতারণা';

  @override
  String get reportReasonFake => 'ভুয়া বা বিভ্রান্তিকর';

  @override
  String get reportReasonPhotocopy => 'ফটোকপি বা পাইরেটেড বই';

  @override
  String get reportReasonHarassment => 'হয়রানি বা ঘৃণা';

  @override
  String get reportReasonOffensive => 'আপত্তিকর বা অনুপযুক্ত';

  @override
  String get reportReasonOther => 'অন্য কিছু';

  @override
  String get reportNoteLabel => 'আরও বলুন';

  @override
  String get reportNoteHint => 'ঐচ্ছিক। মডারেটরদের সিদ্ধান্ত নিতে সাহায্য করে।';

  @override
  String get reportNoteRequired => 'সমস্যাটি কী তা লিখুন।';

  @override
  String reportNoteTooLong(int max) {
    return '$max অক্ষরের মধ্যে রাখুন।';
  }

  @override
  String get reportPrivacy =>
      'কে রিপোর্ট করেছে তা তারা জানবে না। একজন মডারেটর এটি দেখবেন।';

  @override
  String get reportSend => 'রিপোর্ট পাঠান';

  @override
  String get reportSent => 'ধন্যবাদ। একজন মডারেটর আপনার রিপোর্ট দেখবেন।';

  @override
  String reportBlockUser(String name) {
    return '$name-কে ব্লক করুন';
  }

  @override
  String reportUnblockUser(String name) {
    return '$name-কে আনব্লক করুন';
  }

  @override
  String reportBlockTitle(String name) {
    return '$name-কে ব্লক করবেন?';
  }

  @override
  String get reportBlockBody =>
      'তাঁদের লিস্টিং মার্কেটপ্লেসে দেখাবে না। প্রোফাইল থেকে যেকোনো সময় আনব্লক করতে পারবেন।';

  @override
  String get reportBlockConfirm => 'ব্লক করুন';

  @override
  String get reportCancel => 'বাতিল';

  @override
  String reportBlocked(String name) {
    return '$name-কে ব্লক করা হয়েছে।';
  }

  @override
  String reportUnblocked(String name) {
    return '$name-কে আনব্লক করা হয়েছে।';
  }

  @override
  String reportBlockedNotice(String name) {
    return 'আপনি $name-কে ব্লক করেছেন। অফার দিতে আনব্লক করুন।';
  }

  @override
  String get reportUnblock => 'আনব্লক';

  @override
  String get reportBlockedTitle => 'ব্লক করা পাঠক';

  @override
  String get reportBlockedEmpty => 'আপনি কাউকে ব্লক করেননি।';

  @override
  String get reportBlockedEmptyBody =>
      'কোনো পাঠকের প্রোফাইল বা লিস্টিংয়ের মেনু থেকে ব্লক করুন। তাঁদের লিস্টিং মার্কেটপ্লেসে আর দেখাবে না।';

  @override
  String reportBlockedSince(String date) {
    return 'ব্লক করা হয়েছে $date';
  }

  @override
  String get listingRulesTitle => 'লিস্ট করার আগে';

  @override
  String get listingRuleOriginal => 'শুধু আসল ছাপা বই। কোনো ফটোকপি নয়।';

  @override
  String get listingRulePirated =>
      'কোনো পাইরেটেড বই, পিডিএফ প্রিন্ট বা অননুমোদিত কপি নয়।';

  @override
  String get listingRuleHonest => 'অবস্থা সৎভাবে লিখুন, নিজের কপির ছবি দিন।';

  @override
  String get listingRuleWarning =>
      'এই নিয়ম ভাঙলে মডারেটর লিস্টিং বাতিল করবেন, বারবার ভাঙলে অ্যাকাউন্ট নিষিদ্ধ হতে পারে।';

  @override
  String listingFairPrice(String low, String high) {
    return 'ন্যায্য দাম: $low–$high';
  }

  @override
  String listingFairPriceBasis(String price) {
    return 'নতুন দাম ($price), অবস্থা ও চিহ্ন দেখে।';
  }

  @override
  String get listingFairPriceUnknown =>
      'ন্যায্য দাম দেখতে ক্যাটালগ থেকে বইটি স্ক্যান বা বাছাই করুন।';

  @override
  String get listingPriceLow => 'বেশিরভাগের চেয়ে কম: দ্রুত বিক্রি হওয়া উচিত।';

  @override
  String get listingPriceFair => 'ন্যায্য দাম।';

  @override
  String get listingPriceHigh =>
      'বেশিরভাগ পুরোনো কপির চেয়ে বেশি, তাই বিক্রি হতে সময় লাগতে পারে।';

  @override
  String listingPriceAboveNew(String price) {
    return 'এটি নতুন কেনার ($price) সমান বা বেশি। ক্রেতারা নতুনটাই কিনবেন।';
  }

  @override
  String listingFinishedTitle(String title) {
    return '$title পড়া শেষ?';
  }

  @override
  String get listingFinishedBody =>
      'অন্যকে দিন: আরেকজন পাঠক কম দামে পাবেন, আপনি টাকা ফেরত পাবেন।';

  @override
  String listingFinishedListRange(String low, String high) {
    return 'একবার পড়া কপির জন্য পাঠকেরা প্রায় $low–$high দেন।';
  }

  @override
  String get listingFinishedList => 'পাঠকদের জন্য লিস্ট করুন';

  @override
  String listingFinishedSellBackLine(String price) {
    return 'অথবা ওয়ারাকাহ এখনই $price দেবে, কুরিয়ার বই নিয়ে যাবে।';
  }

  @override
  String get listingFinishedSellBack => 'ওয়ারাকাহকে ফেরত বিক্রি করুন';

  @override
  String get listingFinishedKeep => 'রেখে দিন';

  @override
  String get shelfTitle => 'আমার তাক';

  @override
  String get shelfWantToRead => 'পড়তে চাই';

  @override
  String get shelfReading => 'পড়ছি';

  @override
  String get shelfFinished => 'পড়া শেষ';

  @override
  String get shelfAdd => 'তাকে রাখুন';

  @override
  String get shelfRemove => 'তাক থেকে সরান';

  @override
  String shelfMoved(String shelf) {
    return '$shelf-এ রাখা হয়েছে।';
  }

  @override
  String get shelfRemoved => 'তাক থেকে সরানো হয়েছে।';

  @override
  String get shelfMoveTo => 'সরান';

  @override
  String get shelfEmptyWantToRead =>
      'এখনো কিছু নেই। বইয়ের পাতা থেকে যোগ করুন; কেনা বই পৌঁছালে এখানে আসে।';

  @override
  String get shelfEmptyReading => 'এখন কিছু পড়ছেন না।';

  @override
  String get shelfEmptyFinished => 'শেষ করা বই এখানে দেখাবে।';

  @override
  String shelfAddedOn(String date) {
    return 'যোগ হয়েছে $date';
  }

  @override
  String shelfFinishedOn(String date) {
    return 'শেষ হয়েছে $date';
  }

  @override
  String get shelfProfileLink => 'আমার তাক';

  @override
  String get shelfProfileLinkBody => 'পড়তে চাই, পড়ছি আর পড়া শেষ';

  @override
  String get listingEditTitle => 'লিস্টিং সম্পাদনা';

  @override
  String get listingSendForReview => 'যাচাইয়ের জন্য পাঠান';

  @override
  String get listingSentForReview =>
      'যাচাইয়ের জন্য পাঠানো হয়েছে। লাইভ হওয়ার আগে একজন মডারেটর এটি দেখবেন।';

  @override
  String get listingDraftSaved =>
      'খসড়া সংরক্ষিত হয়েছে। মাই লিস্টিংস থেকে শেষ করুন।';

  @override
  String get listingSaveFailed =>
      'লিস্টিং সংরক্ষণ করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get listingEdit => 'সম্পাদনা';

  @override
  String get listingEditResend => 'সম্পাদনা করে আবার পাঠান';

  @override
  String get listingNote => 'আপনার কপি সম্পর্কে (ঐচ্ছিক)';

  @override
  String get listingNoteHint =>
      'ক্রেতার যা জানা দরকার: দাগ, হারানো পৃষ্ঠা, সংস্করণ।';

  @override
  String get listingPhotosHelp =>
      'নিজের কপির ছবি দিন। সামনের ও পেছনের মলাট লাগবে, আর চিহ্নিত কোনো ক্ষতির ছবি।';

  @override
  String get listingPhotoFront => 'সামনের মলাট';

  @override
  String get listingPhotoBack => 'পেছনের মলাট';

  @override
  String get listingPhotoSpine => 'বাঁধাই';

  @override
  String get listingPhotoInside => 'ভেতরের পৃষ্ঠা';

  @override
  String get listingPhotoDamage => 'ক্ষতি';

  @override
  String get listingPhotoNeeded => 'লাগবে';

  @override
  String get listingPhotoSaved => 'আপলোড হয়েছে';

  @override
  String get listingPhotoAdd => 'ছবি যোগ করুন';

  @override
  String get listingPhotoRemove => 'ছবি সরান';

  @override
  String get listingProblemTitle => 'বইয়ের নাম লিখুন।';

  @override
  String get listingProblemTitleLong => 'নাম ১২০ অক্ষরের মধ্যে রাখুন।';

  @override
  String get listingProblemNoteLong => 'নোট ৫০০ অক্ষরের মধ্যে রাখুন।';

  @override
  String get listingProblemPrice => 'দাম ঠিক করুন।';

  @override
  String get listingProblemPriceHigh => 'দাম অনেক বেশি: সর্বোচ্চ ৳৫০,০০০।';

  @override
  String get listingProblemFront => 'সামনের মলাটের ছবি দিন।';

  @override
  String get listingProblemBack => 'পেছনের মলাটের ছবি দিন।';

  @override
  String get listingProblemDamage => 'ক্ষতি চিহ্নিত করেছেন: তার একটি ছবি দিন।';

  @override
  String get scanTitle => 'বই স্ক্যান করুন';

  @override
  String get scanAim => 'বইয়ের পেছনের বারকোডের দিকে ক্যামেরা ধরুন।';

  @override
  String get scanNoCamera =>
      'এখানে ক্যামেরা নেই। বইয়ের পেছনের ISBN টাইপ করুন।';

  @override
  String get scanCameraError => 'ক্যামেরা খোলা যায়নি। ISBN টাইপ করুন।';

  @override
  String get scanIsbnLabel => 'অথবা ISBN টাইপ করুন';

  @override
  String get scanIsbnHint => '৯৭৮…';

  @override
  String get scanFind => 'খুঁজুন';

  @override
  String get scanInvalid => 'এটি সঠিক ISBN নয়। ১০ বা ১৩ সংখ্যা মিলিয়ে দেখুন।';

  @override
  String scanIsbn(String isbn) {
    return 'ISBN $isbn';
  }

  @override
  String scanNewFrom(String price) {
    return 'নতুন $price থেকে';
  }

  @override
  String get scanOpenBook => 'বইয়ের পেজ খুলুন';

  @override
  String get scanSellCopy => 'আপনার কপি বিক্রি করুন';

  @override
  String get scanNotFoundTitle => 'এই বইটি এখনো আমাদের কাছে নেই';

  @override
  String scanNotFoundBody(String isbn) {
    return 'ISBN $isbn ওয়ারাকাহর ক্যাটালগে নেই।';
  }

  @override
  String get scanRequest => 'এই বইটি চান';

  @override
  String get scanListAnyway => 'তবুও লিস্ট করুন';

  @override
  String scanSelling(String title) {
    return 'ক্যাটালগ থেকে: $title';
  }

  @override
  String get requestTitle => 'বই চান';

  @override
  String get requestIntro =>
      'কী খুঁজছেন জানান। যাঁদের কাছে আছে তাঁরা জানতে পারবেন, আর ওয়ারাকাহ দেখবে পাঠকেরা কী চান।';

  @override
  String get requestBookTitle => 'বইয়ের নাম';

  @override
  String get requestBookTitleHint => 'ক্যালকুলাস';

  @override
  String get requestAuthor => 'লেখক (ঐচ্ছিক)';

  @override
  String get requestAuthorHint => 'জেমস স্টুয়ার্ট';

  @override
  String get requestMaxPrice => 'সর্বোচ্চ কত দেবেন, ৳ (ঐচ্ছিক)';

  @override
  String get requestMaxPriceHint => '৯০০';

  @override
  String get requestNote => 'নোট (ঐচ্ছিক)';

  @override
  String get requestNoteHint => 'সংস্করণ, অবস্থা, আপনার এলাকা…';

  @override
  String get requestTitleMissing => 'বইয়ের নাম লিখুন।';

  @override
  String requestTitleTooLong(int max) {
    return 'নাম $max অক্ষরের মধ্যে রাখুন।';
  }

  @override
  String get requestBadPrice => '৳০-এর বেশি দাম লিখুন।';

  @override
  String requestNoteTooLong(int max) {
    return 'নোট $max অক্ষরের মধ্যে রাখুন।';
  }

  @override
  String get requestSend => 'অনুরোধ পাঠান';

  @override
  String requestSent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'অনুরোধ পাঠানো হয়েছে। যাঁদের কাছে আছে এমন $count জন পাঠক জেনেছেন।',
      zero: 'অনুরোধ পাঠানো হয়েছে। যাঁরা লিস্ট করবেন তাঁরা দেখবেন।',
    );
    return '$_temp0';
  }

  @override
  String get requestMine => 'আমার বইয়ের অনুরোধ';

  @override
  String get requestNew => 'নতুন অনুরোধ';

  @override
  String get requestEmptyTitle => 'এখনো কোনো অনুরোধ নেই';

  @override
  String get requestEmptyBody =>
      'যে বই পাচ্ছেন না তা চান। যাঁদের কাছে আছে তাঁরা আপনার অনুরোধ দেখবেন।';

  @override
  String requestUnder(String price) {
    return '$price-এর মধ্যে';
  }

  @override
  String requestMatches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এখন $countটি কপি বিক্রিতে আছে',
      zero: 'এখনো কোনো কপি বিক্রিতে নেই',
    );
    return '$_temp0';
  }

  @override
  String get requestSeeCopies => 'কপিগুলো দেখুন';

  @override
  String get requestClose => 'বন্ধ করুন';

  @override
  String get requestClosed => 'বন্ধ';

  @override
  String get requestClosedDone => 'অনুরোধ বন্ধ করা হয়েছে।';

  @override
  String get requestWantedTitle => 'পাঠকেরা আপনার বই চান';

  @override
  String requestWantedLine(String name, String title) {
    return '$name খুঁজছেন $title';
  }

  @override
  String get requestOpenListing => 'আপনার লিস্টিং';

  @override
  String get sellBackTitle => 'ওয়ারাকাহকে বই ফেরত বিক্রি';

  @override
  String get sellBackIntro =>
      'আপনার বইয়ের সঙ্গে সঙ্গে দাম জানুন। কুরিয়ার বইটি নিয়ে যাবে, আমরা যাচাই করব, টাকা যাবে আপনার ওয়ালেটে।';

  @override
  String get sellBackFindLabel => 'কোন বই?';

  @override
  String get sellBackFindHint => 'নাম বা লেখক';

  @override
  String get sellBackNoBooks =>
      'কোনো বই পাওয়া যায়নি। ওয়ারাকাহ তার ক্যাটালগের ছাপা বই ফেরত কেনে।';

  @override
  String get sellBackChange => 'বদলান';

  @override
  String get sellBackCondition => 'বইয়ের অবস্থা';

  @override
  String sellBackQuote(String price) {
    return 'ওয়ারাকাহ দেবে $price';
  }

  @override
  String get sellBackQuoteNote =>
      'যাচাইয়ে অবস্থা ভিন্ন হলে দাম আমাদের গ্রেড অনুযায়ী হবে।';

  @override
  String get sellBackAddress => 'বই নেওয়ার ঠিকানা';

  @override
  String get sellBackAddressHint => 'বাসা, রোড, এলাকা';

  @override
  String sellBackAccept(String price) {
    return '$price নিন ও পিকআপ বুক করুন';
  }

  @override
  String get sellBackBooked =>
      'পিকআপ বুক হয়েছে। বই যাচাইয়ের পর আপনার ওয়ালেটে টাকা দেব।';

  @override
  String get sellBackMine => 'আমার ফেরত বিক্রি';

  @override
  String get sellBackEmpty => 'এখনো কিছু ফেরত বিক্রি হয়নি।';

  @override
  String get sellBackStatusScheduled => 'পিকআপ বুক হয়েছে';

  @override
  String get sellBackStatusPickedUp => 'যাচাই হচ্ছে';

  @override
  String sellBackStatusPaid(String price) {
    return '$price দেওয়া হয়েছে';
  }

  @override
  String get sellBackStatusReturned => 'আপনাকে ফেরত পাঠানো হয়েছে';

  @override
  String sellBackQuoted(String price) {
    return 'প্রস্তাবিত $price';
  }

  @override
  String sellBackFrom(String name) {
    return 'বিক্রেতা: $name';
  }

  @override
  String sellBackReaderSays(String condition) {
    return 'পাঠক বলেছেন: $condition';
  }

  @override
  String get sellBackGradeAs => 'আমাদের গ্রেড';

  @override
  String sellBackPayAndPublish(String pay, String resell) {
    return '$pay দিন · $resell-এ বিক্রি';
  }

  @override
  String get sellBackReturn => 'ফেরত পাঠান';

  @override
  String get sellBackGraded =>
      'টাকা দেওয়া হয়েছে, সার্টিফায়েড ইউজড হিসেবে বিক্রিতে।';

  @override
  String get sellBackReturned => 'পাঠককে ফেরত পাঠানো হয়েছে।';

  @override
  String get sellBackAdminTitle => 'ট্রেড-ইন';

  @override
  String get sellBackAdminHint =>
      'ফেরত কেনা বই গ্রেড করে সার্টিফায়েড ইউজড হিসেবে প্রকাশ করুন';

  @override
  String get sellBackAdminEmpty => 'গ্রেড করার মতো কোনো বই নেই।';

  @override
  String get usedMarketTitle => 'পি২পি মার্কেটপ্লেস';

  @override
  String get usedSearchHint => 'পুরোনো বই খুঁজুন...';

  @override
  String get usedHandledTitle => 'ওয়ারাকাহকে দায়িত্ব দিন';

  @override
  String get usedHandledBody =>
      'অ্যাপে টাকা দিন, কুরিয়ার বই পৌঁছে দেবে। বই বর্ণনামতো কিনা নিশ্চিত না করা পর্যন্ত টাকা ওয়ারাকাহর কাছে থাকবে।';

  @override
  String usedHandledBuy(String price) {
    return '$price-এ কিনুন';
  }

  @override
  String get usedBuyTitle => 'ওয়ারাকাহর মাধ্যমে কিনুন';

  @override
  String get usedBuyBook => 'বই';

  @override
  String get usedBuyDelivery => 'কুরিয়ার ডেলিভারি';

  @override
  String get usedBuyTotal => 'আপনি দেবেন';

  @override
  String get usedBuyHeld =>
      'বই বর্ণনামতো কিনা নিশ্চিত না করা পর্যন্ত ওয়ারাকাহ এটি রাখবে।';

  @override
  String get usedBuyPayWith => 'যেভাবে দেবেন';

  @override
  String get usedBuyNoCod =>
      'ক্যাশ অন ডেলিভারি নেই: নিশ্চিত না করা পর্যন্ত টাকা ওয়ারাকাহর কাছে থাকে।';

  @override
  String usedBuyPay(String price) {
    return '$price দিন';
  }

  @override
  String get usedBuyUnavailable => 'এই বইটি আর বিক্রিতে নেই।';

  @override
  String get usedSaleTitle => 'ওয়ারাকাহর মাধ্যমে বিক্রি';

  @override
  String usedSaleFrom(String name) {
    return '$name-এর কাছ থেকে';
  }

  @override
  String usedSaleTo(String name) {
    return '$name-এর কাছে';
  }

  @override
  String get usedSaleStatusPaid => 'পরিশোধিত';

  @override
  String get usedSaleStatusSent => 'পথে আছে';

  @override
  String get usedSaleStatusCompleted => 'সম্পন্ন';

  @override
  String get usedSaleStatusDisputed => 'বিরোধে';

  @override
  String get usedSaleStatusRefunded => 'ফেরত দেওয়া হয়েছে';

  @override
  String get usedSaleStatusReleased => 'বিক্রেতাকে দেওয়া হয়েছে';

  @override
  String get usedSaleStatusCancelled => 'বাতিল';

  @override
  String usedSaleHintBuyerPaid(String name, String price) {
    return 'ওয়ারাকাহ $price রাখছে। $name বইটি কুরিয়ারে দেবেন।';
  }

  @override
  String usedSaleHintSellerPaid(String name, String price) {
    return '$name টাকা দিয়েছেন। বইটি কুরিয়ারে দিয়ে \'পাঠানো হয়েছে\' চাপুন। তাঁরা নিশ্চিত করলে আপনি $price পাবেন।';
  }

  @override
  String get usedSaleHintBuyerSent =>
      'বই এলে দেখে নিন। বর্ণনামতো হলে নিশ্চিত করুন, না হলে সমস্যা জানান।';

  @override
  String usedSaleHintSellerSent(String name, String price) {
    return '$name-এর কাছে যাচ্ছে। তাঁরা নিশ্চিত করলে ওয়ারাকাহ আপনাকে $price দেবে।';
  }

  @override
  String get usedSaleHintDisputed =>
      'একজন মডারেটর দেখছেন। সিদ্ধান্ত না হওয়া পর্যন্ত টাকা ওয়ারাকাহর কাছে থাকবে।';

  @override
  String usedSaleHintBuyerDone(String name) {
    return 'আপনি নিশ্চিত করেছেন, $name টাকা পেয়েছেন।';
  }

  @override
  String usedSaleHintSellerDone(String price) {
    return '$price আপনার। পরের পেআউটে পাঠানো হবে।';
  }

  @override
  String usedSaleHintBuyerRefunded(String price) {
    return 'একজন মডারেটর টাকা ফেরত দিয়েছেন: $price আপনার ওয়ালেটে।';
  }

  @override
  String get usedSaleHintSellerRefunded =>
      'একজন মডারেটর ক্রেতাকে টাকা ফেরত দিয়েছেন। বইটি আপনার কাছে ফিরবে।';

  @override
  String get usedSaleHintBuyerReleased =>
      'একজন মডারেটর বিক্রেতার পক্ষে সিদ্ধান্ত দিয়ে তাঁকে টাকা দিয়েছেন।';

  @override
  String usedSaleHintSellerReleased(String price) {
    return 'একজন মডারেটর আপনার পক্ষে সিদ্ধান্ত দিয়েছেন: $price আপনার।';
  }

  @override
  String get usedSaleHintCancelled =>
      'পাঠানোর আগে বাতিল হয়েছে। টাকা ক্রেতার ওয়ালেটে ফিরে গেছে।';

  @override
  String get usedSaleSend => 'পাঠানো হয়েছে';

  @override
  String get usedSaleCancel => 'বাতিল করে টাকা ফেরত নিন';

  @override
  String get usedSaleConfirm => 'বর্ণনামতো পেয়েছি';

  @override
  String get usedSaleProblem => 'সমস্যা জানান';

  @override
  String get usedSaleFee => 'ওয়ারাকাহ ফি (৫%)';

  @override
  String get usedSaleYouGet => 'আপনি পাবেন';

  @override
  String get usedDisputeTitle => 'বইটিতে কী সমস্যা?';

  @override
  String get usedDisputeNotAsDescribed => 'বর্ণনামতো নয়';

  @override
  String get usedDisputeDamaged => 'ক্ষতিগ্রস্ত';

  @override
  String get usedDisputePhotocopy => 'এটি ফটোকপি';

  @override
  String get usedDisputeWrongBook => 'ভুল বই';

  @override
  String get usedDisputeNotReceived => 'বই পৌঁছায়নি';

  @override
  String get usedDisputeNoteHint => 'মডারেটরকে কী হয়েছে বলুন';

  @override
  String get usedDisputeSend => 'মডারেটরকে পাঠান';

  @override
  String get usedDisputeSent => 'পাঠানো হয়েছে। একজন মডারেটর দেখবেন।';

  @override
  String get usedSalesTitle => 'ওয়ারাকাহর মাধ্যমে কেনাবেচা';

  @override
  String get usedSalesBuying => 'কিনছেন';

  @override
  String get usedSalesSelling => 'বেচছেন';

  @override
  String get usedSalesEmpty =>
      'এখনো কিছু নেই। পুরোনো বইয়ে \"ওয়ারাকাহকে দায়িত্ব দিন\" বেছে নিন।';

  @override
  String get usedEarningsTitle => 'আয়';

  @override
  String get usedEarningsHeld => 'ওয়ারাকাহর কাছে';

  @override
  String get usedEarningsEarned => 'আয় হয়েছে';

  @override
  String get usedEarningsPaidOut => 'পাঠানো হয়েছে';

  @override
  String get usedEarningsAvailable => 'পাঠানোর জন্য প্রস্তুত';

  @override
  String usedEarningsPayout(String price) {
    return '$price আমার বিকাশে পাঠান';
  }

  @override
  String usedEarningsPaid(String price) {
    return '$price আপনার বিকাশে যাচ্ছে।';
  }

  @override
  String get usedEarningsPayouts => 'পেআউট';

  @override
  String get usedEarningsNoPayouts => 'এখনো কোনো পেআউট নেই।';

  @override
  String usedEarningsPayoutLine(String price) {
    return 'বিকাশে $price';
  }

  @override
  String usedDisputeCase(String buyer, String seller) {
    return '$buyer কিনেছেন $seller-এর কাছ থেকে';
  }

  @override
  String usedDisputeHeld(String price) {
    return 'ওয়ারাকাহর কাছে $price';
  }

  @override
  String get usedDisputeRefund => 'ক্রেতাকে ফেরত দিন';

  @override
  String get usedDisputePaySeller => 'বিক্রেতাকে দিন';

  @override
  String get moderationLogRefunded => 'ক্রেতাকে ফেরত দিয়েছেন:';

  @override
  String get moderationLogPaidSeller => 'বিক্রেতাকে দিয়েছেন:';

  @override
  String get usedListingTitle => 'পুরোনো বই';

  @override
  String get usedListingMissing => 'এই লিস্টিং আর নেই।';

  @override
  String get usedStatusAvailable => 'পাওয়া যাচ্ছে';

  @override
  String get usedStatusReserved => 'সংরক্ষিত';

  @override
  String get usedNegotiable => 'দাম আলোচনাসাপেক্ষ';

  @override
  String get usedFixedPrice => 'নির্ধারিত দাম';

  @override
  String get usedPrefersMeetup => 'দেখা করে দিতে চান';

  @override
  String get usedPrefersCourier => 'কুরিয়ারে পাঠাতে চান';

  @override
  String get usedYourListing => 'আপনার লিস্টিং';

  @override
  String get usedMessage => 'মেসেজ';

  @override
  String get usedOpenChat => 'চ্যাট খুলুন';

  @override
  String usedSoldBy(String name, String place) {
    return '$name · $place';
  }

  @override
  String usedSaveVsNew(String amount) {
    return 'নতুনের চেয়ে $amount কম';
  }

  @override
  String get usedSellerNote => 'বিক্রেতার কথা';

  @override
  String usedConditionAndSafety(String condition) {
    return 'অবস্থা: $condition। টাকা দেওয়ার আগে বইটি দেখে নিন, আর ব্যস্ত কোনো প্রকাশ্য জায়গায় দেখা করুন।';
  }

  @override
  String usedOfferWaiting(String amount, String name) {
    return 'আপনার $amount-এর অফার $name-এর উত্তরের অপেক্ষায়।';
  }

  @override
  String get usedOffersAndMessages => 'অফার ও মেসেজ';

  @override
  String get usedNoOffersYet =>
      'এখনো কোনো অফার নেই। ক্রেতাদের অফার ও মেসেজ এখানে আর আপনার ইনবক্সে আসবে।';

  @override
  String get usedFilterCondition => 'অবস্থা';

  @override
  String get usedFilterAnyCondition => 'যেকোনো অবস্থা';

  @override
  String get usedFilterLocation => 'এলাকা';

  @override
  String get usedFilterAllLocations => 'সারা বাংলাদেশ';

  @override
  String get usedFilterDistrict => 'জেলা';

  @override
  String get usedFilterAllDistricts => 'সব জেলা';

  @override
  String get usedFilterSection => 'বিভাগ';

  @override
  String get usedFilterAllSections => 'সব বিভাগ';

  @override
  String get usedFilterCategory => 'ক্যাটাগরি';

  @override
  String get usedFilterAllCategories => 'সব ক্যাটাগরি';

  @override
  String get usedFilterPrice => 'দাম';

  @override
  String get usedFilterAnyPrice => 'যেকোনো দাম';

  @override
  String usedFilterUnder(String price) {
    return '$price-এর নিচে';
  }

  @override
  String get inboxTitle => 'ইনবক্স';

  @override
  String inboxUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি নতুন',
      zero: 'সব দেখা হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get inboxBuying => 'কিনছেন';

  @override
  String get inboxSelling => 'বিক্রি করছেন';

  @override
  String get inboxMissing => 'এই কথোপকথন আর নেই।';

  @override
  String get inboxEmptyTitle => 'এখনো কোনো অফার বা মেসেজ নেই';

  @override
  String get inboxEmptyBody =>
      'পুরোনো বইয়ে অফার দিলে, বা কেউ আপনার বই চাইলে, কথোপকথন এখানে দেখা যাবে।';

  @override
  String get inboxBrowse => 'পুরোনো বই দেখুন';

  @override
  String get chatHint => 'মেসেজ লিখুন';

  @override
  String get chatSend => 'পাঠান';

  @override
  String chatYou(String text) {
    return 'আপনি: $text';
  }

  @override
  String chatEventAcceptedByMe(String name, String amount) {
    return 'আপনি $name-এর $amount-এর অফার গ্রহণ করেছেন। বইটি $name-এর জন্য সংরক্ষিত।';
  }

  @override
  String chatEventAcceptedByThem(String name, String amount) {
    return '$name আপনার $amount-এর অফার গ্রহণ করেছেন। বইটি আপনার জন্য সংরক্ষিত।';
  }

  @override
  String chatEventDeclinedByMe(String name, String amount) {
    return 'আপনি $name-এর $amount-এর অফার ফিরিয়ে দিয়েছেন।';
  }

  @override
  String chatEventDeclinedByThem(String name, String amount) {
    return '$name আপনার $amount-এর অফার ফিরিয়ে দিয়েছেন।';
  }

  @override
  String get chatEventReservedElsewhere =>
      'বইটি এখন অন্য একজন ক্রেতার জন্য সংরক্ষিত।';

  @override
  String get chatEventAvailableByMe => 'আপনি বইটি আবার বিক্রির জন্য দিয়েছেন।';

  @override
  String chatEventAvailableByThem(String name) {
    return '$name বইটি আবার বিক্রির জন্য দিয়েছেন।';
  }

  @override
  String chatEventSoldByMe(String name) {
    return 'আপনি বইটি $name-এর কাছে বিক্রি হয়েছে বলে চিহ্নিত করেছেন।';
  }

  @override
  String chatEventSoldByThem(String name) {
    return '$name বইটি আপনার কাছে বিক্রি হয়েছে বলে চিহ্নিত করেছেন।';
  }

  @override
  String get chatEventSoldElsewhere =>
      'বইটি অন্য একজন ক্রেতার কাছে বিক্রি হয়েছে।';

  @override
  String get chatReservedForYou => 'আপনার জন্য সংরক্ষিত';

  @override
  String get chatPayOnHandover =>
      'সময় ও জায়গা এখানেই ঠিক করুন। হাতে পাওয়ার সময় সরাসরি বিক্রেতাকে টাকা দেবেন; ওয়ারাকাহ টাকা লেনদেন করে না।';

  @override
  String chatReservedFor(String name) {
    return '$name-এর জন্য সংরক্ষিত';
  }

  @override
  String chatSellerNext(String name) {
    return 'হস্তান্তর এখানেই ঠিক করুন। বই হাতে পৌঁছালে বিক্রি হয়েছে বলে চিহ্নিত করুন।';
  }

  @override
  String get chatBoughtIt => 'আপনি বইটি কিনেছেন';

  @override
  String chatSoldTo(String name) {
    return '$name-এর কাছে বিক্রি হয়েছে';
  }

  @override
  String get chatSoldElsewhere => 'অন্য ক্রেতার কাছে বিক্রি হয়েছে';

  @override
  String get chatReservedElsewhere => 'অন্য ক্রেতার জন্য সংরক্ষিত';

  @override
  String get chatMarkSold => 'বিক্রি হয়েছে';

  @override
  String get chatMakeAvailable => 'আবার বিক্রিতে দিন';

  @override
  String get chatMarkSoldTitle => 'বিক্রি হয়েছে বলে চিহ্নিত করবেন?';

  @override
  String chatMarkSoldBody(String name) {
    return '$name বই হাতে পাওয়ার পরই এটি করুন। অন্য ক্রেতারা জানবেন বইটি বিক্রি হয়ে গেছে।';
  }

  @override
  String get chatMakeAvailableTitle => 'বইটি আবার বিক্রিতে দেবেন?';

  @override
  String chatMakeAvailableBody(String name) {
    return '$name-এর সংরক্ষণ শেষ হবে, আর অন্য ক্রেতারা আবার অফার দিতে পারবেন।';
  }

  @override
  String get offerMake => 'অফার দিন';

  @override
  String offerTo(String name, String amount) {
    return '$name-কে · চাওয়া দাম $amount';
  }

  @override
  String get offerYourPrice => 'আপনার দাম (৳)';

  @override
  String offerFixedPrice(String name, String amount) {
    return '$name-এর $amount দাম আলোচনাসাপেক্ষ নয়।';
  }

  @override
  String offerTooHigh(String amount) {
    return '$amount বা তার কম অফার দিন।';
  }

  @override
  String get offerHandover => 'বইটি কীভাবে নিতে চান?';

  @override
  String get offerMeetup => 'দেখা করে';

  @override
  String get offerCourier => 'কুরিয়ারে';

  @override
  String offerSellerPrefers(String name, String method) {
    String _temp0 = intl.Intl.selectLogic(method, {
      'delivery': '$name কুরিয়ারে পাঠাতে চান।',
      'other': '$name দেখা করে দিতে চান।',
    });
    return '$_temp0';
  }

  @override
  String get offerSend => 'অফার পাঠান';

  @override
  String offerSent(String name) {
    return '$name-কে অফার পাঠানো হয়েছে';
  }

  @override
  String offerCardTitle(String amount) {
    return 'অফার · $amount';
  }

  @override
  String offerWaitingFor(String name) {
    return '$name-এর অপেক্ষায়';
  }

  @override
  String get offerStatusPending => 'অপেক্ষমাণ';

  @override
  String get offerStatusAccepted => 'গৃহীত';

  @override
  String get offerStatusDeclined => 'ফিরিয়ে দেওয়া';

  @override
  String get offerStatusClosed => 'বন্ধ';

  @override
  String get offerAccept => 'গ্রহণ করুন';

  @override
  String get offerDecline => 'ফিরিয়ে দিন';

  @override
  String get offerReservedHint =>
      'বইটি অন্য ক্রেতার জন্য সংরক্ষিত। এই অফার গ্রহণ করতে আগে বইটি আবার বিক্রিতে দিন।';

  @override
  String get sellerTitle => 'পাঠকের প্রোফাইল';

  @override
  String get sellerMissing => 'এই পাঠক মার্কেটপ্লেসে নেই।';

  @override
  String sellerMemberSince(String date) {
    return '$date থেকে সদস্য';
  }

  @override
  String sellerBooksSold(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বই বিক্রি',
      zero: 'এখনো কোনো বই বিক্রি হয়নি',
    );
    return '$_temp0';
  }

  @override
  String sellerRating(String average, int count) {
    return '$average · $countটি রেটিং';
  }

  @override
  String get sellerNoRatings => 'এখনো কোনো রেটিং নেই';

  @override
  String get sellerReviews => 'অন্যরা যা বলছেন';

  @override
  String get sellerOnSale => 'এখন বিক্রিতে';

  @override
  String get sellerNothingOnSale => 'এই মুহূর্তে কিছু বিক্রিতে নেই।';

  @override
  String get sellerSeeProfile => 'প্রোফাইল দেখুন';

  @override
  String chatRateTitle(String name) {
    return '$name-এর সাথে লেনদেন কেমন ছিল?';
  }

  @override
  String chatRateStars(int count) {
    return '$count তারা';
  }

  @override
  String get chatRateHint => 'দু-এক কথা (ঐচ্ছিক)';

  @override
  String get chatRateSend => 'রেটিং পাঠান';

  @override
  String chatRated(String name) {
    return 'ধন্যবাদ! এটি $name-এর প্রোফাইলে দেখা যাবে।';
  }

  @override
  String chatYouRated(String name) {
    return 'আপনি $name-কে রেটিং দিয়েছেন';
  }

  @override
  String chatTheyRated(String name) {
    return '$name আপনাকে রেটিং দিয়েছেন';
  }

  @override
  String chatNotRatedYet(String name) {
    return '$name এখনো আপনাকে রেটিং দেননি।';
  }
}
