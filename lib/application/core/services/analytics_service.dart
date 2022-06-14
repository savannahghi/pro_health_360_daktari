// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_name_constants.dart';

// Project imports:

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  /// Initializes the general app metrics for this user for this device
  ///
  /// This involves setting things like the program, enabling analytics and
  /// setting the app flavour
  Future<void> init({required String environment}) async {
    await _analytics.setAnalyticsCollectionEnabled(true);

    /// Sets the program that the app is running on
    await _analytics.setUserProperty(name: 'program', value: appProgramName);

    /// Sets the flavour that the app is running on
    await _analytics.setUserProperty(
      name: 'flavour',
      value: Flavour.pro.name,
    );

    /// Sets environment that the app is running on
    await _analytics.setUserProperty(name: 'environment', value: environment);
  }

  /// Resets the current user ID when a user logs out of the platform
  Future<void> reset() async {
    await _analytics.setUserId();
  }

  /// Adds a set of common properties that are common for all events for this
  /// user. This means that all events in the future will contain this metadata
  Future<void> setUserId(String? id) async {
    if (id != null && id.isNotEmpty && id != UNKNOWN) {
      await _analytics.setUserId(id: id);
    }
  }

  /// Safely sets the facility ID of the currently logged in user
  Future<void> setUserFacility(String? facilityID) async {
    if (facilityID != null && facilityID.isNotEmpty && facilityID != UNKNOWN) {
      await _analytics.setUserProperty(name: 'facilityID', value: facilityID);
    }
  }

  /// Logs a user event by enriching the parameters with general metadata
  Future<void> logEvent({
    /// The name of the event
    required String name,

    /// Parameters of the event
    Map<String, dynamic>? parameters,

    /// The type of the event being collected
    required AnalyticsEventType eventType,
  }) async {
    final Map<String, dynamic> enrichedParams = <String, dynamic>{};

    enrichedParams.addAll(<String, dynamic>{
      'eventType': describeEnum(eventType),
    });

    if (parameters != null) {
      enrichedParams.addAll(parameters);
    }

    await _analytics.logEvent(name: name, parameters: enrichedParams);
  }
}
