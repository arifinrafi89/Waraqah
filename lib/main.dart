import 'package:flutter/material.dart';

import 'app/app_bootstrap.dart';

/// Entry point only — no widgets are declared here on purpose.
/// Start-up wiring lives in `app/app_bootstrap.dart`, the widget tree in
/// `app/app.dart`.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await AppBootstrap.start());
}
