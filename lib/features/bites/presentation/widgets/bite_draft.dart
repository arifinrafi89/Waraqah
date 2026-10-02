class BiteBookOption {
  const BiteBookOption({required this.id, required this.title});

  final String id;
  final String title;
}

class BiteDraft {
  const BiteDraft({required this.text, this.book, this.isSpoiler = false});

  final String text;
  final BiteBookOption? book;
  final bool isSpoiler;
}

const biteBookOptions = [
  BiteBookOption(id: 'bk-sapiens', title: 'Sapiens'),
  BiteBookOption(id: 'bk-atomic', title: 'Atomic Habits'),
  BiteBookOption(id: 'bk-fiqh', title: 'Fiqh us-Sunnah'),
  BiteBookOption(id: 'bk-riyad', title: 'Riyad as-Salihin'),
  BiteBookOption(id: 'bk-nectar', title: 'The Sealed Nectar'),
];
