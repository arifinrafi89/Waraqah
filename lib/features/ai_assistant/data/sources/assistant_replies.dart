import 'assistant_intent.dart';

/// What the assistant says, in English or Bangla (`lang` is `bn`). The
/// server owns these words, like any reply text.
abstract final class AssistantReplies {
  static String greeting(bool bn) => bn
      ? 'আসসালামু আলাইকুম! ওয়ারাকাহর পুরো ক্যাটালগ আমার জানা। কোনো বই, বিষয়, লেখক বা বাজেট বলুন।'
      : "Assalamu Alaikum! I know Waraqah's whole catalog. Ask for a book, a topic, an author or a budget.";

  static String found(bool bn, AssistantIntent intent) {
    final price = intent.maxPrice;
    final what = _label(bn, intent);
    if (bn) {
      final under = price == null ? '' : ' ৳$price-এর মধ্যে';
      return 'ওয়ারাকাহর ক্যাটালগ থেকে $what$under। প্রতিটিতে ওয়ারাকাহর দাম আর স্টক আছে।';
    }
    final under = price == null ? '' : ' under ৳$price';
    return "Here are $what$under from Waraqah's catalog, each with our price and stock.";
  }

  static String none(bool bn) => bn
      ? 'ওয়ারাকাহর ক্যাটালগে এমন কিছু পাইনি। অন্য নাম, লেখক বা বাজেট দিয়ে দেখুন, অথবা বইটির অনুরোধ করুন।'
      : "I couldn't find that in Waraqah's catalog. Try another title, author or budget, or request the book.";

  static String hello(bool bn) => bn
      ? 'ওয়া আলাইকুমুস সালাম! কী পড়তে চান? বিষয়, লেখক বা বাজেট বলুন।'
      : 'Wa alaikum assalam! What would you like to read? Tell me a topic, an author or a budget.';

  static String study(bool bn) => bn
      ? 'পরীক্ষার প্রস্তুতির জন্য ক্যাটালগের "Admission & Job Prep" আর "School & College" বিভাগ দেখুন, অথবা বিষয় আর ক্লাস বলুন।'
      : 'For exam prep, try the Admission & Job Prep and School & College sections, or tell me the subject and class.';

  static String sell(bool bn) => bn
      ? 'পুরোনো বই বিক্রি করতে P2P ট্যাবে লিস্ট করুন, অথবা প্রোফাইল থেকে সেল ব্যাকে ওয়ারাকাহর কাছে বিক্রি করুন।'
      : 'To sell a used book, list it in the P2P tab, or sell it back to Waraqah from your Profile for an instant price.';

  static String thanks(bool bn) => bn
      ? 'স্বাগতম! আরও বই খুঁজতে যেকোনো সময় জিজ্ঞেস করুন।'
      : "You're welcome! Ask any time you want another book.";

  static String fallback(bool bn) => bn
      ? 'আমি ওয়ারাকাহর বই, দাম আর স্টক নিয়ে সাহায্য করতে পারি। একটি বিষয়, লেখক বা বাজেট বলুন।'
      : "I can help with Waraqah's books, prices and stock. Tell me a topic, an author or a budget.";

  static String _label(bool bn, AssistantIntent intent) =>
      switch (intent.kind) {
        AssistantIntentKind.seerah => bn ? 'সীরাহর বই' : 'books on the Seerah',
        AssistantIntentKind.hadith => bn ? 'হাদিসের বই' : 'Hadith books',
        AssistantIntentKind.quran => bn ? 'কুরআনের বই' : 'Quran books',
        AssistantIntentKind.islamicHistory =>
          bn ? 'ইসলামের ইতিহাসের বই' : 'Islamic history books',
        AssistantIntentKind.authorSearch =>
          bn ? '${intent.query}-এর বই' : 'books by ${intent.query}',
        _ when intent.isIslamic => bn ? 'ইসলামিক বই' : 'Islamic books',
        _ => bn ? 'আপনার জন্য কিছু বই' : 'some books for you',
      };
}
