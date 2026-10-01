import '../models/catalog_record_models.dart';

/// Offline Publishers. Ids are what `Book.publisherId` points at.
// ponytail: in-place fixture lists; the Go backend owns the catalog.
abstract final class PublisherFixtures {
  /// Staff's admin edits change this list in place.
  static final List<PublisherModel> all = [..._seed];

  /// Back to the seed. Each new fake backend starts here.
  static void reset() => all
    ..clear()
    ..addAll(_seed);

  static const List<PublisherModel> _seed = [
    PublisherModel(id: 'pub-harper', name: 'Harper'),
    PublisherModel(id: 'pub-harpercollins', name: 'HarperCollins'),
    PublisherModel(id: 'pub-avery', name: 'Avery'),
    PublisherModel(id: 'pub-prentice-hall', name: 'Prentice Hall'),
    PublisherModel(id: 'pub-cengage', name: 'Cengage'),
    PublisherModel(id: 'pub-crown', name: 'Crown Business'),
    PublisherModel(
      id: 'pub-american-trust',
      name: 'American Trust Publications',
    ),
    PublisherModel(id: 'pub-darussalam', name: 'Darussalam'),
    PublisherModel(id: 'pub-bloomsbury', name: 'Bloomsbury'),
    PublisherModel(id: 'pub-doubleday', name: 'Doubleday'),
    PublisherModel(id: 'pub-penguin', name: 'Penguin Classics'),
    PublisherModel(id: 'pub-princeton', name: 'Princeton University Press'),
    PublisherModel(id: 'pub-ibt', name: 'Islamic Book Trust'),
    PublisherModel(id: 'pub-inner-traditions', name: 'Inner Traditions'),
    PublisherModel(id: 'pub-dar-al-taqwa', name: 'Dar al-Taqwa'),
    PublisherModel(id: 'pub-waraqah-press', name: 'Waraqah Press'),
    PublisherModel(id: 'pub-nctb', name: 'NCTB'),
    PublisherModel(id: 'pub-s-chand', name: 'S. Chand'),
    PublisherModel(id: 'pub-addison-wesley', name: 'Addison-Wesley'),
    PublisherModel(id: 'pub-oreilly', name: "O'Reilly Media"),
    PublisherModel(id: 'pub-philomel', name: 'Philomel Books'),
    PublisherModel(id: 'pub-puffin', name: 'Puffin Books'),
  ];
}
