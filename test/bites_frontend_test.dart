import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/bites/presentation/widgets/bite_composer_sheet.dart';
import 'package:waraqah/features/bites/presentation/widgets/bite_draft.dart';
import 'package:waraqah/l10n/app_localizations.dart';

class _ComposerProbe extends StatefulWidget {
  const _ComposerProbe();

  @override
  State<_ComposerProbe> createState() => _ComposerProbeState();
}

class _ComposerProbeState extends State<_ComposerProbe> {
  BiteDraft? _draft;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ElevatedButton(
        onPressed: () async {
          final draft = await showBiteComposer(context);
          if (mounted && draft != null) setState(() => _draft = draft);
        },
        child: const Text('Compose'),
      ),
      if (_draft != null)
        Text(_draft!.isSpoiler ? 'Spoiler posted' : _draft!.text),
    ],
  );
}

void main() {
  testWidgets('Bites composer tags a book and enables spoiler mode', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppL10n.localizationsDelegates,
        supportedLocales: AppL10n.supportedLocales,
        home: const Scaffold(body: _ComposerProbe()),
      ),
    );

    await tester.tap(find.text('Compose'));
    await tester.pumpAndSettle();
    expect(find.text('500 characters maximum'), findsOneWidget);

    final fields = find.byType(TextField);
    await tester.enterText(fields.first, 'A spoiler about Sapiens');
    await tester.enterText(fields.last, 'Sapiens');
    await tester.pump();
    await tester.tap(find.text('Sapiens').last);
    await tester.pump();
    await tester.tap(find.text('Contains spoilers'));
    tester.testTextInput.hide();
    await tester.pump();
    await tester.ensureVisible(find.text('Post bite'));
    await tester.tap(find.text('Post bite'));
    await tester.pumpAndSettle();

    expect(find.text('Spoiler posted'), findsOneWidget);
  });
}
