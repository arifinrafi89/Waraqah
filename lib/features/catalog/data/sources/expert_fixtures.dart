import '../../domain/entities/expert.dart';
import '../models/expert_model.dart';

/// Offline Experts. Seeded only: there's no way to apply or manage them yet.
/// Every one is a made-up person.
abstract final class ExpertFixtures {
  static const List<ExpertModel> all = [
    ExpertModel(
      id: 'exp-tanvir-physics',
      name: 'Tanvir Hasan',
      nameBn: 'তানভীর হাসান',
      credentialEn: 'HSC physics teacher, 12 years',
      credentialBn: 'এইচএসসি পদার্থবিজ্ঞান শিক্ষক, ১২ বছর',
      kind: ExpertKind.teacher,
      verified: true,
    ),
    ExpertModel(
      id: 'exp-mahmudul-scholar',
      name: 'Dr. Mahmudul Karim',
      nameBn: 'ড. মাহমুদুল করিম',
      credentialEn: 'Islamic studies scholar',
      credentialBn: 'ইসলামিক স্টাডিজ গবেষক',
      kind: ExpertKind.scholar,
      verified: true,
    ),
    ExpertModel(
      id: 'exp-shirin-novelist',
      name: 'Shirin Akhter',
      nameBn: 'শিরিন আক্তার',
      credentialEn: 'Bangla novelist, six novels',
      credentialBn: 'বাংলা ঔপন্যাসিক, ছয়টি উপন্যাস',
      kind: ExpertKind.writer,
      verified: true,
    ),
    ExpertModel(
      id: 'exp-arif-bcs',
      name: 'Arif Mahmud',
      nameBn: 'আরিফ মাহমুদ',
      credentialEn: 'BCS mentor, 35th BCS cadre',
      credentialBn: 'বিসিএস মেন্টর, ৩৫তম বিসিএস ক্যাডার',
      kind: ExpertKind.teacher,
      verified: true,
    ),
  ];
}
