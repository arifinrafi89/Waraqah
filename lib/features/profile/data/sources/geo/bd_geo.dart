import 'barishal.dart';
import 'chattogram.dart';
import 'dhaka.dart';
import 'khulna.dart';
import 'mymensingh.dart';
import 'rajshahi.dart';
import 'rangpur.dart';
import 'sylhet.dart';
import 'geo_record.dart';

/// Bangladesh's 8 divisions, 64 districts and their upazilas, as `/geo`
/// answers them. Dhaka district also lists Dhaka's two city corporations,
/// where most of its readers live.
// ponytail: upazila names are English only; add Bangla when a reader asks.
abstract final class BdGeo {
  static const List<GeoDivisionRecord> divisions = [
    barishal,
    chattogram,
    dhaka,
    khulna,
    mymensingh,
    rajshahi,
    rangpur,
    sylhet,
  ];

  static List<Map<String, dynamic>> toJson() => [
    for (final (name, nameBn, districts) in divisions)
      {
        'name': name,
        'nameBn': nameBn,
        'districts': [
          for (final (name, nameBn, upazilas) in districts)
            {'name': name, 'nameBn': nameBn, 'upazilas': upazilas},
        ],
      },
  ];
}
