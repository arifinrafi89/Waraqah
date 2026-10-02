import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/profile/data/sources/geo/bd_geo.dart';

void main() {
  final districts = [for (final (_, _, list) in BdGeo.divisions) ...list];

  test('8 divisions and 64 districts, all named in Bangla', () {
    expect(BdGeo.divisions, hasLength(8));
    expect(districts, hasLength(64));
    for (final (name, nameBn, _) in [...BdGeo.divisions, ...districts]) {
      expect(nameBn, isNotEmpty, reason: name);
    }
  });

  test('every district has upazilas; no district name twice', () {
    for (final (name, _, upazilas) in districts) {
      expect(upazilas, isNotEmpty, reason: name);
      expect(upazilas.toSet(), hasLength(upazilas.length), reason: name);
    }
    final names = [for (final (name, _, _) in districts) name];
    expect(names.toSet(), hasLength(64));
  });

  test('the JSON tree has every upazila', () {
    final json = BdGeo.toJson();
    final count = json.fold<int>(
      0,
      (n, d) =>
          n +
          (d['districts'] as List).fold<int>(
            0,
            (m, s) => m + ((s as Map)['upazilas'] as List).length,
          ),
    );
    expect(count, greaterThan(490));
  });
}
