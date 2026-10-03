import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shelf_entry.dart';

/// Reader-facing words for the shelves.
extension ShelfLabels on AppL10n {
  String shelfName(Shelf shelf) => switch (shelf) {
    Shelf.wantToRead => shelfWantToRead,
    Shelf.reading => shelfReading,
    Shelf.finished => shelfFinished,
  };

  String shelfEmpty(Shelf shelf) => switch (shelf) {
    Shelf.wantToRead => shelfEmptyWantToRead,
    Shelf.reading => shelfEmptyReading,
    Shelf.finished => shelfEmptyFinished,
  };
}

/// Each shelf's icon.
IconData shelfIcon(Shelf shelf) => switch (shelf) {
  Shelf.wantToRead => Icons.bookmark_border_rounded,
  Shelf.reading => Icons.auto_stories_outlined,
  Shelf.finished => Icons.task_alt_rounded,
};
