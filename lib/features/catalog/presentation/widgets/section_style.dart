import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../l10n/app_localizations.dart';

/// How a [Section] looks in the app: its icon and its translated name.
extension SectionStyle on Section {
  IconData get icon => switch (this) {
    Section.academic => Icons.school_rounded,
    Section.religious => Icons.mosque_rounded,
    Section.literature => Icons.auto_stories_rounded,
    Section.admissionJobPrep => Icons.work_rounded,
    Section.schoolCollege => Icons.backpack_rounded,
    Section.nonFiction => Icons.public_rounded,
    Section.skillsTech => Icons.code_rounded,
    Section.children => Icons.child_care_rounded,
  };

  String label(AppL10n l10n) => switch (this) {
    Section.academic => l10n.sectionAcademic,
    Section.religious => l10n.sectionReligious,
    Section.literature => l10n.sectionLiterature,
    Section.admissionJobPrep => l10n.sectionAdmissionJobPrep,
    Section.schoolCollege => l10n.sectionSchoolCollege,
    Section.nonFiction => l10n.sectionNonFiction,
    Section.skillsTech => l10n.sectionSkillsTech,
    Section.children => l10n.sectionChildren,
  };
}
