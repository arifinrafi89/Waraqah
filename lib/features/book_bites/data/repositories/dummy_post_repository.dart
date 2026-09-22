import '../../domain/models/post.dart';
import '../../domain/repositories/post_repository.dart';

class DummyPostRepository implements PostRepository {
  static final DateTime _now = DateTime(2026, 9, 21);

  static final List<Post> _posts = [
    Post(
      id: 'post-1',
      authorId: 'profile-1',
      content: 'Just finished Sapiens, still thinking about the agricultural revolution chapter.',
      createdAt: _now.subtract(const Duration(minutes: 20)),
      taggedBookIds: ['book-1'],
    ),
    Post(
      id: 'post-2',
      authorId: 'profile-2',
      content: 'Atomic Habits actually changed how I study. Small wins compound fast.',
      createdAt: _now.subtract(const Duration(hours: 1)),
      taggedBookIds: ['book-2'],
    ),
    Post(
      id: 'post-3',
      authorId: 'profile-3',
      content: 'The Sealed Nectar is the most detailed seerah book I have read so far.',
      createdAt: _now.subtract(const Duration(hours: 2)),
      taggedBookIds: ['book-3'],
    ),
    Post(
      id: 'post-4',
      authorId: 'profile-1',
      content: 'Halfway through Clean Code, my group project code already looks better.',
      createdAt: _now.subtract(const Duration(hours: 4)),
      taggedBookIds: ['book-4'],
    ),
    Post(
      id: 'post-5',
      authorId: 'profile-4',
      content: 'Reread The Alchemist during exam break, still hits the same.',
      createdAt: _now.subtract(const Duration(hours: 6)),
      taggedBookIds: ['book-5'],
    ),
    Post(
      id: 'post-6',
      authorId: 'profile-5',
      content: 'Carrying Fortress of the Muslim everywhere this semester.',
      createdAt: _now.subtract(const Duration(hours: 9)),
      taggedBookIds: ['book-6'],
    ),
    Post(
      id: 'post-7',
      authorId: 'profile-2',
      content: 'Thinking, Fast and Slow explains half the bad decisions I make daily.',
      createdAt: _now.subtract(const Duration(hours: 14)),
      taggedBookIds: ['book-7'],
    ),
    Post(
      id: 'post-8',
      authorId: 'profile-3',
      content: 'Rereading Harry Potter for comfort during finals week.',
      createdAt: _now.subtract(const Duration(days: 1)),
      taggedBookIds: ['book-8'],
    ),
    Post(
      id: 'post-9',
      authorId: 'profile-4',
      content: 'The 7 Habits book is dense but worth the slow read.',
      createdAt: _now.subtract(const Duration(days: 1, hours: 5)),
      taggedBookIds: ['book-9'],
    ),
    Post(
      id: 'post-10',
      authorId: 'profile-5',
      content: 'Started Stories of the Prophets, perfect before Fajr.',
      createdAt: _now.subtract(const Duration(days: 2)),
      taggedBookIds: ['book-10'],
    ),
  ];

  @override
  List<Post> getPosts() => List.unmodifiable(_posts);
}
