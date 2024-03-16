import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'application/application.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setup();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ru'), Locale('uz')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: const Application(),
    ),
  );
}
