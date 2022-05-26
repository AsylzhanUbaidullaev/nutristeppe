import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/main/app.dart';
import 'app/main/app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set device orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final model = MyAppModel();
  await model.init();

  runApp(
    MyApp(model: model),
  );
}
