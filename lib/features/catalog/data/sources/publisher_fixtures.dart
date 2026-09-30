import '../models/catalog_record_models.dart';

/// Offline Publishers. Ids are what `Book.publisherId` points at.
abstract final class PublisherFixtures {
  static const List<PublisherModel> all = [
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
    PublisherModel(id: 'pub-dar-al-taqwa', name: 'Dar al-Taqwa'),
  ];
}
