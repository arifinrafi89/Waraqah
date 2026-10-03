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
  /// **'Post'**
  String get bitesPost;

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

  /// No description provided for @bitesForYou.
  ///
  /// In en, this message translates to:
  /// **'For You'**
  String get bitesForYou;

  /// No description provided for @bitesFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get bitesFollowing;

  /// No description provided for @bitesFollowingLogin.
  ///
  /// In en, this message translates to:
  /// **'Log in to see Bites from readers you follow.'**
  String get bitesFollowingLogin;

  /// No description provided for @bitesLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get bitesLogIn;

  /// No description provided for @bitesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No Bites here yet.'**
  String get bitesEmpty;

  /// No description provided for @bitesFollowingEmpty.
  ///
  /// In en, this message translates to:
  /// **'Follow readers to see their Bites here.'**
  String get bitesFollowingEmpty;

  /// No description provided for @bitesEdited.
  ///
  /// In en, this message translates to:
  /// **'edited'**
  String get bitesEdited;

  /// No description provided for @bitesNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get bitesNow;

  /// No description provided for @bitesMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{n}m'**
  String bitesMinutesAgo(int n);

  /// No description provided for @bitesHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{n}h'**
  String bitesHoursAgo(int n);

  /// No description provided for @bitesDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{n}d'**
  String bitesDaysAgo(int n);

  /// No description provided for @bitesComments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get bitesComments;

  /// No description provided for @bitesShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get bitesShare;

  /// No description provided for @bitesCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied. Paste it anywhere to share.'**
  String get bitesCopied;

  /// No description provided for @bitesMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get bitesMore;

  /// No description provided for @bitesEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get bitesEdit;

  /// No description provided for @bitesDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get bitesDelete;

  /// No description provided for @bitesDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this Bite?'**
  String get bitesDeleteConfirm;

  /// No description provided for @bitesDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'Its comments are deleted too.'**
  String get bitesDeleteBody;

  /// No description provided for @bitesCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get bitesCancel;

  /// No description provided for @bitesDeleted.
  ///
  /// In en, this message translates to:
  /// **'Bite deleted.'**
  String get bitesDeleted;

  /// No description provided for @bitesMakeQuote.
  ///
  /// In en, this message translates to:
  /// **'Make a quote card'**
  String get bitesMakeQuote;

  /// No description provided for @bitesSpoilerAbout.
  ///
  /// In en, this message translates to:
  /// **'Spoiler about {title}: tap to show'**
  String bitesSpoilerAbout(String title);

  /// No description provided for @bitesComposeTitle.
  ///
  /// In en, this message translates to:
  /// **'New Bite'**
  String get bitesComposeTitle;

  /// No description provided for @bitesEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Bite'**
  String get bitesEditTitle;

  /// No description provided for @bitesTagBook.
  ///
  /// In en, this message translates to:
  /// **'Tag a book'**
  String get bitesTagBook;

  /// No description provided for @bitesTagHint.
  ///
  /// In en, this message translates to:
  /// **'Search by title or author'**
  String get bitesTagHint;

  /// No description provided for @bitesRemoveTag.
  ///
  /// In en, this message translates to:
  /// **'Remove tag'**
  String get bitesRemoveTag;

  /// No description provided for @bitesSpoiler.
  ///
  /// In en, this message translates to:
  /// **'Spoiler'**
  String get bitesSpoiler;

  /// No description provided for @bitesSpoilerHint.
  ///
  /// In en, this message translates to:
  /// **'Blurred until readers tap it. Needs a book tag.'**
  String get bitesSpoilerHint;

  /// No description provided for @bitesSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get bitesSave;

  /// No description provided for @bitesSaved.
  ///
  /// In en, this message translates to:
  /// **'Bite saved.'**
  String get bitesSaved;

  /// No description provided for @bitesTooLong.
  ///
  /// In en, this message translates to:
  /// **'Too long: {max} characters at most.'**
  String bitesTooLong(int max);

  /// No description provided for @bitesWrite.
  ///
  /// In en, this message translates to:
  /// **'Write a Bite'**
  String get bitesWrite;

  /// No description provided for @bitesBite.
  ///
  /// In en, this message translates to:
  /// **'Bite'**
  String get bitesBite;

  /// No description provided for @bitesNoComments.
  ///
  /// In en, this message translates to:
  /// **'No comments yet. Start the conversation.'**
  String get bitesNoComments;

  /// No description provided for @bitesCommentHint.
  ///
  /// In en, this message translates to:
  /// **'Write a comment…'**
  String get bitesCommentHint;

  /// No description provided for @bitesReply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get bitesReply;

  /// No description provided for @bitesReplyingTo.
  ///
  /// In en, this message translates to:
  /// **'Replying to {name}'**
  String bitesReplyingTo(String name);

  /// No description provided for @bitesCancelReply.
  ///
  /// In en, this message translates to:
  /// **'Cancel reply'**
  String get bitesCancelReply;

  /// No description provided for @bitesLogInToComment.
  ///
  /// In en, this message translates to:
  /// **'Log in to comment'**
  String get bitesLogInToComment;

  /// No description provided for @bitesSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get bitesSend;

  /// No description provided for @bitesDeleteComment.
  ///
  /// In en, this message translates to:
  /// **'Delete comment'**
  String get bitesDeleteComment;

  /// No description provided for @bitesCommentDeleted.
  ///
  /// In en, this message translates to:
  /// **'Comment deleted.'**
  String get bitesCommentDeleted;

  /// No description provided for @bitesAboutBook.
  ///
  /// In en, this message translates to:
  /// **'Bites about this book'**
  String get bitesAboutBook;

  /// No description provided for @bitesPostAboutBook.
  ///
  /// In en, this message translates to:
  /// **'Post a Bite about this book'**
  String get bitesPostAboutBook;

  /// No description provided for @bitesNoneAboutBook.
  ///
  /// In en, this message translates to:
  /// **'No Bites about this book yet.'**
  String get bitesNoneAboutBook;

  /// No description provided for @bitesSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get bitesSeeAll;

  /// No description provided for @reviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviewTitle;

  /// No description provided for @reviewSummary.
  ///
  /// In en, this message translates to:
  /// **'{average} · {count, plural, =1{1 review} other{{count} reviews}}'**
  String reviewSummary(String average, int count);

  /// No description provided for @reviewNone.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet. Be the first.'**
  String get reviewNone;

  /// No description provided for @reviewWrite.
  ///
  /// In en, this message translates to:
  /// **'Write a review'**
  String get reviewWrite;

  /// No description provided for @reviewEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit your review'**
  String get reviewEdit;

  /// No description provided for @reviewVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified Purchase'**
  String get reviewVerified;

  /// No description provided for @reviewYourRating.
  ///
  /// In en, this message translates to:
  /// **'Your rating'**
  String get reviewYourRating;

  /// No description provided for @reviewStar.
  ///
  /// In en, this message translates to:
  /// **'{n} of 5 stars'**
  String reviewStar(int n);

  /// No description provided for @reviewTextHint.
  ///
  /// In en, this message translates to:
  /// **'What did you think? (optional)'**
  String get reviewTextHint;

  /// No description provided for @reviewSave.
  ///
  /// In en, this message translates to:
  /// **'Save review'**
  String get reviewSave;

  /// No description provided for @reviewSaved.
  ///
  /// In en, this message translates to:
  /// **'Review saved.'**
  String get reviewSaved;

  /// No description provided for @reviewDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get reviewDelete;

  /// No description provided for @reviewDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete your review?'**
  String get reviewDeleteConfirm;

  /// No description provided for @reviewDeleted.
  ///
  /// In en, this message translates to:
  /// **'Review deleted.'**
  String get reviewDeleted;

  /// No description provided for @reviewCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get reviewCancel;

  /// No description provided for @reviewMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get reviewMore;

  /// No description provided for @reviewYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get reviewYou;

  /// No description provided for @reviewEdited.
  ///
  /// In en, this message translates to:
  /// **'edited'**
  String get reviewEdited;

  /// No description provided for @readerTitle.
  ///
  /// In en, this message translates to:
  /// **'Reader'**
  String get readerTitle;

  /// No description provided for @readerMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String readerMemberSince(String date);

  /// No description provided for @readerFollowers.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 follower} other{{count} followers}}'**
  String readerFollowers(int count);

  /// No description provided for @readerFollowingCount.
  ///
  /// In en, this message translates to:
  /// **'{count} following'**
  String readerFollowingCount(int count);

  /// No description provided for @readerFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get readerFollow;

  /// No description provided for @readerFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get readerFollowing;

  /// No description provided for @readerSeeBooks.
  ///
  /// In en, this message translates to:
  /// **'See their books for sale ({count})'**
  String readerSeeBooks(int count);

  /// No description provided for @readerBites.
  ///
  /// In en, this message translates to:
  /// **'Bites'**
  String get readerBites;

  /// No description provided for @readerNoBites.
  ///
  /// In en, this message translates to:
  /// **'No Bites yet.'**
  String get readerNoBites;

  /// No description provided for @readerPrivate.
  ///
  /// In en, this message translates to:
  /// **'This reader keeps their profile private.'**
  String get readerPrivate;

  /// No description provided for @readerSeeBites.
  ///
  /// In en, this message translates to:
  /// **'See their Bites'**
  String get readerSeeBites;

  /// No description provided for @readerYourPage.
  ///
  /// In en, this message translates to:
  /// **'Your Reader page'**
  String get readerYourPage;

  /// No description provided for @quoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Quote card'**
  String get quoteTitle;

  /// No description provided for @quoteHint.
  ///
  /// In en, this message translates to:
  /// **'Type a line you loved'**
  String get quoteHint;

  /// No description provided for @quoteStyle.
  ///
  /// In en, this message translates to:
  /// **'Style'**
  String get quoteStyle;

  /// No description provided for @quoteStylePaper.
  ///
  /// In en, this message translates to:
  /// **'Paper'**
  String get quoteStylePaper;

  /// No description provided for @quoteStyleInk.
  ///
  /// In en, this message translates to:
  /// **'Ink'**
  String get quoteStyleInk;

  /// No description provided for @quoteStyleLeaf.
  ///
  /// In en, this message translates to:
  /// **'Leaf'**
  String get quoteStyleLeaf;

  /// No description provided for @quoteStyleCover.
  ///
  /// In en, this message translates to:
  /// **'Cover'**
  String get quoteStyleCover;

  /// No description provided for @quoteShare.
  ///
  /// In en, this message translates to:
  /// **'Share image'**
  String get quoteShare;

  /// No description provided for @quoteMark.
  ///
  /// In en, this message translates to:
  /// **'Waraqah'**
  String get quoteMark;

  /// No description provided for @bitesYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get bitesYou;

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
  /// **'Email'**
  String get authEmailOrPhone;

  /// No description provided for @authEmailOrPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
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

  /// No description provided for @authWrongCode.
  ///
  /// In en, this message translates to:
  /// **'Wrong code. Try again.'**
  String get authWrongCode;

  /// No description provided for @authWrongCredentials.
  ///
  /// In en, this message translates to:
  /// **'Wrong email or password.'**
  String get authWrongCredentials;

  /// No description provided for @authGoogleFailed.
  ///
  /// In en, this message translates to:
  /// **'Google sign-in did not work. Try again.'**
  String get authGoogleFailed;

  /// No description provided for @authSignUpRefused.
  ///
  /// In en, this message translates to:
  /// **'We could not start sign-up with that email. It may already have an account.'**
  String get authSignUpRefused;

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

  /// No description provided for @homeSeasonRamadan.
  ///
  /// In en, this message translates to:
  /// **'Ramadan'**
  String get homeSeasonRamadan;

  /// No description provided for @homeSeasonBoiMela.
  ///
  /// In en, this message translates to:
  /// **'Boi Mela'**
  String get homeSeasonBoiMela;

  /// No description provided for @homeSeasonAdmission.
  ///
  /// In en, this message translates to:
  /// **'Admission season'**
  String get homeSeasonAdmission;

  /// No description provided for @homeSeasonBackToSchool.
  ///
  /// In en, this message translates to:
  /// **'Back to school'**
  String get homeSeasonBackToSchool;

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

  /// No description provided for @searchDidYouMean.
  ///
  /// In en, this message translates to:
  /// **'Did you mean {title}?'**
  String searchDidYouMean(String title);

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

  /// No description provided for @sectionClassRow.
  ///
  /// In en, this message translates to:
  /// **'Class'**
  String get sectionClassRow;

  /// No description provided for @sectionExamRow.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get sectionExamRow;

  /// No description provided for @sectionSubjectRow.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get sectionSubjectRow;

  /// No description provided for @sectionClassChip.
  ///
  /// In en, this message translates to:
  /// **'Class {n}'**
  String sectionClassChip(int n);

  /// No description provided for @sectionExamSsc.
  ///
  /// In en, this message translates to:
  /// **'SSC'**
  String get sectionExamSsc;

  /// No description provided for @sectionExamHsc.
  ///
  /// In en, this message translates to:
  /// **'HSC'**
  String get sectionExamHsc;

  /// No description provided for @sectionExamAdmission.
  ///
  /// In en, this message translates to:
  /// **'Admission'**
  String get sectionExamAdmission;

  /// No description provided for @sectionExamBcs.
  ///
  /// In en, this message translates to:
  /// **'BCS'**
  String get sectionExamBcs;

  /// No description provided for @sectionFilterEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books for this choice yet.'**
  String get sectionFilterEmpty;

  /// No description provided for @sectionClearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get sectionClearFilters;

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

  /// No description provided for @expertPicksTitle.
  ///
  /// In en, this message translates to:
  /// **'Expert Picks'**
  String get expertPicksTitle;

  /// No description provided for @expertPicksSub.
  ///
  /// In en, this message translates to:
  /// **'Shelves from verified teachers, scholars and writers'**
  String get expertPicksSub;

  /// No description provided for @expertBy.
  ///
  /// In en, this message translates to:
  /// **'by {name}'**
  String expertBy(String name);

  /// No description provided for @expertPickedBy.
  ///
  /// In en, this message translates to:
  /// **'Picked by {name}'**
  String expertPickedBy(String name);

  /// No description provided for @expertVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get expertVerified;

  /// No description provided for @expertKindTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get expertKindTeacher;

  /// No description provided for @expertKindScholar.
  ///
  /// In en, this message translates to:
  /// **'Scholar'**
  String get expertKindScholar;

  /// No description provided for @expertKindWriter.
  ///
  /// In en, this message translates to:
  /// **'Writer'**
  String get expertKindWriter;

  /// No description provided for @expertTheirPicks.
  ///
  /// In en, this message translates to:
  /// **'Their picks'**
  String get expertTheirPicks;

  /// No description provided for @booklistKindClassList.
  ///
  /// In en, this message translates to:
  /// **'Class list'**
  String get booklistKindClassList;

  /// No description provided for @booklistKindExamPrep.
  ///
  /// In en, this message translates to:
  /// **'Exam prep'**
  String get booklistKindExamPrep;

  /// No description provided for @booklistKindBookClub.
  ///
  /// In en, this message translates to:
  /// **'Book club'**
  String get booklistKindBookClub;

  /// No description provided for @booklistKindPersonal.
  ///
  /// In en, this message translates to:
  /// **'My list'**
  String get booklistKindPersonal;

  /// No description provided for @booklistPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Add books'**
  String get booklistPickerTitle;

  /// No description provided for @booklistPickerDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get booklistPickerDone;

  /// No description provided for @booklistPickerEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books match.'**
  String get booklistPickerEmpty;

  /// No description provided for @booklistTitle.
  ///
  /// In en, this message translates to:
  /// **'Booklists'**
  String get booklistTitle;

  /// No description provided for @booklistEntrySub.
  ///
  /// In en, this message translates to:
  /// **'Class lists, exam prep, book clubs and your own lists'**
  String get booklistEntrySub;

  /// No description provided for @booklistProfileLink.
  ///
  /// In en, this message translates to:
  /// **'My booklists'**
  String get booklistProfileLink;

  /// No description provided for @booklistMine.
  ///
  /// In en, this message translates to:
  /// **'My lists'**
  String get booklistMine;

  /// No description provided for @booklistNew.
  ///
  /// In en, this message translates to:
  /// **'New list'**
  String get booklistNew;

  /// No description provided for @booklistMineEmpty.
  ///
  /// In en, this message translates to:
  /// **'No lists yet. Make one for books you want to buy together.'**
  String get booklistMineEmpty;

  /// No description provided for @booklistGuestHint.
  ///
  /// In en, this message translates to:
  /// **'Log in to make your own lists.'**
  String get booklistGuestHint;

  /// No description provided for @booklistGroupClassLists.
  ///
  /// In en, this message translates to:
  /// **'Class lists'**
  String get booklistGroupClassLists;

  /// No description provided for @booklistNewTotal.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{New: {price} for 1 book} other{New: {price} for {count} books}}'**
  String booklistNewTotal(int count, String price);

  /// No description provided for @booklistPriceNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get booklistPriceNew;

  /// No description provided for @booklistPriceCertified.
  ///
  /// In en, this message translates to:
  /// **'Certified Used'**
  String get booklistPriceCertified;

  /// No description provided for @booklistPriceUsed.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get booklistPriceUsed;

  /// No description provided for @booklistAddAll.
  ///
  /// In en, this message translates to:
  /// **'Add whole list to cart'**
  String get booklistAddAll;

  /// No description provided for @booklistAdded.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Nothing added} =1{Added 1 book} other{Added {count} books}}'**
  String booklistAdded(int count);

  /// No description provided for @booklistOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'{count} out of stock'**
  String booklistOutOfStock(int count);

  /// No description provided for @booklistAddBooks.
  ///
  /// In en, this message translates to:
  /// **'Add books'**
  String get booklistAddBooks;

  /// No description provided for @booklistRemoveBook.
  ///
  /// In en, this message translates to:
  /// **'Remove from list'**
  String get booklistRemoveBook;

  /// No description provided for @booklistEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books in this list yet.'**
  String get booklistEmpty;

  /// No description provided for @booklistRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get booklistRename;

  /// No description provided for @booklistDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete list'**
  String get booklistDelete;

  /// No description provided for @booklistDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this list?'**
  String get booklistDeleteConfirm;

  /// No description provided for @booklistDeleted.
  ///
  /// In en, this message translates to:
  /// **'List deleted'**
  String get booklistDeleted;

  /// No description provided for @booklistNameHint.
  ///
  /// In en, this message translates to:
  /// **'List name'**
  String get booklistNameHint;

  /// No description provided for @booklistCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get booklistCancel;

  /// No description provided for @booklistSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get booklistSave;

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

  /// No description provided for @walletSaleRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund for used book: {book}'**
  String walletSaleRefund(String book);

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

  /// No description provided for @orderBuyAgain.
  ///
  /// In en, this message translates to:
  /// **'Buy again'**
  String get orderBuyAgain;

  /// No description provided for @orderBackInCart.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 book is back in your cart.} other{{count} books are back in your cart.}}'**
  String orderBackInCart(int count);

  /// No description provided for @orderSomeUnavailable.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 can\'t be bought again right now.} other{{count} can\'t be bought again right now.}}'**
  String orderSomeUnavailable(int count);

  /// No description provided for @orderNoneAvailable.
  ///
  /// In en, this message translates to:
  /// **'None of these books can be bought again right now.'**
  String get orderNoneAvailable;

  /// No description provided for @orderInvoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get orderInvoice;

  /// No description provided for @orderInvoiceSeller.
  ///
  /// In en, this message translates to:
  /// **'Waraqah · Invoice'**
  String get orderInvoiceSeller;

  /// No description provided for @orderInvoiceQuantity.
  ///
  /// In en, this message translates to:
  /// **'{count} × {price}'**
  String orderInvoiceQuantity(int count, String price);

  /// No description provided for @orderInvoiceShipTo.
  ///
  /// In en, this message translates to:
  /// **'Ship to'**
  String get orderInvoiceShipTo;

  /// No description provided for @orderInvoiceThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you for reading with Waraqah.'**
  String get orderInvoiceThanks;

  /// No description provided for @orderReturnPolicy.
  ///
  /// In en, this message translates to:
  /// **'Return policy'**
  String get orderReturnPolicy;

  /// No description provided for @orderPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Returns and refunds'**
  String get orderPolicyTitle;

  /// No description provided for @orderPolicyWhenTitle.
  ///
  /// In en, this message translates to:
  /// **'Within 7 days of delivery'**
  String get orderPolicyWhenTitle;

  /// No description provided for @orderPolicyWhen.
  ///
  /// In en, this message translates to:
  /// **'Ask for a return from the order\'s page within 7 days of delivery. The button is there while the window is open.'**
  String get orderPolicyWhen;

  /// No description provided for @orderPolicyWhatTitle.
  ///
  /// In en, this message translates to:
  /// **'What can go back'**
  String get orderPolicyWhatTitle;

  /// No description provided for @orderPolicyWhat.
  ///
  /// In en, this message translates to:
  /// **'Printed books that arrived damaged, or the wrong book. For anything else, choose “Something else” and tell us what happened. Certified Used copies follow the same rules. eBooks can\'t be returned once they\'re in your library.'**
  String get orderPolicyWhat;

  /// No description provided for @orderPolicyHowTitle.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get orderPolicyHowTitle;

  /// No description provided for @orderPolicyHow.
  ///
  /// In en, this message translates to:
  /// **'Add up to 3 photos of the problem. We reply within 2 days, on the order\'s page. Once it\'s approved, we pick the book up from your address.'**
  String get orderPolicyHow;

  /// No description provided for @orderPolicyMoneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your money'**
  String get orderPolicyMoneyTitle;

  /// No description provided for @orderPolicyMoney.
  ///
  /// In en, this message translates to:
  /// **'When a return is approved, the price of the books goes to your Waraqah wallet, ready for your next order. Delivery and gift wrap aren\'t refunded.'**
  String get orderPolicyMoney;

  /// No description provided for @orderPolicyCancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancelling instead'**
  String get orderPolicyCancelTitle;

  /// No description provided for @orderPolicyCancel.
  ///
  /// In en, this message translates to:
  /// **'Until your order ships, you can cancel it from the order\'s page. Everything you paid goes back to your wallet.'**
  String get orderPolicyCancel;

  /// No description provided for @orderPolicyUsedTitle.
  ///
  /// In en, this message translates to:
  /// **'Books from other readers'**
  String get orderPolicyUsedTitle;

  /// No description provided for @orderPolicyUsed.
  ///
  /// In en, this message translates to:
  /// **'Copies you buy from other readers aren\'t sold by Waraqah, so they can\'t be returned here. Check the copy before you pay the seller.'**
  String get orderPolicyUsed;

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
  /// **'Answers from Waraqah\'s catalog'**
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
  /// **'Seerah for beginners'**
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

  /// No description provided for @aiPromptHadith.
  ///
  /// In en, this message translates to:
  /// **'Hadith collections'**
  String get aiPromptHadith;

  /// No description provided for @aiPromptQuran.
  ///
  /// In en, this message translates to:
  /// **'Quran and tafsir'**
  String get aiPromptQuran;

  /// No description provided for @aiPromptHistory.
  ///
  /// In en, this message translates to:
  /// **'Islamic history'**
  String get aiPromptHistory;

  /// No description provided for @aiBasketTotal.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 book} other{{count} books}} · {total} in all'**
  String aiBasketTotal(int count, String total);

  /// No description provided for @aiBasketAddAll.
  ///
  /// In en, this message translates to:
  /// **'Add all to cart'**
  String get aiBasketAddAll;

  /// No description provided for @aiBasketAdded.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 book added to your cart} other{{count} books added to your cart}}'**
  String aiBasketAdded(int count);

  /// No description provided for @aiPromptClass.
  ///
  /// In en, this message translates to:
  /// **'Books for Class 9 under ৳1,000'**
  String get aiPromptClass;

  /// No description provided for @aiPromptPlain.
  ///
  /// In en, this message translates to:
  /// **'Short seerah for beginners in Bangla'**
  String get aiPromptPlain;

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

  /// No description provided for @profileRemovePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get profileRemovePhoto;

  /// No description provided for @profileNameLength.
  ///
  /// In en, this message translates to:
  /// **'Your name must be {min}–{max} characters.'**
  String profileNameLength(int min, int max);

  /// No description provided for @profilePhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a Bangladesh mobile number, like 01712345678.'**
  String get profilePhoneInvalid;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

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

  /// No description provided for @profileAddressLabelHint.
  ///
  /// In en, this message translates to:
  /// **'Home, Office…'**
  String get profileAddressLabelHint;

  /// No description provided for @profileRecipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient\'s name'**
  String get profileRecipient;

  /// No description provided for @profileDefaultAddress.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get profileDefaultAddress;

  /// No description provided for @profileMakeDefault.
  ///
  /// In en, this message translates to:
  /// **'Make default'**
  String get profileMakeDefault;

  /// No description provided for @profileAddNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add a new address'**
  String get profileAddNewAddress;

  /// No description provided for @profileAddressLabelMissing.
  ///
  /// In en, this message translates to:
  /// **'Give this address a name, like Home.'**
  String get profileAddressLabelMissing;

  /// No description provided for @profileRecipientMissing.
  ///
  /// In en, this message translates to:
  /// **'Enter who will receive the parcel.'**
  String get profileRecipientMissing;

  /// No description provided for @profileAddressLineMissing.
  ///
  /// In en, this message translates to:
  /// **'Enter the house, road and area.'**
  String get profileAddressLineMissing;

  /// No description provided for @profileAddressPlaceMissing.
  ///
  /// In en, this message translates to:
  /// **'Pick the division, district and upazila.'**
  String get profileAddressPlaceMissing;

  /// No description provided for @profileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileNotifications;

  /// No description provided for @profileNotifyOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders and returns'**
  String get profileNotifyOrders;

  /// No description provided for @profileNotifyUsedBooks.
  ///
  /// In en, this message translates to:
  /// **'Used books'**
  String get profileNotifyUsedBooks;

  /// No description provided for @profileNotifyUsedBooksSub.
  ///
  /// In en, this message translates to:
  /// **'Listings, Waraqah-handled sales, Sell Back and book requests'**
  String get profileNotifyUsedBooksSub;

  /// No description provided for @profileNotifyAlerts.
  ///
  /// In en, this message translates to:
  /// **'Price and stock alerts'**
  String get profileNotifyAlerts;

  /// No description provided for @profileNotifyCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get profileNotifyCommunity;

  /// No description provided for @profileNotifyCommunitySub.
  ///
  /// In en, this message translates to:
  /// **'Likes, comments and new followers on Bites'**
  String get profileNotifyCommunitySub;

  /// No description provided for @profileNotifyModerationNote.
  ///
  /// In en, this message translates to:
  /// **'Moderation warnings always arrive.'**
  String get profileNotifyModerationNote;

  /// No description provided for @profileAccountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Your account was deleted.'**
  String get profileAccountDeleted;

  /// No description provided for @profileNotificationCenter.
  ///
  /// In en, this message translates to:
  /// **'Notification centre'**
  String get profileNotificationCenter;

  /// No description provided for @profileMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get profileMarkAllRead;

  /// No description provided for @profileNoNotifications.
  ///
  /// In en, this message translates to:
  /// **'You are all caught up.'**
  String get profileNoNotifications;

  /// No description provided for @notificationEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Order updates, Listing decisions, sales and price alerts show up here.'**
  String get notificationEmptyBody;

  /// No description provided for @notificationOrderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order {number}: {status}'**
  String notificationOrderStatus(String number, String status);

  /// No description provided for @notificationOrderStatusBody.
  ///
  /// In en, this message translates to:
  /// **'Tap to follow your order.'**
  String get notificationOrderStatusBody;

  /// No description provided for @notificationReturnApproved.
  ///
  /// In en, this message translates to:
  /// **'Return approved for {number}'**
  String notificationReturnApproved(String number);

  /// No description provided for @notificationReturnApprovedBody.
  ///
  /// In en, this message translates to:
  /// **'The refund is in your wallet.'**
  String get notificationReturnApprovedBody;

  /// No description provided for @notificationReturnRejected.
  ///
  /// In en, this message translates to:
  /// **'Return not approved for {number}'**
  String notificationReturnRejected(String number);

  /// No description provided for @notificationReturnRejectedBody.
  ///
  /// In en, this message translates to:
  /// **'Open the order to see what happens next.'**
  String get notificationReturnRejectedBody;

  /// No description provided for @notificationListingApproved.
  ///
  /// In en, this message translates to:
  /// **'{title} is live'**
  String notificationListingApproved(String title);

  /// No description provided for @notificationListingApprovedBody.
  ///
  /// In en, this message translates to:
  /// **'Readers can see it and make offers now.'**
  String get notificationListingApprovedBody;

  /// No description provided for @notificationListingChanges.
  ///
  /// In en, this message translates to:
  /// **'Changes needed on {title}'**
  String notificationListingChanges(String title);

  /// No description provided for @notificationListingRejected.
  ///
  /// In en, this message translates to:
  /// **'{title} was not approved'**
  String notificationListingRejected(String title);

  /// No description provided for @notificationWarning.
  ///
  /// In en, this message translates to:
  /// **'You got a warning'**
  String get notificationWarning;

  /// No description provided for @notificationWarningBody.
  ///
  /// In en, this message translates to:
  /// **'Strike {strikes} of {max}. At {max} you can no longer sell or post.'**
  String notificationWarningBody(String strikes, String max);

  /// No description provided for @notificationBanned.
  ///
  /// In en, this message translates to:
  /// **'Your account was banned'**
  String get notificationBanned;

  /// No description provided for @notificationBannedBody.
  ///
  /// In en, this message translates to:
  /// **'Your Listings were taken down after repeated warnings.'**
  String get notificationBannedBody;

  /// No description provided for @notificationSaleSent.
  ///
  /// In en, this message translates to:
  /// **'{title} is on its way'**
  String notificationSaleSent(String title);

  /// No description provided for @notificationSaleSentBody.
  ///
  /// In en, this message translates to:
  /// **'Confirm when it arrives as described.'**
  String get notificationSaleSentBody;

  /// No description provided for @notificationSaleCompleted.
  ///
  /// In en, this message translates to:
  /// **'{title}: sale complete'**
  String notificationSaleCompleted(String title);

  /// No description provided for @notificationEarned.
  ///
  /// In en, this message translates to:
  /// **'You earned {amount}.'**
  String notificationEarned(String amount);

  /// No description provided for @notificationSaleRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refund for {title}'**
  String notificationSaleRefunded(String title);

  /// No description provided for @notificationSaleSettled.
  ///
  /// In en, this message translates to:
  /// **'Dispute settled for {title}'**
  String notificationSaleSettled(String title);

  /// No description provided for @notificationSaleRefundedSeller.
  ///
  /// In en, this message translates to:
  /// **'The buyer got a refund, and your Listing is live again.'**
  String get notificationSaleRefundedSeller;

  /// No description provided for @notificationSalePaidBuyer.
  ///
  /// In en, this message translates to:
  /// **'The seller was paid.'**
  String get notificationSalePaidBuyer;

  /// No description provided for @notificationInWallet.
  ///
  /// In en, this message translates to:
  /// **'{amount} is in your wallet.'**
  String notificationInWallet(String amount);

  /// No description provided for @notificationSellBackPaid.
  ///
  /// In en, this message translates to:
  /// **'Sell Back paid: {title}'**
  String notificationSellBackPaid(String title);

  /// No description provided for @notificationSellBackReturned.
  ///
  /// In en, this message translates to:
  /// **'{title} is coming back to you'**
  String notificationSellBackReturned(String title);

  /// No description provided for @notificationSellBackReturnedBody.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t buy it this time; the courier is bringing it back.'**
  String get notificationSellBackReturnedBody;

  /// No description provided for @notificationBackInStock.
  ///
  /// In en, this message translates to:
  /// **'{title} is back in stock'**
  String notificationBackInStock(String title);

  /// No description provided for @notificationPriceDrop.
  ///
  /// In en, this message translates to:
  /// **'{title} dropped in price'**
  String notificationPriceDrop(String title);

  /// No description provided for @notificationAlertBody.
  ///
  /// In en, this message translates to:
  /// **'Tap to see it before it\'s gone.'**
  String get notificationAlertBody;

  /// No description provided for @notificationBookWanted.
  ///
  /// In en, this message translates to:
  /// **'A reader wants {title}'**
  String notificationBookWanted(String title);

  /// No description provided for @notificationBookWantedBody.
  ///
  /// In en, this message translates to:
  /// **'You have a copy listed. See their request on My Listings.'**
  String get notificationBookWantedBody;

  /// No description provided for @notificationNewFollower.
  ///
  /// In en, this message translates to:
  /// **'{name} started following you'**
  String notificationNewFollower(String name);

  /// No description provided for @notificationNewFollowerBody.
  ///
  /// In en, this message translates to:
  /// **'Their Bites can show in your Following feed if you follow back.'**
  String get notificationNewFollowerBody;

  /// No description provided for @notificationBiteComment.
  ///
  /// In en, this message translates to:
  /// **'{name} commented on your Bite'**
  String notificationBiteComment(String name);

  /// No description provided for @notificationCommentReply.
  ///
  /// In en, this message translates to:
  /// **'{name} replied to your comment'**
  String notificationCommentReply(String name);

  /// No description provided for @notificationCommentReplyBody.
  ///
  /// In en, this message translates to:
  /// **'Open the Bite to read it.'**
  String get notificationCommentReplyBody;

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

  /// No description provided for @adminDashboardOrdersToday.
  ///
  /// In en, this message translates to:
  /// **'Orders today'**
  String get adminDashboardOrdersToday;

  /// No description provided for @adminDashboardSalesToday.
  ///
  /// In en, this message translates to:
  /// **'Sales today'**
  String get adminDashboardSalesToday;

  /// No description provided for @adminDashboardToShip.
  ///
  /// In en, this message translates to:
  /// **'To ship'**
  String get adminDashboardToShip;

  /// No description provided for @adminDashboardListings.
  ///
  /// In en, this message translates to:
  /// **'Listings to approve'**
  String get adminDashboardListings;

  /// No description provided for @adminDashboardReports.
  ///
  /// In en, this message translates to:
  /// **'Open reports'**
  String get adminDashboardReports;

  /// No description provided for @adminDashboardDisputes.
  ///
  /// In en, this message translates to:
  /// **'Open disputes'**
  String get adminDashboardDisputes;

  /// No description provided for @adminDashboardTopSearches.
  ///
  /// In en, this message translates to:
  /// **'Top searches'**
  String get adminDashboardTopSearches;

  /// No description provided for @adminDashboardTopRequested.
  ///
  /// In en, this message translates to:
  /// **'Most requested books'**
  String get adminDashboardTopRequested;

  /// No description provided for @adminDashboardNone.
  ///
  /// In en, this message translates to:
  /// **'Nothing yet.'**
  String get adminDashboardNone;

  /// No description provided for @adminDashboardSearches.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 search} other{{count} searches}}'**
  String adminDashboardSearches(int count);

  /// No description provided for @adminDashboardRequests.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 request} other{{count} requests}}'**
  String adminDashboardRequests(int count);

  /// No description provided for @adminDonate.
  ///
  /// In en, this message translates to:
  /// **'Donation places'**
  String get adminDonate;

  /// No description provided for @adminDonateHint.
  ///
  /// In en, this message translates to:
  /// **'Verified libraries, schools and madrasas'**
  String get adminDonateHint;

  /// No description provided for @adminDonateAdd.
  ///
  /// In en, this message translates to:
  /// **'Add place'**
  String get adminDonateAdd;

  /// No description provided for @adminDonateEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit place'**
  String get adminDonateEdit;

  /// No description provided for @adminDonateNew.
  ///
  /// In en, this message translates to:
  /// **'New place'**
  String get adminDonateNew;

  /// No description provided for @adminDonateEmpty.
  ///
  /// In en, this message translates to:
  /// **'No verified places yet. Add the first one.'**
  String get adminDonateEmpty;

  /// No description provided for @adminDonateStill.
  ///
  /// In en, this message translates to:
  /// **'{left} of {wanted} copies still needed'**
  String adminDonateStill(int left, int wanted);

  /// No description provided for @adminDonateRemoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove {name}?'**
  String adminDonateRemoveTitle(String name);

  /// No description provided for @adminDonateRemoveBody.
  ///
  /// In en, this message translates to:
  /// **'Donors won\'t see it any more. Donations already placed still go out.'**
  String get adminDonateRemoveBody;

  /// No description provided for @adminDonateRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get adminDonateRemove;

  /// No description provided for @adminDonateRemoved.
  ///
  /// In en, this message translates to:
  /// **'Place removed.'**
  String get adminDonateRemoved;

  /// No description provided for @adminDonateSaved.
  ///
  /// In en, this message translates to:
  /// **'Place saved.'**
  String get adminDonateSaved;

  /// No description provided for @adminDonateName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get adminDonateName;

  /// No description provided for @adminDonateKind.
  ///
  /// In en, this message translates to:
  /// **'Kind of place'**
  String get adminDonateKind;

  /// No description provided for @adminDonateDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get adminDonateDistrict;

  /// No description provided for @adminDonateArea.
  ///
  /// In en, this message translates to:
  /// **'Area or upazila'**
  String get adminDonateArea;

  /// No description provided for @adminDonateStory.
  ///
  /// In en, this message translates to:
  /// **'Who they are'**
  String get adminDonateStory;

  /// No description provided for @adminDonateStoryHint.
  ///
  /// In en, this message translates to:
  /// **'Who reads the books there, in a sentence or two.'**
  String get adminDonateStoryHint;

  /// No description provided for @adminDonateNeeds.
  ///
  /// In en, this message translates to:
  /// **'Books they need'**
  String get adminDonateNeeds;

  /// No description provided for @adminDonateAddBooks.
  ///
  /// In en, this message translates to:
  /// **'Add books'**
  String get adminDonateAddBooks;

  /// No description provided for @adminDonateCopies.
  ///
  /// In en, this message translates to:
  /// **'{count} copies'**
  String adminDonateCopies(int count);

  /// No description provided for @adminDonateSave.
  ///
  /// In en, this message translates to:
  /// **'Save place'**
  String get adminDonateSave;

  /// No description provided for @adminDonateProblemName.
  ///
  /// In en, this message translates to:
  /// **'Give the place a name (3–80 characters).'**
  String get adminDonateProblemName;

  /// No description provided for @adminDonateProblemDistrict.
  ///
  /// In en, this message translates to:
  /// **'Pick the district.'**
  String get adminDonateProblemDistrict;

  /// No description provided for @adminDonateProblemArea.
  ///
  /// In en, this message translates to:
  /// **'Add the area or upazila.'**
  String get adminDonateProblemArea;

  /// No description provided for @adminDonateProblemStory.
  ///
  /// In en, this message translates to:
  /// **'Say who they are in 10–300 characters.'**
  String get adminDonateProblemStory;

  /// No description provided for @adminDonateProblemNeeds.
  ///
  /// In en, this message translates to:
  /// **'Add at least one book they need.'**
  String get adminDonateProblemNeeds;

  /// No description provided for @adminDonateProblemCount.
  ///
  /// In en, this message translates to:
  /// **'Each book needs 1–100 copies.'**
  String get adminDonateProblemCount;

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

  /// No description provided for @adminCatalogTitle.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get adminCatalogTitle;

  /// No description provided for @adminCatalogTabBooks.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get adminCatalogTabBooks;

  /// No description provided for @adminCatalogTabCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get adminCatalogTabCategories;

  /// No description provided for @adminCatalogTabAuthors.
  ///
  /// In en, this message translates to:
  /// **'Authors'**
  String get adminCatalogTabAuthors;

  /// No description provided for @adminCatalogTabPublishers.
  ///
  /// In en, this message translates to:
  /// **'Publishers'**
  String get adminCatalogTabPublishers;

  /// No description provided for @adminCatalogTabBanners.
  ///
  /// In en, this message translates to:
  /// **'Banners'**
  String get adminCatalogTabBanners;

  /// No description provided for @adminCatalogErrTitleBlank.
  ///
  /// In en, this message translates to:
  /// **'Add a title'**
  String get adminCatalogErrTitleBlank;

  /// No description provided for @adminCatalogErrAuthorMissing.
  ///
  /// In en, this message translates to:
  /// **'Pick an author'**
  String get adminCatalogErrAuthorMissing;

  /// No description provided for @adminCatalogErrPublisherMissing.
  ///
  /// In en, this message translates to:
  /// **'Pick a publisher'**
  String get adminCatalogErrPublisherMissing;

  /// No description provided for @adminCatalogErrCategoryMissing.
  ///
  /// In en, this message translates to:
  /// **'Pick a category'**
  String get adminCatalogErrCategoryMissing;

  /// No description provided for @adminCatalogErrCategoryWrongSection.
  ///
  /// In en, this message translates to:
  /// **'This category is in another section'**
  String get adminCatalogErrCategoryWrongSection;

  /// No description provided for @adminCatalogErrClassNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Classes 6–12, and only on School & College books.'**
  String get adminCatalogErrClassNotAllowed;

  /// No description provided for @adminCatalogErrExamNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'This Section doesn\'t offer that Exam.'**
  String get adminCatalogErrExamNotAllowed;

  /// No description provided for @adminCatalogFieldSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get adminCatalogFieldSubject;

  /// No description provided for @adminCatalogFieldNoSubject.
  ///
  /// In en, this message translates to:
  /// **'No Subject'**
  String get adminCatalogFieldNoSubject;

  /// No description provided for @adminCatalogErrNoEditions.
  ///
  /// In en, this message translates to:
  /// **'Add at least one edition'**
  String get adminCatalogErrNoEditions;

  /// No description provided for @adminCatalogErrPriceNotPositive.
  ///
  /// In en, this message translates to:
  /// **'Price must be more than ৳0'**
  String get adminCatalogErrPriceNotPositive;

  /// No description provided for @adminCatalogErrListPriceTooLow.
  ///
  /// In en, this message translates to:
  /// **'List price must be more than the price'**
  String get adminCatalogErrListPriceTooLow;

  /// No description provided for @adminCatalogErrStockNegative.
  ///
  /// In en, this message translates to:
  /// **'Stock can\'t be below 0'**
  String get adminCatalogErrStockNegative;

  /// No description provided for @adminCatalogErrIsbnInvalid.
  ///
  /// In en, this message translates to:
  /// **'Not a valid ISBN. Check the 10 or 13 digits.'**
  String get adminCatalogErrIsbnInvalid;

  /// No description provided for @adminCatalogErrIsbnTaken.
  ///
  /// In en, this message translates to:
  /// **'Another edition already has this ISBN'**
  String get adminCatalogErrIsbnTaken;

  /// No description provided for @adminCatalogErrEditionTaken.
  ///
  /// In en, this message translates to:
  /// **'This book already has an edition in this format and language'**
  String get adminCatalogErrEditionTaken;

  /// No description provided for @adminCatalogErrNameBlank.
  ///
  /// In en, this message translates to:
  /// **'Add a name'**
  String get adminCatalogErrNameBlank;

  /// No description provided for @adminCatalogErrNameBnBlank.
  ///
  /// In en, this message translates to:
  /// **'Add the Bangla name'**
  String get adminCatalogErrNameBnBlank;

  /// No description provided for @adminCatalogErrBannerTitleBlank.
  ///
  /// In en, this message translates to:
  /// **'Add the title in English and Bangla'**
  String get adminCatalogErrBannerTitleBlank;

  /// No description provided for @adminCatalogErrBannerTargetBlank.
  ///
  /// In en, this message translates to:
  /// **'Choose what the banner opens'**
  String get adminCatalogErrBannerTargetBlank;

  /// No description provided for @adminCatalogAddBook.
  ///
  /// In en, this message translates to:
  /// **'Add book'**
  String get adminCatalogAddBook;

  /// No description provided for @adminCatalogIsbnLookupField.
  ///
  /// In en, this message translates to:
  /// **'ISBN to look up'**
  String get adminCatalogIsbnLookupField;

  /// No description provided for @adminCatalogLookUp.
  ///
  /// In en, this message translates to:
  /// **'Look up'**
  String get adminCatalogLookUp;

  /// No description provided for @adminCatalogIsbnNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not found — fill in by hand.'**
  String get adminCatalogIsbnNotFound;

  /// No description provided for @adminCatalogIsbnInCatalog.
  ///
  /// In en, this message translates to:
  /// **'Already in the catalog'**
  String get adminCatalogIsbnInCatalog;

  /// No description provided for @adminCatalogOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get adminCatalogOpen;

  /// No description provided for @adminCatalogMoreTools.
  ///
  /// In en, this message translates to:
  /// **'More tools'**
  String get adminCatalogMoreTools;

  /// No description provided for @adminCatalogLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get adminCatalogLowStock;

  /// No description provided for @adminCatalogLowStockEmpty.
  ///
  /// In en, this message translates to:
  /// **'All stocked up.'**
  String get adminCatalogLowStockEmpty;

  /// No description provided for @adminCatalogStockLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} left'**
  String adminCatalogStockLeft(int count);

  /// No description provided for @adminCatalogSetStock.
  ///
  /// In en, this message translates to:
  /// **'Set stock'**
  String get adminCatalogSetStock;

  /// No description provided for @adminCatalogImport.
  ///
  /// In en, this message translates to:
  /// **'Import CSV'**
  String get adminCatalogImport;

  /// No description provided for @adminCatalogImportHint.
  ///
  /// In en, this message translates to:
  /// **'Paste rows with this header. One row is one Edition; rows with the same title and Author make one Book.'**
  String get adminCatalogImportHint;

  /// No description provided for @adminCatalogImportField.
  ///
  /// In en, this message translates to:
  /// **'CSV rows'**
  String get adminCatalogImportField;

  /// No description provided for @adminCatalogImportExample.
  ///
  /// In en, this message translates to:
  /// **'Paste example'**
  String get adminCatalogImportExample;

  /// No description provided for @adminCatalogImportCheck.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get adminCatalogImportCheck;

  /// No description provided for @adminCatalogImportBooks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Import 1 book} other{Import {count} books}}'**
  String adminCatalogImportBooks(int count);

  /// No description provided for @adminCatalogImportEditions.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 edition} other{{count} editions}}'**
  String adminCatalogImportEditions(int count);

  /// No description provided for @adminCatalogImportNewAuthor.
  ///
  /// In en, this message translates to:
  /// **'new Author'**
  String get adminCatalogImportNewAuthor;

  /// No description provided for @adminCatalogImportNewPublisher.
  ///
  /// In en, this message translates to:
  /// **'new Publisher'**
  String get adminCatalogImportNewPublisher;

  /// No description provided for @adminCatalogImportRow.
  ///
  /// In en, this message translates to:
  /// **'Row {row}:'**
  String adminCatalogImportRow(int row);

  /// No description provided for @adminCatalogImportColumns.
  ///
  /// In en, this message translates to:
  /// **'needs 12 columns'**
  String get adminCatalogImportColumns;

  /// No description provided for @adminCatalogImportBlank.
  ///
  /// In en, this message translates to:
  /// **'title, Author and Publisher are needed'**
  String get adminCatalogImportBlank;

  /// No description provided for @adminCatalogImportSection.
  ///
  /// In en, this message translates to:
  /// **'unknown Section “{value}”'**
  String adminCatalogImportSection(String value);

  /// No description provided for @adminCatalogImportCategory.
  ///
  /// In en, this message translates to:
  /// **'unknown Category “{value}”'**
  String adminCatalogImportCategory(String value);

  /// No description provided for @adminCatalogImportFormat.
  ///
  /// In en, this message translates to:
  /// **'unknown format “{value}”'**
  String adminCatalogImportFormat(String value);

  /// No description provided for @adminCatalogImportLanguage.
  ///
  /// In en, this message translates to:
  /// **'unknown language “{value}”'**
  String adminCatalogImportLanguage(String value);

  /// No description provided for @adminCatalogImportNumber.
  ///
  /// In en, this message translates to:
  /// **'“{value}” isn\'t a whole number'**
  String adminCatalogImportNumber(String value);

  /// No description provided for @adminCatalogImportDone.
  ///
  /// In en, this message translates to:
  /// **'Imported {imported} books, skipped {skipped}.'**
  String adminCatalogImportDone(int imported, int skipped);

  /// No description provided for @adminCatalogEditBook.
  ///
  /// In en, this message translates to:
  /// **'Edit book'**
  String get adminCatalogEditBook;

  /// No description provided for @adminCatalogSearchBooks.
  ///
  /// In en, this message translates to:
  /// **'Search title or author'**
  String get adminCatalogSearchBooks;

  /// No description provided for @adminCatalogShowHidden.
  ///
  /// In en, this message translates to:
  /// **'Show hidden books'**
  String get adminCatalogShowHidden;

  /// No description provided for @adminCatalogHidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get adminCatalogHidden;

  /// No description provided for @adminCatalogInStock.
  ///
  /// In en, this message translates to:
  /// **'{count} in stock'**
  String adminCatalogInStock(int count);

  /// No description provided for @adminCatalogNoBooks.
  ///
  /// In en, this message translates to:
  /// **'No books match.'**
  String get adminCatalogNoBooks;

  /// No description provided for @adminCatalogFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get adminCatalogFieldTitle;

  /// No description provided for @adminCatalogFieldTitleBn.
  ///
  /// In en, this message translates to:
  /// **'Bangla title (optional)'**
  String get adminCatalogFieldTitleBn;

  /// No description provided for @adminCatalogFieldAuthor.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get adminCatalogFieldAuthor;

  /// No description provided for @adminCatalogFieldPublisher.
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get adminCatalogFieldPublisher;

  /// No description provided for @adminCatalogFieldSection.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get adminCatalogFieldSection;

  /// No description provided for @adminCatalogFieldCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get adminCatalogFieldCategory;

  /// No description provided for @adminCatalogFieldLanguage.
  ///
  /// In en, this message translates to:
  /// **'Original language'**
  String get adminCatalogFieldLanguage;

  /// No description provided for @adminCatalogPick.
  ///
  /// In en, this message translates to:
  /// **'Choose…'**
  String get adminCatalogPick;

  /// No description provided for @adminCatalogCover.
  ///
  /// In en, this message translates to:
  /// **'Cover colours'**
  String get adminCatalogCover;

  /// No description provided for @adminCatalogEditions.
  ///
  /// In en, this message translates to:
  /// **'Editions'**
  String get adminCatalogEditions;

  /// No description provided for @adminCatalogAddEdition.
  ///
  /// In en, this message translates to:
  /// **'Add edition'**
  String get adminCatalogAddEdition;

  /// No description provided for @adminCatalogRemoveEdition.
  ///
  /// In en, this message translates to:
  /// **'Remove edition'**
  String get adminCatalogRemoveEdition;

  /// No description provided for @adminCatalogFieldFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get adminCatalogFieldFormat;

  /// No description provided for @adminCatalogFieldEditionLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get adminCatalogFieldEditionLanguage;

  /// No description provided for @adminCatalogFieldPrice.
  ///
  /// In en, this message translates to:
  /// **'Price (৳)'**
  String get adminCatalogFieldPrice;

  /// No description provided for @adminCatalogFieldListPrice.
  ///
  /// In en, this message translates to:
  /// **'List price (৳, optional)'**
  String get adminCatalogFieldListPrice;

  /// No description provided for @adminCatalogFieldStock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get adminCatalogFieldStock;

  /// No description provided for @adminCatalogFieldPreorder.
  ///
  /// In en, this message translates to:
  /// **'Pre-order'**
  String get adminCatalogFieldPreorder;

  /// No description provided for @adminCatalogFieldIsbn.
  ///
  /// In en, this message translates to:
  /// **'ISBN (optional)'**
  String get adminCatalogFieldIsbn;

  /// No description provided for @adminCatalogEbookNote.
  ///
  /// In en, this message translates to:
  /// **'eBooks never run out and have no ISBN.'**
  String get adminCatalogEbookNote;

  /// No description provided for @adminCatalogDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get adminCatalogDone;

  /// No description provided for @adminCatalogSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get adminCatalogSave;

  /// No description provided for @adminCatalogSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get adminCatalogSaved;

  /// No description provided for @adminCatalogSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save. Check the form and try again.'**
  String get adminCatalogSaveFailed;

  /// No description provided for @adminCatalogHide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get adminCatalogHide;

  /// No description provided for @adminCatalogUnhide.
  ///
  /// In en, this message translates to:
  /// **'Show again'**
  String get adminCatalogUnhide;

  /// No description provided for @adminCatalogHideHint.
  ///
  /// In en, this message translates to:
  /// **'A hidden book leaves lists, search, Home and collections, but its page still opens from old links and can be bought. To stop sales, set stock to 0.'**
  String get adminCatalogHideHint;

  /// No description provided for @adminCatalogSearchRecords.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get adminCatalogSearchRecords;

  /// No description provided for @adminCatalogAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add new…'**
  String get adminCatalogAddNew;

  /// No description provided for @adminCatalogFieldName.
  ///
  /// In en, this message translates to:
  /// **'Name (English)'**
  String get adminCatalogFieldName;

  /// No description provided for @adminCatalogFieldNameBn.
  ///
  /// In en, this message translates to:
  /// **'Name (Bangla)'**
  String get adminCatalogFieldNameBn;

  /// No description provided for @adminCatalogFieldNameBnOptional.
  ///
  /// In en, this message translates to:
  /// **'Name (Bangla, optional)'**
  String get adminCatalogFieldNameBnOptional;

  /// No description provided for @adminCatalogBookCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No books} =1{1 book} other{{count} books}}'**
  String adminCatalogBookCount(int count);

  /// No description provided for @adminCatalogUsedBy.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Used by 1 book} other{Used by {count} books}}'**
  String adminCatalogUsedBy(int count);

  /// No description provided for @adminCatalogDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get adminCatalogDelete;

  /// No description provided for @adminCatalogDeleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get adminCatalogDeleted;

  /// No description provided for @adminCatalogAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get adminCatalogAdd;

  /// No description provided for @adminCatalogNoRecords.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet.'**
  String get adminCatalogNoRecords;

  /// No description provided for @adminCatalogBannerNew.
  ///
  /// In en, this message translates to:
  /// **'New banner'**
  String get adminCatalogBannerNew;

  /// No description provided for @adminCatalogBannerEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit banner'**
  String get adminCatalogBannerEdit;

  /// No description provided for @adminCatalogFieldTitleEn.
  ///
  /// In en, this message translates to:
  /// **'Title (English)'**
  String get adminCatalogFieldTitleEn;

  /// No description provided for @adminCatalogFieldTitleBnBanner.
  ///
  /// In en, this message translates to:
  /// **'Title (Bangla)'**
  String get adminCatalogFieldTitleBnBanner;

  /// No description provided for @adminCatalogFieldSubtitleEn.
  ///
  /// In en, this message translates to:
  /// **'Subtitle (English)'**
  String get adminCatalogFieldSubtitleEn;

  /// No description provided for @adminCatalogFieldSubtitleBn.
  ///
  /// In en, this message translates to:
  /// **'Subtitle (Bangla)'**
  String get adminCatalogFieldSubtitleBn;

  /// No description provided for @adminCatalogBannerColour.
  ///
  /// In en, this message translates to:
  /// **'Colours'**
  String get adminCatalogBannerColour;

  /// No description provided for @adminCatalogBannerOpens.
  ///
  /// In en, this message translates to:
  /// **'Opens'**
  String get adminCatalogBannerOpens;

  /// No description provided for @adminCatalogTargetCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get adminCatalogTargetCollection;

  /// No description provided for @adminCatalogTargetBook.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get adminCatalogTargetBook;

  /// No description provided for @adminCatalogTargetSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get adminCatalogTargetSearch;

  /// No description provided for @adminCatalogSearchWords.
  ///
  /// In en, this message translates to:
  /// **'Search words'**
  String get adminCatalogSearchWords;

  /// No description provided for @adminCatalogMoveUp.
  ///
  /// In en, this message translates to:
  /// **'Move up'**
  String get adminCatalogMoveUp;

  /// No description provided for @adminCatalogMoveDown.
  ///
  /// In en, this message translates to:
  /// **'Move down'**
  String get adminCatalogMoveDown;

  /// No description provided for @adminCatalogEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get adminCatalogEdit;

  /// No description provided for @adminCatalogDeleteBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this banner?'**
  String get adminCatalogDeleteBannerTitle;

  /// No description provided for @adminCatalogDeleteBannerBody.
  ///
  /// In en, this message translates to:
  /// **'It leaves Home at once.'**
  String get adminCatalogDeleteBannerBody;

  /// No description provided for @adminCatalogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get adminCatalogCancel;

  /// No description provided for @adminCatalogNoBanners.
  ///
  /// In en, this message translates to:
  /// **'No banners. Home shows none until you add one.'**
  String get adminCatalogNoBanners;

  /// No description provided for @adminCatalogSeasonHome.
  ///
  /// In en, this message translates to:
  /// **'Home\'s season'**
  String get adminCatalogSeasonHome;

  /// No description provided for @adminCatalogSeasonAuto.
  ///
  /// In en, this message translates to:
  /// **'Automatic (by date)'**
  String get adminCatalogSeasonAuto;

  /// No description provided for @adminCatalogSeason.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get adminCatalogSeason;

  /// No description provided for @adminCatalogSeasonNone.
  ///
  /// In en, this message translates to:
  /// **'None (all year)'**
  String get adminCatalogSeasonNone;

  /// No description provided for @adminCatalogTabCollections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get adminCatalogTabCollections;

  /// No description provided for @adminCatalogListsBooklists.
  ///
  /// In en, this message translates to:
  /// **'Booklists'**
  String get adminCatalogListsBooklists;

  /// No description provided for @adminCatalogNewCollection.
  ///
  /// In en, this message translates to:
  /// **'New Collection'**
  String get adminCatalogNewCollection;

  /// No description provided for @adminCatalogEditCollection.
  ///
  /// In en, this message translates to:
  /// **'Edit Collection'**
  String get adminCatalogEditCollection;

  /// No description provided for @adminCatalogNewBooklist.
  ///
  /// In en, this message translates to:
  /// **'New Booklist'**
  String get adminCatalogNewBooklist;

  /// No description provided for @adminCatalogEditBooklist.
  ///
  /// In en, this message translates to:
  /// **'Edit Booklist'**
  String get adminCatalogEditBooklist;

  /// No description provided for @adminCatalogFieldNoteEn.
  ///
  /// In en, this message translates to:
  /// **'Why these books (English)'**
  String get adminCatalogFieldNoteEn;

  /// No description provided for @adminCatalogFieldNoteBn.
  ///
  /// In en, this message translates to:
  /// **'Why these books (Bangla)'**
  String get adminCatalogFieldNoteBn;

  /// No description provided for @adminCatalogFieldSectionOptional.
  ///
  /// In en, this message translates to:
  /// **'Section (optional)'**
  String get adminCatalogFieldSectionOptional;

  /// No description provided for @adminCatalogNoSection.
  ///
  /// In en, this message translates to:
  /// **'None (general)'**
  String get adminCatalogNoSection;

  /// No description provided for @adminCatalogFieldExpert.
  ///
  /// In en, this message translates to:
  /// **'Expert (optional)'**
  String get adminCatalogFieldExpert;

  /// No description provided for @adminCatalogNoExpert.
  ///
  /// In en, this message translates to:
  /// **'None (picked by Staff)'**
  String get adminCatalogNoExpert;

  /// No description provided for @adminCatalogFieldKind.
  ///
  /// In en, this message translates to:
  /// **'Kind'**
  String get adminCatalogFieldKind;

  /// No description provided for @adminCatalogListBooks.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get adminCatalogListBooks;

  /// No description provided for @adminCatalogAddBooks.
  ///
  /// In en, this message translates to:
  /// **'Add books'**
  String get adminCatalogAddBooks;

  /// No description provided for @adminCatalogRemoveBook.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get adminCatalogRemoveBook;

  /// No description provided for @adminCatalogErrListTitleBlank.
  ///
  /// In en, this message translates to:
  /// **'Add the title in English and Bangla'**
  String get adminCatalogErrListTitleBlank;

  /// No description provided for @adminCatalogErrListNoBooks.
  ///
  /// In en, this message translates to:
  /// **'Add at least one book'**
  String get adminCatalogErrListNoBooks;

  /// No description provided for @adminCatalogErrListDuplicateBook.
  ///
  /// In en, this message translates to:
  /// **'A book is in the list twice'**
  String get adminCatalogErrListDuplicateBook;

  /// No description provided for @adminCatalogErrListNoteTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep each note to 300 characters'**
  String get adminCatalogErrListNoteTooLong;

  /// No description provided for @adminCatalogDeleteListTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this list?'**
  String get adminCatalogDeleteListTitle;

  /// No description provided for @adminCatalogDeleteListBody.
  ///
  /// In en, this message translates to:
  /// **'Readers stop seeing it at once.'**
  String get adminCatalogDeleteListBody;

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

  /// No description provided for @moderationTabLog.
  ///
  /// In en, this message translates to:
  /// **'Log'**
  String get moderationTabLog;

  /// No description provided for @moderationApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get moderationApprove;

  /// No description provided for @moderationRequestChanges.
  ///
  /// In en, this message translates to:
  /// **'Ask for changes'**
  String get moderationRequestChanges;

  /// No description provided for @moderationReject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get moderationReject;

  /// No description provided for @moderationReasonChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'What should the seller change?'**
  String get moderationReasonChangesTitle;

  /// No description provided for @moderationReasonRejectTitle.
  ///
  /// In en, this message translates to:
  /// **'Why is it rejected?'**
  String get moderationReasonRejectTitle;

  /// No description provided for @moderationReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get moderationReasonLabel;

  /// No description provided for @moderationReasonHint.
  ///
  /// In en, this message translates to:
  /// **'The seller sees this.'**
  String get moderationReasonHint;

  /// No description provided for @moderationReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Add a reason for the seller.'**
  String get moderationReasonRequired;

  /// No description provided for @moderationReasonTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep it under {max} characters.'**
  String moderationReasonTooLong(int max);

  /// No description provided for @moderationQuickPhotos.
  ///
  /// In en, this message translates to:
  /// **'Add clearer photos of your copy'**
  String get moderationQuickPhotos;

  /// No description provided for @moderationQuickPhotocopy.
  ///
  /// In en, this message translates to:
  /// **'This looks like a photocopy'**
  String get moderationQuickPhotocopy;

  /// No description provided for @moderationQuickPrice.
  ///
  /// In en, this message translates to:
  /// **'The price is higher than buying new'**
  String get moderationQuickPrice;

  /// No description provided for @moderationQuickCondition.
  ///
  /// In en, this message translates to:
  /// **'The condition doesn\'t match the photos'**
  String get moderationQuickCondition;

  /// No description provided for @moderationSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get moderationSend;

  /// No description provided for @moderationApproved.
  ///
  /// In en, this message translates to:
  /// **'{title} is live.'**
  String moderationApproved(String title);

  /// No description provided for @moderationChangesSent.
  ///
  /// In en, this message translates to:
  /// **'Asked {name} for changes.'**
  String moderationChangesSent(String name);

  /// No description provided for @moderationRejected.
  ///
  /// In en, this message translates to:
  /// **'{title} was rejected.'**
  String moderationRejected(String title);

  /// No description provided for @moderationStrikes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No strikes} =1{1 strike} other{{count} strikes}}'**
  String moderationStrikes(int count);

  /// No description provided for @moderationBannedTag.
  ///
  /// In en, this message translates to:
  /// **'Banned'**
  String get moderationBannedTag;

  /// No description provided for @moderationPhotoFront.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get moderationPhotoFront;

  /// No description provided for @moderationPhotoBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get moderationPhotoBack;

  /// No description provided for @moderationPhotoSpine.
  ///
  /// In en, this message translates to:
  /// **'Spine'**
  String get moderationPhotoSpine;

  /// No description provided for @moderationPhotoInside.
  ///
  /// In en, this message translates to:
  /// **'Inside'**
  String get moderationPhotoInside;

  /// No description provided for @moderationPhotoDamage.
  ///
  /// In en, this message translates to:
  /// **'Damage'**
  String get moderationPhotoDamage;

  /// No description provided for @moderationNoPhotos.
  ///
  /// In en, this message translates to:
  /// **'No photos added. Ask for photos before approving.'**
  String get moderationNoPhotos;

  /// No description provided for @moderationNewPrice.
  ///
  /// In en, this message translates to:
  /// **'New {price}'**
  String moderationNewPrice(String price);

  /// No description provided for @moderationReportCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 report} other{{count} reports}}'**
  String moderationReportCount(int count);

  /// No description provided for @moderationKindListing.
  ///
  /// In en, this message translates to:
  /// **'Listing'**
  String get moderationKindListing;

  /// No description provided for @moderationKindUser.
  ///
  /// In en, this message translates to:
  /// **'Reader'**
  String get moderationKindUser;

  /// No description provided for @moderationKindMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get moderationKindMessage;

  /// No description provided for @moderationKindBite.
  ///
  /// In en, this message translates to:
  /// **'Bite'**
  String get moderationKindBite;

  /// No description provided for @moderationKindComment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get moderationKindComment;

  /// No description provided for @moderationKindReview.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get moderationKindReview;

  /// No description provided for @moderationOwner.
  ///
  /// In en, this message translates to:
  /// **'By {name}'**
  String moderationOwner(String name);

  /// No description provided for @moderationReporterNote.
  ///
  /// In en, this message translates to:
  /// **'Reporter: {note}'**
  String moderationReporterNote(String note);

  /// No description provided for @moderationRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get moderationRemove;

  /// No description provided for @moderationDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get moderationDismiss;

  /// No description provided for @moderationWarn.
  ///
  /// In en, this message translates to:
  /// **'Warn'**
  String get moderationWarn;

  /// No description provided for @moderationBan.
  ///
  /// In en, this message translates to:
  /// **'Ban'**
  String get moderationBan;

  /// No description provided for @moderationBanTitle.
  ///
  /// In en, this message translates to:
  /// **'Ban {name}?'**
  String moderationBanTitle(String name);

  /// No description provided for @moderationBanBody.
  ///
  /// In en, this message translates to:
  /// **'They can\'t sell or post any more, and their listings leave the marketplace.'**
  String get moderationBanBody;

  /// No description provided for @moderationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get moderationCancel;

  /// No description provided for @moderationDone.
  ///
  /// In en, this message translates to:
  /// **'Done. It\'s in the log.'**
  String get moderationDone;

  /// No description provided for @moderationEmptyLog.
  ///
  /// In en, this message translates to:
  /// **'No actions yet. Everything moderators do shows up here.'**
  String get moderationEmptyLog;

  /// No description provided for @moderationLogApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get moderationLogApproved;

  /// No description provided for @moderationLogChangesRequested.
  ///
  /// In en, this message translates to:
  /// **'Asked for changes'**
  String get moderationLogChangesRequested;

  /// No description provided for @moderationLogRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get moderationLogRejected;

  /// No description provided for @moderationLogRemoved.
  ///
  /// In en, this message translates to:
  /// **'Removed'**
  String get moderationLogRemoved;

  /// No description provided for @moderationLogDismissed.
  ///
  /// In en, this message translates to:
  /// **'Dismissed a report on'**
  String get moderationLogDismissed;

  /// No description provided for @moderationLogWarned.
  ///
  /// In en, this message translates to:
  /// **'Warned'**
  String get moderationLogWarned;

  /// No description provided for @moderationLogBanned.
  ///
  /// In en, this message translates to:
  /// **'Banned'**
  String get moderationLogBanned;

  /// No description provided for @moderationLogThirdStrike.
  ///
  /// In en, this message translates to:
  /// **'Third strike'**
  String get moderationLogThirdStrike;

  /// No description provided for @moderationLogBy.
  ///
  /// In en, this message translates to:
  /// **'{by} · {time}'**
  String moderationLogBy(String by, String time);

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

  /// No description provided for @reportAction.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get reportAction;

  /// No description provided for @reportMoreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get reportMoreOptions;

  /// No description provided for @reportTitleListing.
  ///
  /// In en, this message translates to:
  /// **'Report this listing'**
  String get reportTitleListing;

  /// No description provided for @reportTitleUser.
  ///
  /// In en, this message translates to:
  /// **'Report this reader'**
  String get reportTitleUser;

  /// No description provided for @reportTitleMessage.
  ///
  /// In en, this message translates to:
  /// **'Report this message'**
  String get reportTitleMessage;

  /// No description provided for @reportTitleBite.
  ///
  /// In en, this message translates to:
  /// **'Report this Bite'**
  String get reportTitleBite;

  /// No description provided for @reportTitleComment.
  ///
  /// In en, this message translates to:
  /// **'Report this comment'**
  String get reportTitleComment;

  /// No description provided for @reportTitleReview.
  ///
  /// In en, this message translates to:
  /// **'Report this review'**
  String get reportTitleReview;

  /// No description provided for @reportWhy.
  ///
  /// In en, this message translates to:
  /// **'Why are you reporting it?'**
  String get reportWhy;

  /// No description provided for @reportReasonSpam.
  ///
  /// In en, this message translates to:
  /// **'Spam or scam'**
  String get reportReasonSpam;

  /// No description provided for @reportReasonFake.
  ///
  /// In en, this message translates to:
  /// **'Fake or misleading'**
  String get reportReasonFake;

  /// No description provided for @reportReasonPhotocopy.
  ///
  /// In en, this message translates to:
  /// **'Photocopy or pirated book'**
  String get reportReasonPhotocopy;

  /// No description provided for @reportReasonHarassment.
  ///
  /// In en, this message translates to:
  /// **'Harassment or hate'**
  String get reportReasonHarassment;

  /// No description provided for @reportReasonOffensive.
  ///
  /// In en, this message translates to:
  /// **'Offensive or inappropriate'**
  String get reportReasonOffensive;

  /// No description provided for @reportReasonOther.
  ///
  /// In en, this message translates to:
  /// **'Something else'**
  String get reportReasonOther;

  /// No description provided for @reportNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Tell us more'**
  String get reportNoteLabel;

  /// No description provided for @reportNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Optional. Helps moderators decide.'**
  String get reportNoteHint;

  /// No description provided for @reportNoteRequired.
  ///
  /// In en, this message translates to:
  /// **'Tell us what\'s wrong.'**
  String get reportNoteRequired;

  /// No description provided for @reportNoteTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep it under {max} characters.'**
  String reportNoteTooLong(int max);

  /// No description provided for @reportPrivacy.
  ///
  /// In en, this message translates to:
  /// **'They won\'t know who reported them. A moderator will review it.'**
  String get reportPrivacy;

  /// No description provided for @reportSend.
  ///
  /// In en, this message translates to:
  /// **'Send report'**
  String get reportSend;

  /// No description provided for @reportSent.
  ///
  /// In en, this message translates to:
  /// **'Thanks. A moderator will review your report.'**
  String get reportSent;

  /// No description provided for @reportBlockUser.
  ///
  /// In en, this message translates to:
  /// **'Block {name}'**
  String reportBlockUser(String name);

  /// No description provided for @reportUnblockUser.
  ///
  /// In en, this message translates to:
  /// **'Unblock {name}'**
  String reportUnblockUser(String name);

  /// No description provided for @reportBlockTitle.
  ///
  /// In en, this message translates to:
  /// **'Block {name}?'**
  String reportBlockTitle(String name);

  /// No description provided for @reportBlockBody.
  ///
  /// In en, this message translates to:
  /// **'Their listings won\'t show in the marketplace. You can unblock them any time from Profile.'**
  String get reportBlockBody;

  /// No description provided for @reportBlockConfirm.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get reportBlockConfirm;

  /// No description provided for @reportCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get reportCancel;

  /// No description provided for @reportBlocked.
  ///
  /// In en, this message translates to:
  /// **'{name} is blocked.'**
  String reportBlocked(String name);

  /// No description provided for @reportUnblocked.
  ///
  /// In en, this message translates to:
  /// **'{name} is unblocked.'**
  String reportUnblocked(String name);

  /// No description provided for @reportBlockedNotice.
  ///
  /// In en, this message translates to:
  /// **'You blocked {name}. Unblock them to make an offer.'**
  String reportBlockedNotice(String name);

  /// No description provided for @reportBlockedThread.
  ///
  /// In en, this message translates to:
  /// **'You blocked {name}. Unblock to message each other again.'**
  String reportBlockedThread(String name);

  /// No description provided for @reportUnblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get reportUnblock;

  /// No description provided for @reportBlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Blocked readers'**
  String get reportBlockedTitle;

  /// No description provided for @reportBlockedEmpty.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t blocked anyone.'**
  String get reportBlockedEmpty;

  /// No description provided for @reportBlockedEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Block a reader from their profile or a listing\'s menu. Their listings stop showing in the marketplace.'**
  String get reportBlockedEmptyBody;

  /// No description provided for @reportBlockedSince.
  ///
  /// In en, this message translates to:
  /// **'Blocked {date}'**
  String reportBlockedSince(String date);

  /// No description provided for @listingRulesTitle.
  ///
  /// In en, this message translates to:
  /// **'Before you list'**
  String get listingRulesTitle;

  /// No description provided for @listingRuleOriginal.
  ///
  /// In en, this message translates to:
  /// **'Only original printed books. No photocopies.'**
  String get listingRuleOriginal;

  /// No description provided for @listingRulePirated.
  ///
  /// In en, this message translates to:
  /// **'No pirated books, PDF printouts or unofficial copies.'**
  String get listingRulePirated;

  /// No description provided for @listingRuleHonest.
  ///
  /// In en, this message translates to:
  /// **'Describe the condition honestly, with photos of your own copy.'**
  String get listingRuleHonest;

  /// No description provided for @listingRuleWarning.
  ///
  /// In en, this message translates to:
  /// **'Moderators reject listings that break these rules, and repeat breaks can get an account banned.'**
  String get listingRuleWarning;

  /// No description provided for @listingFairPrice.
  ///
  /// In en, this message translates to:
  /// **'Fair price: {low}–{high}'**
  String listingFairPrice(String low, String high);

  /// No description provided for @listingFairPriceBasis.
  ///
  /// In en, this message translates to:
  /// **'From the new price ({price}), the condition and the flags.'**
  String listingFairPriceBasis(String price);

  /// No description provided for @listingFairPriceUnknown.
  ///
  /// In en, this message translates to:
  /// **'Scan or pick the book from the catalog to see a fair price.'**
  String get listingFairPriceUnknown;

  /// No description provided for @listingPriceLow.
  ///
  /// In en, this message translates to:
  /// **'Lower than most: it should sell fast.'**
  String get listingPriceLow;

  /// No description provided for @listingPriceFair.
  ///
  /// In en, this message translates to:
  /// **'A fair price.'**
  String get listingPriceFair;

  /// No description provided for @listingPriceHigh.
  ///
  /// In en, this message translates to:
  /// **'Higher than most used copies, so it may take longer to sell.'**
  String get listingPriceHigh;

  /// No description provided for @listingPriceAboveNew.
  ///
  /// In en, this message translates to:
  /// **'That\'s as much as buying it new ({price}). Buyers will buy new instead.'**
  String listingPriceAboveNew(String price);

  /// No description provided for @listingFinishedTitle.
  ///
  /// In en, this message translates to:
  /// **'Finished {title}?'**
  String listingFinishedTitle(String title);

  /// No description provided for @listingFinishedBody.
  ///
  /// In en, this message translates to:
  /// **'Pass it on: another reader gets it for less, and you get money back.'**
  String get listingFinishedBody;

  /// No description provided for @listingFinishedListRange.
  ///
  /// In en, this message translates to:
  /// **'Readers pay about {low}–{high} for a copy read once.'**
  String listingFinishedListRange(String low, String high);

  /// No description provided for @listingFinishedList.
  ///
  /// In en, this message translates to:
  /// **'List it for readers'**
  String get listingFinishedList;

  /// No description provided for @listingFinishedSellBackLine.
  ///
  /// In en, this message translates to:
  /// **'Or Waraqah pays {price} now, and a courier picks it up.'**
  String listingFinishedSellBackLine(String price);

  /// No description provided for @listingFinishedSellBack.
  ///
  /// In en, this message translates to:
  /// **'Sell it back to Waraqah'**
  String get listingFinishedSellBack;

  /// No description provided for @listingFinishedKeep.
  ///
  /// In en, this message translates to:
  /// **'Keep it'**
  String get listingFinishedKeep;

  /// No description provided for @shelfTitle.
  ///
  /// In en, this message translates to:
  /// **'My shelves'**
  String get shelfTitle;

  /// No description provided for @shelfWantToRead.
  ///
  /// In en, this message translates to:
  /// **'Want to Read'**
  String get shelfWantToRead;

  /// No description provided for @shelfReading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get shelfReading;

  /// No description provided for @shelfFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get shelfFinished;

  /// No description provided for @shelfAdd.
  ///
  /// In en, this message translates to:
  /// **'Add to shelf'**
  String get shelfAdd;

  /// No description provided for @shelfRemove.
  ///
  /// In en, this message translates to:
  /// **'Take off my shelves'**
  String get shelfRemove;

  /// No description provided for @shelfMoved.
  ///
  /// In en, this message translates to:
  /// **'Moved to {shelf}.'**
  String shelfMoved(String shelf);

  /// No description provided for @shelfRemoved.
  ///
  /// In en, this message translates to:
  /// **'Taken off your shelves.'**
  String get shelfRemoved;

  /// No description provided for @shelfMoveTo.
  ///
  /// In en, this message translates to:
  /// **'Move to'**
  String get shelfMoveTo;

  /// No description provided for @shelfEmptyWantToRead.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet. Add books from their page, and books you buy land here when they arrive.'**
  String get shelfEmptyWantToRead;

  /// No description provided for @shelfEmptyReading.
  ///
  /// In en, this message translates to:
  /// **'Not reading anything right now.'**
  String get shelfEmptyReading;

  /// No description provided for @shelfEmptyFinished.
  ///
  /// In en, this message translates to:
  /// **'Books you finish show up here.'**
  String get shelfEmptyFinished;

  /// No description provided for @shelfAddedOn.
  ///
  /// In en, this message translates to:
  /// **'Added {date}'**
  String shelfAddedOn(String date);

  /// No description provided for @shelfFinishedOn.
  ///
  /// In en, this message translates to:
  /// **'Finished {date}'**
  String shelfFinishedOn(String date);

  /// No description provided for @shelfProfileLink.
  ///
  /// In en, this message translates to:
  /// **'My shelves'**
  String get shelfProfileLink;

  /// No description provided for @shelfProfileLinkBody.
  ///
  /// In en, this message translates to:
  /// **'Want to Read, Reading and Finished'**
  String get shelfProfileLinkBody;

  /// No description provided for @readingProgress.
  ///
  /// In en, this message translates to:
  /// **'{percent}% read'**
  String readingProgress(int percent);

  /// No description provided for @readingPages.
  ///
  /// In en, this message translates to:
  /// **'Page {page} of {total}'**
  String readingPages(int page, int total);

  /// No description provided for @readingUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get readingUpdate;

  /// No description provided for @readingUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'How far are you?'**
  String get readingUpdateTitle;

  /// No description provided for @readingByPercent.
  ///
  /// In en, this message translates to:
  /// **'Percent'**
  String get readingByPercent;

  /// No description provided for @readingByPages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get readingByPages;

  /// No description provided for @readingPageRead.
  ///
  /// In en, this message translates to:
  /// **'Page you\'re on'**
  String get readingPageRead;

  /// No description provided for @readingTotalPages.
  ///
  /// In en, this message translates to:
  /// **'Pages in the book'**
  String get readingTotalPages;

  /// No description provided for @readingBadPages.
  ///
  /// In en, this message translates to:
  /// **'Enter a page between 0 and the book\'s total (up to 5,000).'**
  String get readingBadPages;

  /// No description provided for @readingSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get readingSave;

  /// No description provided for @readingCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get readingCancel;

  /// No description provided for @readingSaved.
  ///
  /// In en, this message translates to:
  /// **'Progress saved.'**
  String get readingSaved;

  /// No description provided for @readingStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading stats'**
  String get readingStatsTitle;

  /// No description provided for @readingGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'{year} reading goal'**
  String readingGoalTitle(int year);

  /// No description provided for @readingGoalProgress.
  ///
  /// In en, this message translates to:
  /// **'{done} of {goal, plural, =1{1 book} other{{goal} books}}'**
  String readingGoalProgress(int done, int goal);

  /// No description provided for @readingGoalNone.
  ///
  /// In en, this message translates to:
  /// **'{done, plural, =1{1 book} other{{done} books}} finished this year. Set a goal to keep going.'**
  String readingGoalNone(int done);

  /// No description provided for @readingGoalSet.
  ///
  /// In en, this message translates to:
  /// **'Set goal'**
  String get readingGoalSet;

  /// No description provided for @readingGoalChange.
  ///
  /// In en, this message translates to:
  /// **'Change goal'**
  String get readingGoalChange;

  /// No description provided for @readingGoalField.
  ///
  /// In en, this message translates to:
  /// **'Books this year'**
  String get readingGoalField;

  /// No description provided for @readingGoalBad.
  ///
  /// In en, this message translates to:
  /// **'Choose between 1 and 365 books.'**
  String get readingGoalBad;

  /// No description provided for @readingStreak.
  ///
  /// In en, this message translates to:
  /// **'{days}-day streak'**
  String readingStreak(int days);

  /// No description provided for @readingStreakNone.
  ///
  /// In en, this message translates to:
  /// **'No streak yet'**
  String get readingStreakNone;

  /// No description provided for @readingStreakToday.
  ///
  /// In en, this message translates to:
  /// **'You read today. Keep it up!'**
  String get readingStreakToday;

  /// No description provided for @readingStreakNotYet.
  ///
  /// In en, this message translates to:
  /// **'Update a book\'s progress today to keep it going.'**
  String get readingStreakNotYet;

  /// No description provided for @readingPerMonth.
  ///
  /// In en, this message translates to:
  /// **'Books finished each month'**
  String get readingPerMonth;

  /// No description provided for @readingTopCategories.
  ///
  /// In en, this message translates to:
  /// **'Favourite categories'**
  String get readingTopCategories;

  /// No description provided for @readingTopCategoriesNone.
  ///
  /// In en, this message translates to:
  /// **'Finish a book to see your favourites.'**
  String get readingTopCategoriesNone;

  /// No description provided for @readingCategoryCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 book} other{{count} books}}'**
  String readingCategoryCount(int count);

  /// No description provided for @readingFinishedShare.
  ///
  /// In en, this message translates to:
  /// **'Tell readers what you thought'**
  String get readingFinishedShare;

  /// No description provided for @readingWriteReview.
  ///
  /// In en, this message translates to:
  /// **'Write a review'**
  String get readingWriteReview;

  /// No description provided for @readingPostBite.
  ///
  /// In en, this message translates to:
  /// **'Post a Bite'**
  String get readingPostBite;

  /// No description provided for @listingEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit listing'**
  String get listingEditTitle;

  /// No description provided for @listingSendForReview.
  ///
  /// In en, this message translates to:
  /// **'Send for review'**
  String get listingSendForReview;

  /// No description provided for @listingSentForReview.
  ///
  /// In en, this message translates to:
  /// **'Sent for review. A moderator checks it before it goes live.'**
  String get listingSentForReview;

  /// No description provided for @listingDraftSaved.
  ///
  /// In en, this message translates to:
  /// **'Draft saved. Finish it from My Listings.'**
  String get listingDraftSaved;

  /// No description provided for @listingSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save the listing. Try again.'**
  String get listingSaveFailed;

  /// No description provided for @listingEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get listingEdit;

  /// No description provided for @listingEditResend.
  ///
  /// In en, this message translates to:
  /// **'Edit and send again'**
  String get listingEditResend;

  /// No description provided for @listingNote.
  ///
  /// In en, this message translates to:
  /// **'About your copy (optional)'**
  String get listingNote;

  /// No description provided for @listingNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Anything a buyer should know: marks, missing pages, edition.'**
  String get listingNoteHint;

  /// No description provided for @listingPhotosHelp.
  ///
  /// In en, this message translates to:
  /// **'Photos of your own copy. Front and back covers are needed, and a photo of any damage you flagged.'**
  String get listingPhotosHelp;

  /// No description provided for @listingPhotoFront.
  ///
  /// In en, this message translates to:
  /// **'Front cover'**
  String get listingPhotoFront;

  /// No description provided for @listingPhotoBack.
  ///
  /// In en, this message translates to:
  /// **'Back cover'**
  String get listingPhotoBack;

  /// No description provided for @listingPhotoSpine.
  ///
  /// In en, this message translates to:
  /// **'Spine'**
  String get listingPhotoSpine;

  /// No description provided for @listingPhotoInside.
  ///
  /// In en, this message translates to:
  /// **'Inside page'**
  String get listingPhotoInside;

  /// No description provided for @listingPhotoDamage.
  ///
  /// In en, this message translates to:
  /// **'Damage'**
  String get listingPhotoDamage;

  /// No description provided for @listingPhotoNeeded.
  ///
  /// In en, this message translates to:
  /// **'Needed'**
  String get listingPhotoNeeded;

  /// No description provided for @listingPhotoSaved.
  ///
  /// In en, this message translates to:
  /// **'Uploaded'**
  String get listingPhotoSaved;

  /// No description provided for @listingPhotoAdd.
  ///
  /// In en, this message translates to:
  /// **'Add a photo'**
  String get listingPhotoAdd;

  /// No description provided for @listingPhotoRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get listingPhotoRemove;

  /// No description provided for @listingProblemTitle.
  ///
  /// In en, this message translates to:
  /// **'Add the book\'s title.'**
  String get listingProblemTitle;

  /// No description provided for @listingProblemTitleLong.
  ///
  /// In en, this message translates to:
  /// **'Keep the title under 120 characters.'**
  String get listingProblemTitleLong;

  /// No description provided for @listingProblemNoteLong.
  ///
  /// In en, this message translates to:
  /// **'Keep the note under 500 characters.'**
  String get listingProblemNoteLong;

  /// No description provided for @listingProblemPrice.
  ///
  /// In en, this message translates to:
  /// **'Set your price.'**
  String get listingProblemPrice;

  /// No description provided for @listingProblemPriceHigh.
  ///
  /// In en, this message translates to:
  /// **'That price is too high: up to ৳50,000.'**
  String get listingProblemPriceHigh;

  /// No description provided for @listingProblemFront.
  ///
  /// In en, this message translates to:
  /// **'Add a photo of the front cover.'**
  String get listingProblemFront;

  /// No description provided for @listingProblemBack.
  ///
  /// In en, this message translates to:
  /// **'Add a photo of the back cover.'**
  String get listingProblemBack;

  /// No description provided for @listingProblemDamage.
  ///
  /// In en, this message translates to:
  /// **'You flagged damage: add a photo of it.'**
  String get listingProblemDamage;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan a book'**
  String get scanTitle;

  /// No description provided for @scanAim.
  ///
  /// In en, this message translates to:
  /// **'Point the camera at the barcode on the back of the book.'**
  String get scanAim;

  /// No description provided for @scanNoCamera.
  ///
  /// In en, this message translates to:
  /// **'The camera isn\'t available here. Type the ISBN from the back of the book instead.'**
  String get scanNoCamera;

  /// No description provided for @scanCameraError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open the camera. Type the ISBN instead.'**
  String get scanCameraError;

  /// No description provided for @scanIsbnLabel.
  ///
  /// In en, this message translates to:
  /// **'Or type the ISBN'**
  String get scanIsbnLabel;

  /// No description provided for @scanIsbnHint.
  ///
  /// In en, this message translates to:
  /// **'978…'**
  String get scanIsbnHint;

  /// No description provided for @scanFind.
  ///
  /// In en, this message translates to:
  /// **'Find'**
  String get scanFind;

  /// No description provided for @scanInvalid.
  ///
  /// In en, this message translates to:
  /// **'That isn\'t a valid ISBN. Check the 10 or 13 digits.'**
  String get scanInvalid;

  /// No description provided for @scanIsbn.
  ///
  /// In en, this message translates to:
  /// **'ISBN {isbn}'**
  String scanIsbn(String isbn);

  /// No description provided for @scanNewFrom.
  ///
  /// In en, this message translates to:
  /// **'New from {price}'**
  String scanNewFrom(String price);

  /// No description provided for @scanOpenBook.
  ///
  /// In en, this message translates to:
  /// **'Open book page'**
  String get scanOpenBook;

  /// No description provided for @scanSellCopy.
  ///
  /// In en, this message translates to:
  /// **'Sell your copy'**
  String get scanSellCopy;

  /// No description provided for @scanNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'We don\'t have this book yet'**
  String get scanNotFoundTitle;

  /// No description provided for @scanNotFoundBody.
  ///
  /// In en, this message translates to:
  /// **'ISBN {isbn} isn\'t in Waraqah\'s catalog.'**
  String scanNotFoundBody(String isbn);

  /// No description provided for @scanRequest.
  ///
  /// In en, this message translates to:
  /// **'Request this book'**
  String get scanRequest;

  /// No description provided for @scanListAnyway.
  ///
  /// In en, this message translates to:
  /// **'List it anyway'**
  String get scanListAnyway;

  /// No description provided for @scanSelling.
  ///
  /// In en, this message translates to:
  /// **'From the catalog: {title}'**
  String scanSelling(String title);

  /// No description provided for @requestTitle.
  ///
  /// In en, this message translates to:
  /// **'Request a book'**
  String get requestTitle;

  /// No description provided for @requestIntro.
  ///
  /// In en, this message translates to:
  /// **'Tell us what you\'re looking for. Readers who have it are told, and Waraqah sees what readers want.'**
  String get requestIntro;

  /// No description provided for @requestBookTitle.
  ///
  /// In en, this message translates to:
  /// **'Book title'**
  String get requestBookTitle;

  /// No description provided for @requestBookTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Calculus'**
  String get requestBookTitleHint;

  /// No description provided for @requestAuthor.
  ///
  /// In en, this message translates to:
  /// **'Author (optional)'**
  String get requestAuthor;

  /// No description provided for @requestAuthorHint.
  ///
  /// In en, this message translates to:
  /// **'James Stewart'**
  String get requestAuthorHint;

  /// No description provided for @requestMaxPrice.
  ///
  /// In en, this message translates to:
  /// **'Most you\'d pay, in ৳ (optional)'**
  String get requestMaxPrice;

  /// No description provided for @requestMaxPriceHint.
  ///
  /// In en, this message translates to:
  /// **'900'**
  String get requestMaxPriceHint;

  /// No description provided for @requestNote.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get requestNote;

  /// No description provided for @requestNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Edition, condition, your area…'**
  String get requestNoteHint;

  /// No description provided for @requestTitleMissing.
  ///
  /// In en, this message translates to:
  /// **'Add the book\'s title.'**
  String get requestTitleMissing;

  /// No description provided for @requestTitleTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep the title under {max} characters.'**
  String requestTitleTooLong(int max);

  /// No description provided for @requestBadPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter a price above ৳0.'**
  String get requestBadPrice;

  /// No description provided for @requestNoteTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep the note under {max} characters.'**
  String requestNoteTooLong(int max);

  /// No description provided for @requestSend.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get requestSend;

  /// No description provided for @requestSent.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Request sent. Readers who list it will see it.} =1{Request sent. 1 reader who has it was told.} other{Request sent. {count} readers who have it were told.}}'**
  String requestSent(int count);

  /// No description provided for @requestMine.
  ///
  /// In en, this message translates to:
  /// **'My book requests'**
  String get requestMine;

  /// No description provided for @requestNew.
  ///
  /// In en, this message translates to:
  /// **'New request'**
  String get requestNew;

  /// No description provided for @requestEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No requests yet'**
  String get requestEmptyTitle;

  /// No description provided for @requestEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Ask for a book you can\'t find. Readers who have it will see your request.'**
  String get requestEmptyBody;

  /// No description provided for @requestUnder.
  ///
  /// In en, this message translates to:
  /// **'Under {price}'**
  String requestUnder(String price);

  /// No description provided for @requestMatches.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No copies on sale yet} =1{1 copy on sale now} other{{count} copies on sale now}}'**
  String requestMatches(int count);

  /// No description provided for @requestSeeCopies.
  ///
  /// In en, this message translates to:
  /// **'See copies'**
  String get requestSeeCopies;

  /// No description provided for @requestClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get requestClose;

  /// No description provided for @requestClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get requestClosed;

  /// No description provided for @requestClosedDone.
  ///
  /// In en, this message translates to:
  /// **'Request closed.'**
  String get requestClosedDone;

  /// No description provided for @requestWantedTitle.
  ///
  /// In en, this message translates to:
  /// **'Readers want your books'**
  String get requestWantedTitle;

  /// No description provided for @requestWantedLine.
  ///
  /// In en, this message translates to:
  /// **'{name} is looking for {title}'**
  String requestWantedLine(String name, String title);

  /// No description provided for @requestOpenListing.
  ///
  /// In en, this message translates to:
  /// **'Your listing'**
  String get requestOpenListing;

  /// No description provided for @sellBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Sell Back to Waraqah'**
  String get sellBackTitle;

  /// No description provided for @sellBackIntro.
  ///
  /// In en, this message translates to:
  /// **'Get an instant price for a book you own. A courier picks it up, we check it, and the money goes to your wallet.'**
  String get sellBackIntro;

  /// No description provided for @sellBackFindLabel.
  ///
  /// In en, this message translates to:
  /// **'Which book?'**
  String get sellBackFindLabel;

  /// No description provided for @sellBackFindHint.
  ///
  /// In en, this message translates to:
  /// **'Title or author'**
  String get sellBackFindHint;

  /// No description provided for @sellBackNoBooks.
  ///
  /// In en, this message translates to:
  /// **'No books found. Waraqah buys back printed books from its catalog.'**
  String get sellBackNoBooks;

  /// No description provided for @sellBackChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get sellBackChange;

  /// No description provided for @sellBackCondition.
  ///
  /// In en, this message translates to:
  /// **'Its condition'**
  String get sellBackCondition;

  /// No description provided for @sellBackQuote.
  ///
  /// In en, this message translates to:
  /// **'Waraqah pays {price}'**
  String sellBackQuote(String price);

  /// No description provided for @sellBackQuoteNote.
  ///
  /// In en, this message translates to:
  /// **'If our check finds a different condition, the price follows our grade.'**
  String get sellBackQuoteNote;

  /// No description provided for @sellBackAddress.
  ///
  /// In en, this message translates to:
  /// **'Pickup address'**
  String get sellBackAddress;

  /// No description provided for @sellBackAddressHint.
  ///
  /// In en, this message translates to:
  /// **'House, road, area'**
  String get sellBackAddressHint;

  /// No description provided for @sellBackAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept {price} and book a pickup'**
  String sellBackAccept(String price);

  /// No description provided for @sellBackBooked.
  ///
  /// In en, this message translates to:
  /// **'Pickup booked. We\'ll pay into your wallet once we\'ve checked the book.'**
  String get sellBackBooked;

  /// No description provided for @sellBackMine.
  ///
  /// In en, this message translates to:
  /// **'My Sell Backs'**
  String get sellBackMine;

  /// No description provided for @sellBackEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing sold back yet.'**
  String get sellBackEmpty;

  /// No description provided for @sellBackStatusScheduled.
  ///
  /// In en, this message translates to:
  /// **'Pickup booked'**
  String get sellBackStatusScheduled;

  /// No description provided for @sellBackStatusPickedUp.
  ///
  /// In en, this message translates to:
  /// **'Being checked'**
  String get sellBackStatusPickedUp;

  /// No description provided for @sellBackStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid {price}'**
  String sellBackStatusPaid(String price);

  /// No description provided for @sellBackStatusReturned.
  ///
  /// In en, this message translates to:
  /// **'Sent back to you'**
  String get sellBackStatusReturned;

  /// No description provided for @sellBackQuoted.
  ///
  /// In en, this message translates to:
  /// **'Quoted {price}'**
  String sellBackQuoted(String price);

  /// No description provided for @sellBackFrom.
  ///
  /// In en, this message translates to:
  /// **'Sold by {name}'**
  String sellBackFrom(String name);

  /// No description provided for @sellBackReaderSays.
  ///
  /// In en, this message translates to:
  /// **'Reader says: {condition}'**
  String sellBackReaderSays(String condition);

  /// No description provided for @sellBackGradeAs.
  ///
  /// In en, this message translates to:
  /// **'Our grade'**
  String get sellBackGradeAs;

  /// No description provided for @sellBackPayAndPublish.
  ///
  /// In en, this message translates to:
  /// **'Pay {pay} · sell for {resell}'**
  String sellBackPayAndPublish(String pay, String resell);

  /// No description provided for @sellBackReturn.
  ///
  /// In en, this message translates to:
  /// **'Send it back'**
  String get sellBackReturn;

  /// No description provided for @sellBackGraded.
  ///
  /// In en, this message translates to:
  /// **'Paid, and on sale as Certified Used.'**
  String get sellBackGraded;

  /// No description provided for @sellBackReturned.
  ///
  /// In en, this message translates to:
  /// **'Sent back to the reader.'**
  String get sellBackReturned;

  /// No description provided for @sellBackAdminTitle.
  ///
  /// In en, this message translates to:
  /// **'Trade-ins'**
  String get sellBackAdminTitle;

  /// No description provided for @sellBackAdminHint.
  ///
  /// In en, this message translates to:
  /// **'Grade Sell Back books and publish them as Certified Used'**
  String get sellBackAdminHint;

  /// No description provided for @sellBackAdminEmpty.
  ///
  /// In en, this message translates to:
  /// **'No books waiting to be graded.'**
  String get sellBackAdminEmpty;

  /// No description provided for @usedMarketTitle.
  ///
  /// In en, this message translates to:
  /// **'P2P Marketplace'**
  String get usedMarketTitle;

  /// No description provided for @usedSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search second-hand books...'**
  String get usedSearchHint;

  /// No description provided for @usedHandledTitle.
  ///
  /// In en, this message translates to:
  /// **'Let Waraqah handle it'**
  String get usedHandledTitle;

  /// No description provided for @usedHandledBody.
  ///
  /// In en, this message translates to:
  /// **'Pay in the app and a courier brings the book. Waraqah holds your money until you confirm it\'s as described.'**
  String get usedHandledBody;

  /// No description provided for @usedHandledBuy.
  ///
  /// In en, this message translates to:
  /// **'Buy for {price}'**
  String usedHandledBuy(String price);

  /// No description provided for @usedBuyTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy through Waraqah'**
  String get usedBuyTitle;

  /// No description provided for @usedBuyBook.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get usedBuyBook;

  /// No description provided for @usedBuyDelivery.
  ///
  /// In en, this message translates to:
  /// **'Courier delivery'**
  String get usedBuyDelivery;

  /// No description provided for @usedBuyTotal.
  ///
  /// In en, this message translates to:
  /// **'You pay'**
  String get usedBuyTotal;

  /// No description provided for @usedBuyHeld.
  ///
  /// In en, this message translates to:
  /// **'Waraqah holds this until you confirm the book is as described.'**
  String get usedBuyHeld;

  /// No description provided for @usedBuyPayWith.
  ///
  /// In en, this message translates to:
  /// **'Pay with'**
  String get usedBuyPayWith;

  /// No description provided for @usedBuyNoCod.
  ///
  /// In en, this message translates to:
  /// **'No cash on delivery: Waraqah holds the money until you confirm.'**
  String get usedBuyNoCod;

  /// No description provided for @usedBuyPay.
  ///
  /// In en, this message translates to:
  /// **'Pay {price}'**
  String usedBuyPay(String price);

  /// No description provided for @usedBuyUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This book isn\'t on sale any more.'**
  String get usedBuyUnavailable;

  /// No description provided for @usedSaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Handled sale'**
  String get usedSaleTitle;

  /// No description provided for @usedSaleFrom.
  ///
  /// In en, this message translates to:
  /// **'From {name}'**
  String usedSaleFrom(String name);

  /// No description provided for @usedSaleTo.
  ///
  /// In en, this message translates to:
  /// **'To {name}'**
  String usedSaleTo(String name);

  /// No description provided for @usedSaleStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get usedSaleStatusPaid;

  /// No description provided for @usedSaleStatusSent.
  ///
  /// In en, this message translates to:
  /// **'On its way'**
  String get usedSaleStatusSent;

  /// No description provided for @usedSaleStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get usedSaleStatusCompleted;

  /// No description provided for @usedSaleStatusDisputed.
  ///
  /// In en, this message translates to:
  /// **'In dispute'**
  String get usedSaleStatusDisputed;

  /// No description provided for @usedSaleStatusRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get usedSaleStatusRefunded;

  /// No description provided for @usedSaleStatusReleased.
  ///
  /// In en, this message translates to:
  /// **'Paid to the seller'**
  String get usedSaleStatusReleased;

  /// No description provided for @usedSaleStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get usedSaleStatusCancelled;

  /// No description provided for @usedSaleHintBuyerPaid.
  ///
  /// In en, this message translates to:
  /// **'Waraqah is holding {price}. {name} will hand the book to the courier.'**
  String usedSaleHintBuyerPaid(String name, String price);

  /// No description provided for @usedSaleHintSellerPaid.
  ///
  /// In en, this message translates to:
  /// **'{name} paid. Hand the book to the courier, then mark it sent. You get {price} once they confirm.'**
  String usedSaleHintSellerPaid(String name, String price);

  /// No description provided for @usedSaleHintBuyerSent.
  ///
  /// In en, this message translates to:
  /// **'Check the book when it arrives. Confirm it\'s as described, or report a problem.'**
  String get usedSaleHintBuyerSent;

  /// No description provided for @usedSaleHintSellerSent.
  ///
  /// In en, this message translates to:
  /// **'On its way to {name}. Waraqah pays you {price} when they confirm.'**
  String usedSaleHintSellerSent(String name, String price);

  /// No description provided for @usedSaleHintDisputed.
  ///
  /// In en, this message translates to:
  /// **'A moderator is looking at it. The money stays with Waraqah until they decide.'**
  String get usedSaleHintDisputed;

  /// No description provided for @usedSaleHintBuyerDone.
  ///
  /// In en, this message translates to:
  /// **'You confirmed it, and {name} has been paid.'**
  String usedSaleHintBuyerDone(String name);

  /// No description provided for @usedSaleHintSellerDone.
  ///
  /// In en, this message translates to:
  /// **'{price} is yours. It goes out with your next payout.'**
  String usedSaleHintSellerDone(String price);

  /// No description provided for @usedSaleHintBuyerRefunded.
  ///
  /// In en, this message translates to:
  /// **'A moderator refunded you: {price} is back in your wallet.'**
  String usedSaleHintBuyerRefunded(String price);

  /// No description provided for @usedSaleHintSellerRefunded.
  ///
  /// In en, this message translates to:
  /// **'A moderator refunded the buyer. The book comes back to you.'**
  String get usedSaleHintSellerRefunded;

  /// No description provided for @usedSaleHintBuyerReleased.
  ///
  /// In en, this message translates to:
  /// **'A moderator decided for the seller and paid them.'**
  String get usedSaleHintBuyerReleased;

  /// No description provided for @usedSaleHintSellerReleased.
  ///
  /// In en, this message translates to:
  /// **'A moderator decided for you: {price} is yours.'**
  String usedSaleHintSellerReleased(String price);

  /// No description provided for @usedSaleHintCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled before it was sent. The money went back to the buyer\'s wallet.'**
  String get usedSaleHintCancelled;

  /// No description provided for @usedSaleSend.
  ///
  /// In en, this message translates to:
  /// **'Mark as sent'**
  String get usedSaleSend;

  /// No description provided for @usedSaleCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel and refund'**
  String get usedSaleCancel;

  /// No description provided for @usedSaleConfirm.
  ///
  /// In en, this message translates to:
  /// **'It\'s as described'**
  String get usedSaleConfirm;

  /// No description provided for @usedSaleProblem.
  ///
  /// In en, this message translates to:
  /// **'Report a problem'**
  String get usedSaleProblem;

  /// No description provided for @usedSaleFee.
  ///
  /// In en, this message translates to:
  /// **'Waraqah fee (5%)'**
  String get usedSaleFee;

  /// No description provided for @usedSaleYouGet.
  ///
  /// In en, this message translates to:
  /// **'You get'**
  String get usedSaleYouGet;

  /// No description provided for @usedDisputeTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s wrong with the book?'**
  String get usedDisputeTitle;

  /// No description provided for @usedDisputeNotAsDescribed.
  ///
  /// In en, this message translates to:
  /// **'Not as described'**
  String get usedDisputeNotAsDescribed;

  /// No description provided for @usedDisputeDamaged.
  ///
  /// In en, this message translates to:
  /// **'Damaged'**
  String get usedDisputeDamaged;

  /// No description provided for @usedDisputePhotocopy.
  ///
  /// In en, this message translates to:
  /// **'It\'s a photocopy'**
  String get usedDisputePhotocopy;

  /// No description provided for @usedDisputeWrongBook.
  ///
  /// In en, this message translates to:
  /// **'Wrong book'**
  String get usedDisputeWrongBook;

  /// No description provided for @usedDisputeNotReceived.
  ///
  /// In en, this message translates to:
  /// **'It never arrived'**
  String get usedDisputeNotReceived;

  /// No description provided for @usedDisputeNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Tell the moderator what happened'**
  String get usedDisputeNoteHint;

  /// No description provided for @usedDisputeSend.
  ///
  /// In en, this message translates to:
  /// **'Send to a moderator'**
  String get usedDisputeSend;

  /// No description provided for @usedDisputeSent.
  ///
  /// In en, this message translates to:
  /// **'Sent. A moderator will look at it.'**
  String get usedDisputeSent;

  /// No description provided for @usedSalesTitle.
  ///
  /// In en, this message translates to:
  /// **'Waraqah-handled sales'**
  String get usedSalesTitle;

  /// No description provided for @usedSalesBuying.
  ///
  /// In en, this message translates to:
  /// **'Buying'**
  String get usedSalesBuying;

  /// No description provided for @usedSalesSelling.
  ///
  /// In en, this message translates to:
  /// **'Selling'**
  String get usedSalesSelling;

  /// No description provided for @usedSalesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No handled sales yet. On a used book, choose \"Let Waraqah handle it\".'**
  String get usedSalesEmpty;

  /// No description provided for @usedEarningsTitle.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get usedEarningsTitle;

  /// No description provided for @usedEarningsHeld.
  ///
  /// In en, this message translates to:
  /// **'Held by Waraqah'**
  String get usedEarningsHeld;

  /// No description provided for @usedEarningsEarned.
  ///
  /// In en, this message translates to:
  /// **'Earned'**
  String get usedEarningsEarned;

  /// No description provided for @usedEarningsPaidOut.
  ///
  /// In en, this message translates to:
  /// **'Paid out'**
  String get usedEarningsPaidOut;

  /// No description provided for @usedEarningsAvailable.
  ///
  /// In en, this message translates to:
  /// **'Ready to pay out'**
  String get usedEarningsAvailable;

  /// No description provided for @usedEarningsPayout.
  ///
  /// In en, this message translates to:
  /// **'Pay {price} to my bKash'**
  String usedEarningsPayout(String price);

  /// No description provided for @usedEarningsPaid.
  ///
  /// In en, this message translates to:
  /// **'{price} is on its way to your bKash.'**
  String usedEarningsPaid(String price);

  /// No description provided for @usedEarningsPayouts.
  ///
  /// In en, this message translates to:
  /// **'Payouts'**
  String get usedEarningsPayouts;

  /// No description provided for @usedEarningsNoPayouts.
  ///
  /// In en, this message translates to:
  /// **'No payouts yet.'**
  String get usedEarningsNoPayouts;

  /// No description provided for @usedEarningsPayoutLine.
  ///
  /// In en, this message translates to:
  /// **'{price} to bKash'**
  String usedEarningsPayoutLine(String price);

  /// No description provided for @usedDisputeCase.
  ///
  /// In en, this message translates to:
  /// **'{buyer} bought from {seller}'**
  String usedDisputeCase(String buyer, String seller);

  /// No description provided for @usedDisputeHeld.
  ///
  /// In en, this message translates to:
  /// **'Waraqah holds {price}'**
  String usedDisputeHeld(String price);

  /// No description provided for @usedDisputeRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund the buyer'**
  String get usedDisputeRefund;

  /// No description provided for @usedDisputePaySeller.
  ///
  /// In en, this message translates to:
  /// **'Pay the seller'**
  String get usedDisputePaySeller;

  /// No description provided for @moderationLogRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded the buyer for'**
  String get moderationLogRefunded;

  /// No description provided for @moderationLogPaidSeller.
  ///
  /// In en, this message translates to:
  /// **'Paid the seller for'**
  String get moderationLogPaidSeller;

  /// No description provided for @usedListingTitle.
  ///
  /// In en, this message translates to:
  /// **'Used copy'**
  String get usedListingTitle;

  /// No description provided for @usedListingMissing.
  ///
  /// In en, this message translates to:
  /// **'This listing isn\'t available.'**
  String get usedListingMissing;

  /// No description provided for @usedStatusAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get usedStatusAvailable;

  /// No description provided for @usedStatusReserved.
  ///
  /// In en, this message translates to:
  /// **'Reserved'**
  String get usedStatusReserved;

  /// No description provided for @usedNegotiable.
  ///
  /// In en, this message translates to:
  /// **'Price negotiable'**
  String get usedNegotiable;

  /// No description provided for @usedFixedPrice.
  ///
  /// In en, this message translates to:
  /// **'Fixed price'**
  String get usedFixedPrice;

  /// No description provided for @usedPrefersMeetup.
  ///
  /// In en, this message translates to:
  /// **'Prefers to meet up'**
  String get usedPrefersMeetup;

  /// No description provided for @usedPrefersCourier.
  ///
  /// In en, this message translates to:
  /// **'Prefers courier'**
  String get usedPrefersCourier;

  /// No description provided for @usedYourListing.
  ///
  /// In en, this message translates to:
  /// **'Your listing'**
  String get usedYourListing;

  /// No description provided for @usedMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get usedMessage;

  /// No description provided for @usedOpenChat.
  ///
  /// In en, this message translates to:
  /// **'Open chat'**
  String get usedOpenChat;

  /// No description provided for @usedSoldBy.
  ///
  /// In en, this message translates to:
  /// **'{name} · {place}'**
  String usedSoldBy(String name, String place);

  /// No description provided for @usedSaveVsNew.
  ///
  /// In en, this message translates to:
  /// **'Save {amount} vs new'**
  String usedSaveVsNew(String amount);

  /// No description provided for @usedSellerNote.
  ///
  /// In en, this message translates to:
  /// **'From the seller'**
  String get usedSellerNote;

  /// No description provided for @usedConditionAndSafety.
  ///
  /// In en, this message translates to:
  /// **'Described as {condition}. Check the copy before you pay, and meet somewhere public and busy.'**
  String usedConditionAndSafety(String condition);

  /// No description provided for @usedOfferWaiting.
  ///
  /// In en, this message translates to:
  /// **'Your offer of {amount} is waiting for {name}.'**
  String usedOfferWaiting(String amount, String name);

  /// No description provided for @usedOffersAndMessages.
  ///
  /// In en, this message translates to:
  /// **'Offers and messages'**
  String get usedOffersAndMessages;

  /// No description provided for @usedNoOffersYet.
  ///
  /// In en, this message translates to:
  /// **'No offers yet. Buyers\' offers and messages show up here and in your inbox.'**
  String get usedNoOffersYet;

  /// No description provided for @usedFilterCondition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get usedFilterCondition;

  /// No description provided for @usedFilterAnyCondition.
  ///
  /// In en, this message translates to:
  /// **'Any condition'**
  String get usedFilterAnyCondition;

  /// No description provided for @usedFilterLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get usedFilterLocation;

  /// No description provided for @usedFilterAllLocations.
  ///
  /// In en, this message translates to:
  /// **'All of Bangladesh'**
  String get usedFilterAllLocations;

  /// No description provided for @usedFilterDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get usedFilterDistrict;

  /// No description provided for @usedFilterAllDistricts.
  ///
  /// In en, this message translates to:
  /// **'All districts'**
  String get usedFilterAllDistricts;

  /// No description provided for @usedFilterSection.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get usedFilterSection;

  /// No description provided for @usedFilterAllSections.
  ///
  /// In en, this message translates to:
  /// **'All sections'**
  String get usedFilterAllSections;

  /// No description provided for @usedFilterCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get usedFilterCategory;

  /// No description provided for @usedFilterAllCategories.
  ///
  /// In en, this message translates to:
  /// **'All categories'**
  String get usedFilterAllCategories;

  /// No description provided for @usedFilterPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get usedFilterPrice;

  /// No description provided for @usedFilterAnyPrice.
  ///
  /// In en, this message translates to:
  /// **'Any price'**
  String get usedFilterAnyPrice;

  /// No description provided for @usedFilterUnder.
  ///
  /// In en, this message translates to:
  /// **'Under {price}'**
  String usedFilterUnder(String price);

  /// No description provided for @usedSort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get usedSort;

  /// No description provided for @usedSortNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest first'**
  String get usedSortNewest;

  /// No description provided for @usedSortPriceLow.
  ///
  /// In en, this message translates to:
  /// **'Price: low to high'**
  String get usedSortPriceLow;

  /// No description provided for @usedSortPriceHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: high to low'**
  String get usedSortPriceHigh;

  /// No description provided for @inboxTitle.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inboxTitle;

  /// No description provided for @inboxUnread.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{All caught up} =1{1 new} other{{count} new}}'**
  String inboxUnread(int count);

  /// No description provided for @inboxBuying.
  ///
  /// In en, this message translates to:
  /// **'Buying'**
  String get inboxBuying;

  /// No description provided for @inboxSelling.
  ///
  /// In en, this message translates to:
  /// **'Selling'**
  String get inboxSelling;

  /// No description provided for @inboxMissing.
  ///
  /// In en, this message translates to:
  /// **'This conversation isn\'t available.'**
  String get inboxMissing;

  /// No description provided for @inboxEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No offers or messages yet'**
  String get inboxEmptyTitle;

  /// No description provided for @inboxEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'When you make an offer on a used book, or someone wants one of yours, the conversation shows up here.'**
  String get inboxEmptyBody;

  /// No description provided for @inboxBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse used books'**
  String get inboxBrowse;

  /// No description provided for @chatHint.
  ///
  /// In en, this message translates to:
  /// **'Write a message'**
  String get chatHint;

  /// No description provided for @chatSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get chatSend;

  /// No description provided for @chatYou.
  ///
  /// In en, this message translates to:
  /// **'You: {text}'**
  String chatYou(String text);

  /// No description provided for @chatEventAcceptedByMe.
  ///
  /// In en, this message translates to:
  /// **'You accepted {name}\'s offer of {amount}. The book is reserved for {name}.'**
  String chatEventAcceptedByMe(String name, String amount);

  /// No description provided for @chatEventAcceptedByThem.
  ///
  /// In en, this message translates to:
  /// **'{name} accepted your offer of {amount}. The book is reserved for you.'**
  String chatEventAcceptedByThem(String name, String amount);

  /// No description provided for @chatEventDeclinedByMe.
  ///
  /// In en, this message translates to:
  /// **'You declined {name}\'s offer of {amount}.'**
  String chatEventDeclinedByMe(String name, String amount);

  /// No description provided for @chatEventDeclinedByThem.
  ///
  /// In en, this message translates to:
  /// **'{name} declined your offer of {amount}.'**
  String chatEventDeclinedByThem(String name, String amount);

  /// No description provided for @chatEventReservedElsewhere.
  ///
  /// In en, this message translates to:
  /// **'This book is now reserved for another buyer.'**
  String get chatEventReservedElsewhere;

  /// No description provided for @chatEventAvailableByMe.
  ///
  /// In en, this message translates to:
  /// **'You made the book available again.'**
  String get chatEventAvailableByMe;

  /// No description provided for @chatEventAvailableByThem.
  ///
  /// In en, this message translates to:
  /// **'{name} made the book available again.'**
  String chatEventAvailableByThem(String name);

  /// No description provided for @chatEventSoldByMe.
  ///
  /// In en, this message translates to:
  /// **'You marked the book as sold to {name}.'**
  String chatEventSoldByMe(String name);

  /// No description provided for @chatEventSoldByThem.
  ///
  /// In en, this message translates to:
  /// **'{name} marked the book as sold to you.'**
  String chatEventSoldByThem(String name);

  /// No description provided for @chatEventSoldElsewhere.
  ///
  /// In en, this message translates to:
  /// **'This book was sold to another buyer.'**
  String get chatEventSoldElsewhere;

  /// No description provided for @chatReservedForYou.
  ///
  /// In en, this message translates to:
  /// **'Reserved for you'**
  String get chatReservedForYou;

  /// No description provided for @chatPayOnHandover.
  ///
  /// In en, this message translates to:
  /// **'Agree on the time and place here. You pay the seller directly at the handover; Waraqah doesn\'t handle the money.'**
  String get chatPayOnHandover;

  /// No description provided for @chatReservedFor.
  ///
  /// In en, this message translates to:
  /// **'Reserved for {name}'**
  String chatReservedFor(String name);

  /// No description provided for @chatSellerNext.
  ///
  /// In en, this message translates to:
  /// **'Agree on the handover here. Mark it sold once {name} has the book.'**
  String chatSellerNext(String name);

  /// No description provided for @chatBoughtIt.
  ///
  /// In en, this message translates to:
  /// **'You bought this book'**
  String get chatBoughtIt;

  /// No description provided for @chatSoldTo.
  ///
  /// In en, this message translates to:
  /// **'Sold to {name}'**
  String chatSoldTo(String name);

  /// No description provided for @chatSoldElsewhere.
  ///
  /// In en, this message translates to:
  /// **'Sold to another buyer'**
  String get chatSoldElsewhere;

  /// No description provided for @chatReservedElsewhere.
  ///
  /// In en, this message translates to:
  /// **'Reserved for another buyer'**
  String get chatReservedElsewhere;

  /// No description provided for @chatMarkSold.
  ///
  /// In en, this message translates to:
  /// **'Mark as sold'**
  String get chatMarkSold;

  /// No description provided for @chatMakeAvailable.
  ///
  /// In en, this message translates to:
  /// **'Make available'**
  String get chatMakeAvailable;

  /// No description provided for @chatMarkSoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Mark as sold?'**
  String get chatMarkSoldTitle;

  /// No description provided for @chatMarkSoldBody.
  ///
  /// In en, this message translates to:
  /// **'Do this after {name} has the book. Other buyers will be told it\'s sold.'**
  String chatMarkSoldBody(String name);

  /// No description provided for @chatMakeAvailableTitle.
  ///
  /// In en, this message translates to:
  /// **'Make the book available again?'**
  String get chatMakeAvailableTitle;

  /// No description provided for @chatMakeAvailableBody.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s reservation ends and other buyers can make offers again.'**
  String chatMakeAvailableBody(String name);

  /// No description provided for @offerMake.
  ///
  /// In en, this message translates to:
  /// **'Make an offer'**
  String get offerMake;

  /// No description provided for @offerTo.
  ///
  /// In en, this message translates to:
  /// **'To {name} · asking {amount}'**
  String offerTo(String name, String amount);

  /// No description provided for @offerYourPrice.
  ///
  /// In en, this message translates to:
  /// **'Your price (৳)'**
  String get offerYourPrice;

  /// No description provided for @offerFixedPrice.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s price of {amount} isn\'t negotiable.'**
  String offerFixedPrice(String name, String amount);

  /// No description provided for @offerTooHigh.
  ///
  /// In en, this message translates to:
  /// **'Offer {amount} or less.'**
  String offerTooHigh(String amount);

  /// No description provided for @offerHandover.
  ///
  /// In en, this message translates to:
  /// **'How do you want the book?'**
  String get offerHandover;

  /// No description provided for @offerMeetup.
  ///
  /// In en, this message translates to:
  /// **'Meetup'**
  String get offerMeetup;

  /// No description provided for @offerCourier.
  ///
  /// In en, this message translates to:
  /// **'Courier'**
  String get offerCourier;

  /// No description provided for @offerSellerPrefers.
  ///
  /// In en, this message translates to:
  /// **'{method, select, delivery{{name} prefers to send it by courier.} other{{name} prefers to meet up.}}'**
  String offerSellerPrefers(String name, String method);

  /// No description provided for @offerSend.
  ///
  /// In en, this message translates to:
  /// **'Send offer'**
  String get offerSend;

  /// No description provided for @offerSent.
  ///
  /// In en, this message translates to:
  /// **'Offer sent to {name}'**
  String offerSent(String name);

  /// No description provided for @offerCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Offer · {amount}'**
  String offerCardTitle(String amount);

  /// No description provided for @offerWaitingFor.
  ///
  /// In en, this message translates to:
  /// **'Waiting for {name}'**
  String offerWaitingFor(String name);

  /// No description provided for @offerStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Waiting'**
  String get offerStatusPending;

  /// No description provided for @offerStatusAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get offerStatusAccepted;

  /// No description provided for @offerStatusDeclined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get offerStatusDeclined;

  /// No description provided for @offerStatusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get offerStatusClosed;

  /// No description provided for @offerAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get offerAccept;

  /// No description provided for @offerDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get offerDecline;

  /// No description provided for @offerReservedHint.
  ///
  /// In en, this message translates to:
  /// **'The book is reserved for another buyer. Make it available again to accept this offer.'**
  String get offerReservedHint;

  /// No description provided for @sellerTitle.
  ///
  /// In en, this message translates to:
  /// **'Reader profile'**
  String get sellerTitle;

  /// No description provided for @sellerMissing.
  ///
  /// In en, this message translates to:
  /// **'This reader isn\'t on the marketplace.'**
  String get sellerMissing;

  /// No description provided for @sellerMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String sellerMemberSince(String date);

  /// No description provided for @sellerBooksSold.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No books sold yet} =1{1 book sold} other{{count} books sold}}'**
  String sellerBooksSold(int count);

  /// No description provided for @sellerRating.
  ///
  /// In en, this message translates to:
  /// **'{average} · {count, plural, =1{1 rating} other{{count} ratings}}'**
  String sellerRating(String average, int count);

  /// No description provided for @sellerNoRatings.
  ///
  /// In en, this message translates to:
  /// **'No ratings yet'**
  String get sellerNoRatings;

  /// No description provided for @sellerReviews.
  ///
  /// In en, this message translates to:
  /// **'What people say'**
  String get sellerReviews;

  /// No description provided for @sellerOnSale.
  ///
  /// In en, this message translates to:
  /// **'On sale now'**
  String get sellerOnSale;

  /// No description provided for @sellerNothingOnSale.
  ///
  /// In en, this message translates to:
  /// **'Nothing on sale right now.'**
  String get sellerNothingOnSale;

  /// No description provided for @sellerSeeProfile.
  ///
  /// In en, this message translates to:
  /// **'See their profile'**
  String get sellerSeeProfile;

  /// No description provided for @chatRateTitle.
  ///
  /// In en, this message translates to:
  /// **'How was the deal with {name}?'**
  String chatRateTitle(String name);

  /// No description provided for @chatRateStars.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 star} other{{count} stars}}'**
  String chatRateStars(int count);

  /// No description provided for @chatRateHint.
  ///
  /// In en, this message translates to:
  /// **'A few words (optional)'**
  String get chatRateHint;

  /// No description provided for @chatRateSend.
  ///
  /// In en, this message translates to:
  /// **'Send rating'**
  String get chatRateSend;

  /// No description provided for @chatRated.
  ///
  /// In en, this message translates to:
  /// **'Thanks! It shows on {name}\'s profile.'**
  String chatRated(String name);

  /// No description provided for @chatYouRated.
  ///
  /// In en, this message translates to:
  /// **'You rated {name}'**
  String chatYouRated(String name);

  /// No description provided for @chatTheyRated.
  ///
  /// In en, this message translates to:
  /// **'{name} rated you'**
  String chatTheyRated(String name);

  /// No description provided for @chatNotRatedYet.
  ///
  /// In en, this message translates to:
  /// **'{name} hasn\'t rated you yet.'**
  String chatNotRatedYet(String name);
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
