import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A one-value Riverpod notifier for simple UI selections — a chosen category,
/// a search string, a filter mode.
///
/// Riverpod 3 retired `StateProvider`, and a named notifier reads better in a
/// provider list anyway: the call site says what the value means.
class SelectionNotifier<T> extends Notifier<T> {
  SelectionNotifier(this.initial);

  final T initial;

  @override
  T build() => initial;

  void select(T value) => state = value;
}

/// Builds a provider holding a single [T] that starts at [initial].
NotifierProvider<SelectionNotifier<T>, T> selectionProvider<T>(T initial) =>
    NotifierProvider<SelectionNotifier<T>, T>(
      () => SelectionNotifier<T>(initial),
    );
