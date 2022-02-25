// Flutter imports:
import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:healthcloud/application/core/graphql/queries.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_request_count_response.dart';
import 'package:healthcloud/domain/core/entities/service_requests/pending_service_requests.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/widgets/platform_loader.dart';
import 'package:healthcloud/presentation/engagement/home/widgets/action_card.dart';
import 'package:healthcloud/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ServiceRequestActionCard extends StatefulWidget {
  const ServiceRequestActionCard({Key? key}) : super(key: key);

  @override
  State<ServiceRequestActionCard> createState() =>
      _ServiceRequestActionCardState();
}

class _ServiceRequestActionCardState extends State<ServiceRequestActionCard> {
  ///
  /// [ServiceRequestActionCardState] provides a clickable card to perform the action displayed.
  ///

  late Stream<Object> _stream;
  late StreamController<Object> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<Object>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      final String facilityID =
          StoreProvider.state<AppState>(context)?.staffState?.defaultFacility ??
              '';
      await genericFetchFunction(
        streamController: _streamController,
        context: context,
        logTitle: 'Fetch Service Requests Count',
        queryString: getPendingServiceRequestsCountQuery,
        variables: <String, dynamic>{'facilityID': facilityID},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //show the loader before the data is displayed
        if (snapshot.data is Map<String, dynamic> &&
            snapshot.data != null &&
            snapshot.data['loading'] != null &&
            snapshot.data['loading'] == true) {
          return const Center(child: PlatformLoader());
        }
        //error checking
        if (snapshot.hasError) {
          final dynamic valueHolder = snapshot.error;
          final Map<String, dynamic>? error = snapshot.error == null
              ? null
              : valueHolder as Map<String, dynamic>;
          if (error?['error'] != null) {
            Sentry.captureException(
              UserException(
                error!['error'] as String,
                cause: snapshot.error,
              ),
            );
          }
        }
        if (snapshot.hasData) {
          final PendingServiceRequestsCountResponse
              serviceRequestCountResponse =
              PendingServiceRequestsCountResponse.fromJson(
            snapshot.data as Map<String, dynamic>,
          );
          final int count =
              serviceRequestCountResponse.pendingServiceRequests?.total ?? 0;
          if (count > 0) {
            return ActionCard(
              counter: count.toString(),
              iconUrl: serviceRequestsIconSvg,
              title: serviceRequestsText,
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutes.serviceRequestsPage,
                arguments: serviceRequestCountResponse.pendingServiceRequests,
              ),
            );
          }
        }
        return ActionCard(
          iconUrl: serviceRequestsIconSvg,
          title: serviceRequestsText,
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.serviceRequestsPage,
            arguments: PendingServiceRequest.initial(),
          ),
        );
      },
    );
  }
}
