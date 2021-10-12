// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'mocks.dart';

Map<String, dynamic>? setupFirebaseAuthMocks(
    [void Function(MethodCall call)? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel
      .setMockMethodCallHandler((MethodCall call) async {
    if (call.method == 'Firebase#initializeCore') {
      return <Map<String, dynamic>>[
        <String, dynamic>{
          'name': defaultFirebaseAppName,
          'options': <String, String>{
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': <String, String>{},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return <String, dynamic>{
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': <String, dynamic>{},
      };
    }
    if (customHandlers != null) customHandlers(call);

    return null;
  });

  const MethodChannel('plugins.flutter.io/firebase_messaging')
      .setMockMethodCallHandler((MethodCall call) async {
    if (call.method == 'Messaging#deleteToken') {
      return null;
    }
    if (call.method == 'Messaging#getToken') {
      return <String, String>{'token': 'test token. tolkien token'};
    }

    return null;
  });
}

/// Kyc file upload mock
MethodChannel setupFileUploadMock(List<MethodCall> methodCalls) {
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/image_picker');

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    methodCalls.add(methodCall);

    final File file = File(testPath('test_resources/test_file.png'));
    return file.path;
  });
  return channel;
}
