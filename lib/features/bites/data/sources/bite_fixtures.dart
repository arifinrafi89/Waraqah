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
      avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=96&h=96&fit=crop',
      imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=900&h=480&fit=crop',
      replies: 18,
      reposts: 34,
      likes: 142,
      avatarSeed: 0,
    ),
    Bite(
      id: 'bt-2',
      authorName: 'Nabila',
      authorHandle: 'BME · IUT',
      text: 'Starting a weekend reading circle for this one, DM if interested!',
      taggedBookTitle: 'Fiqh us-Sunnah',
      taggedBookId: 'bk-fiqh',
      avatarUrl: 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=96&h=96&fit=crop',
      replies: 27,
      reposts: 61,
      likes: 89,
      liked: true,
      avatarSeed: 1,
    ),
    Bite(
      id: 'bt-3',
      authorName: 'Tanvir',
      authorHandle: 'CSE · IUT',
      text: 'The two-minute rule from this book fixed my entire semester plan.',
      taggedBookTitle: 'Atomic Habits',
      taggedBookId: 'bk-atomic',
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=96&h=96&fit=crop',
      imageUrl: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=900&h=520&fit=crop',
      replies: 42,
      reposts: 88,
      likes: 314,
      avatarSeed: 2,
    ),
    Bite(
      id: 'bt-4',
      authorName: 'Arifin',
      authorHandle: 'EEE · IUT',
      text: 'Halfway through and already recommending it to everyone I know.',
      taggedBookTitle: 'Riyad as-Salihin',
      taggedBookId: 'bk-riyad',
      avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=96&h=96&fit=crop',
      replies: 9,
      reposts: 22,
      likes: 57,
      avatarSeed: 3,
    ),
  ];
}
