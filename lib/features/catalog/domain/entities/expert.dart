import 'collection.dart';

enum ExpertKind { teacher, scholar, writer }

/// A verified teacher, scholar or writer whose picks Waraqah shows. Their
/// picks are Collections with their `expertId`.
class Expert {
  const Expert({
    required this.id,
    required this.name,
    required this.nameBn,
    required this.credentialEn,
    required this.credentialBn,
    required this.kind,
    this.verified = false,
  });

  final String id;
  final String name;
  final String nameBn;
  final String credentialEn;
  final String credentialBn;
  final ExpertKind kind;
  final bool verified;

  String label(bool isBangla) => isBangla ? nameBn : name;

  String credential(bool isBangla) => isBangla ? credentialBn : credentialEn;
}

/// An Expert's page: who they are and their Expert Picks.
typedef ExpertDetail = ({Expert expert, List<Collection> picks});
