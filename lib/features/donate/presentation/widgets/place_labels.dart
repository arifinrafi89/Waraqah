import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/donate_place_draft.dart';

/// Staff-facing words for the place form.
extension PlaceLabels on AppL10n {
  String placeProblem(PlaceProblem problem) => switch (problem) {
    PlaceProblem.name => adminDonateProblemName,
    PlaceProblem.district => adminDonateProblemDistrict,
    PlaceProblem.area => adminDonateProblemArea,
    PlaceProblem.story => adminDonateProblemStory,
    PlaceProblem.noNeeds => adminDonateProblemNeeds,
    PlaceProblem.badCount => adminDonateProblemCount,
  };
}
