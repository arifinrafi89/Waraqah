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
  String get homeAyahOfTheDay => 'আজকের আয়াত';

  @override
  String get homeAllBooks => 'সব বই';

  @override
  String get homeBeneficial => 'উপকারী';

  @override
  String get homeNonBeneficial => 'অনুপকারী';

  @override
  String get homeBookBites => 'বুক-বাইটস';

  @override
  String get homeBookBitesSub => 'পাঠকরা যা শেয়ার করছেন';

  @override
  String get homeNewBooks => 'নতুন বই';

  @override
  String get homeNewBooksSub => 'সব বিক্রেতার মধ্যে সবচেয়ে কম দাম';

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
  String get commonBest => 'সেরা';

  @override
  String get commonLowest => 'সর্বনিম্ন';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get commonSomethingWentWrong => 'কিছু ভুল হয়েছে';

  @override
  String get catalogTitle => 'ক্যাটালগ';

  @override
  String catalogSubtitle(String count) {
    return '$count বই · সব বিক্রেতা';
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
  String catalogVendorCompare(String vendor, int count) {
    return '$vendor · $count বিক্রেতার তুলনায়';
  }

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
}
