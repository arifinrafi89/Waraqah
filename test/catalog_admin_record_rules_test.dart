import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_admin_rules.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_record.dart';
import 'package:waraqah/features/home/domain/entities/banner.dart';

void main() {
  test('a Category needs both names; an Author only English', () {
    const bnOnly = CatalogRecord(nameBn: 'লেখক');
    expect(CatalogAdminRules.record(RecordKind.author, bnOnly), {
      RuleError.nameBlank,
    });
    const enOnly = CatalogRecord(name: 'Poetry');
    expect(CatalogAdminRules.record(RecordKind.author, enOnly), isEmpty);
    expect(CatalogAdminRules.record(RecordKind.category, enOnly), {
      RuleError.nameBnBlank,
    });
  });

  test('a Banner needs both titles and a target', () {
    Banner banner({String titleBn = 'ঈদ', String value = 'eid'}) => Banner(
      id: '',
      titleEn: 'Eid',
      titleBn: titleBn,
      subtitleEn: '',
      subtitleBn: '',
      seed: 0,
      target: BannerTarget(BannerTargetKind.search, value),
    );
    expect(CatalogAdminRules.banner(banner()), isEmpty);
    expect(CatalogAdminRules.banner(banner(titleBn: ' ', value: '')), {
      RuleError.bannerTitleBlank,
      RuleError.bannerTargetBlank,
    });
  });
}
