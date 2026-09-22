import '../../domain/entities/bite.dart';

/// Seed feed used until the Go backend's `/bites` endpoint is live.
abstract final class BiteFixtures {
  static const List<Bite> feed = [
    Bite(
      id: 'bt-1',
      authorName: 'Rahinur',
      authorHandle: 'CSE · IUT',
      text:
          'Just finished it — the wheat chapter genuinely changed how I see '
          'history.',
      taggedBookTitle: 'Sapiens',
      taggedBookId: 'bk-sapiens',
      avatarSeed: 0,
    ),
    Bite(
      id: 'bt-2',
      authorName: 'Nabila',
      authorHandle: 'BME · IUT',
      text: 'Starting a weekend reading circle for this one, DM if interested!',
      taggedBookTitle: 'Fiqh us-Sunnah',
      taggedBookId: 'bk-fiqh',
      avatarSeed: 1,
    ),
    Bite(
      id: 'bt-3',
      authorName: 'Tanvir',
      authorHandle: 'CSE · IUT',
      text: 'The two-minute rule from this book fixed my entire semester plan.',
      taggedBookTitle: 'Atomic Habits',
      taggedBookId: 'bk-atomic',
      avatarSeed: 2,
    ),
    Bite(
      id: 'bt-4',
      authorName: 'Arifin',
      authorHandle: 'EEE · IUT',
      text: 'Halfway through and already recommending it to everyone I know.',
      taggedBookTitle: 'Riyad as-Salihin',
      taggedBookId: 'bk-riyad',
      avatarSeed: 3,
    ),
  ];
}
