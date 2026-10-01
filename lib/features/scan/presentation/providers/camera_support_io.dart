import 'dart:io';

/// Phones and Macs have a camera the scanner supports; Windows and Linux
/// don't, and neither does `flutter test`.
bool get hasScannerCamera =>
    !Platform.environment.containsKey('FLUTTER_TEST') &&
    (Platform.isAndroid || Platform.isIOS || Platform.isMacOS);
