// Package imports:
import 'package:rxdart/subjects.dart';

class AppBrand {
  factory AppBrand() {
    return _singleton;
  }

  AppBrand._internal();

  BehaviorSubject<String> appLogo = BehaviorSubject<String>.seeded('');
  BehaviorSubject<String> appName = BehaviorSubject<String>.seeded('');

  static final AppBrand _singleton = AppBrand._internal();
}
