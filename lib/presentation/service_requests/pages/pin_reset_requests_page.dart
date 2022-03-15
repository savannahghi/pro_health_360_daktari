import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/service_requests/widgets/pin_reset_request_widget.dart';

class PinResetRequestsPage extends StatelessWidget {
  const PinResetRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: pinResetRequestsTitle),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Center(child: SvgPicture.asset(pinResetImageSvgPath)),
              const SizedBox(height: 20),
              const Text(
                pinResetRequestsLeading,
                style: TextStyle(color: Color(0xFF7A7B8E)),
              ),
              const SizedBox(height: 20),
              const PinResetRequestWidget(
                acceptKey: Key('accept_key'),
                rejectKey: Key('reject_key'),
                phoneNumber: '+254 712 345 678',
                name: 'Jane Doe',
              ),
              const SizedBox(height: 20),
              const PinResetRequestWidget(
                phoneNumber: '+254 712 345 678',
                name: 'Juha Kalulu Mwenyewe',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
