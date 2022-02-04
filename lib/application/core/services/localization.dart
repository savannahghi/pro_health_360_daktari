// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

final List<LocalizationsDelegate<dynamic>> localizationDelegates =
    <LocalizationsDelegate<dynamic>>[
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate
];

final List<Locale> locales = <Locale>[const Locale('en', '')];
