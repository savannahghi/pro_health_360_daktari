// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:misc_utilities/misc.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/router/routes.dart';

Map<String, Function> getAfyaMojaFeedActionCallbacks({
  required BuildContext context,
}) {
  return <String, Function>{
    kCompleteProfile: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar(content: 'Coming soon'));
    },
    kCompleteIndividualPractitionerKYC: () {
      Navigator.of(context, rootNavigator: true).pushNamed(
        kycIntroPageRoute,
        arguments: KycIntroArguments(
          title: individualTitle('practice'),
          description: individualDescription('practice'),
          continueRoute: individualPractitionerKYCStepOneRoute,
        ),
      );
    },
    kVerifyEmail: () {
      Navigator.of(context, rootNavigator: true)
          .pushNamed(profileContactDetailsRoute);
    },
  };
}

class KycIntroArguments {
  final String title;
  final String description;
  final String continueRoute;

  KycIntroArguments({
    required this.title,
    required this.description,
    required this.continueRoute,
  });
}
