import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/graphql/queries.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/service_requests/service_request_content.dart';
import 'package:healthcloud/domain/core/entities/service_requests/service_requests_response.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_enums.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:healthcloud/presentation/service_requests/widgets/red_flag_list_item.dart';
import 'package:misc_utilities/misc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_ui_components/platform_loader.dart';

class ResolvedServiceRequestsPage extends StatefulWidget {
  @override
  State<ResolvedServiceRequestsPage> createState() =>
      _ResolvedServiceRequestsPageState();
}

class _ResolvedServiceRequestsPageState
    extends State<ResolvedServiceRequestsPage> {
  // [RedFlagsPage] is used to display a list of red
  /// flags that demand immediate attention

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
        logTitle: 'Fetch red flags',
        queryString: getServiceRequestsQuery,
        variables: <String, dynamic>{
          'status': RequestStatus.RESOLVED.name,
          'facilityID': facilityID,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: resolvedRequestsString,
        showNotificationIcon: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Center(
                child: SvgPicture.asset(
                  resolvedServiceRequestsImageSvgPath,
                  width: 200,
                ),
              ),
            ),
            StreamBuilder<Object>(
              stream: _stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //show the loader before the data is displayed
                if (snapshot.data is Map<String, dynamic> &&
                    snapshot.data != null &&
                    snapshot.data['loading'] != null &&
                    snapshot.data['loading'] == true) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 150.0),
                    child: SILPlatformLoader(),
                  );
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

                  return GenericNoDataWidget(
                    key: helpNoDataWidgetKey,
                    recoverCallback: () async {
                      await genericFetchFunction(
                        streamController: _streamController,
                        context: context,
                        logTitle: 'Fetch red flags',
                        queryString: getServiceRequestsQuery,
                        variables: <String, dynamic>{
                          'type': 'RED_FLAG',
                          'status': RequestStatus.RESOLVED.name
                        },
                      );
                    },
                    messageBody:
                        getErrorMessage(fetchingResolvedRequestsString),
                  );
                }
                if (snapshot.hasData) {
                  final ServiceRequestsResponse serviceRequest =
                      ServiceRequestsResponse.fromJson(
                    snapshot.data as Map<String, dynamic>,
                  );

                  final List<ServiceRequestContent>? serviceRequestContents =
                      serviceRequest.serviceRequestContent;
                  if (serviceRequestContents != null &&
                      serviceRequestContents.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          ...List<Widget>.generate(
                              serviceRequestContents.length, (int index) {
                            final String clientName = serviceRequestContents
                                    .elementAt(index)
                                    .clientName ??
                                '';
                            final String clientPhoneNumber =
                                serviceRequestContents
                                        .elementAt(index)
                                        .clientPhoneNumber ??
                                    '';
                            final String feeling = serviceRequestContents
                                    .elementAt(index)
                                    .description ??
                                '';
                            final String resolvedTime = serviceRequestContents
                                    .elementAt(index)
                                    .resolvedTime ??
                                '';
                            final String resolvedBy = serviceRequestContents
                                    .elementAt(index)
                                    .resolvedBy ??
                                '';
                            return RedFlagListItem(
                              isResolved: true,
                              clientName: clientName,
                              feelingDescription: feeling,
                              phoneNumber: clientPhoneNumber,
                              resolvedAt: resolvedTime,
                              resolvedBy: resolvedBy,
                            );
                          })
                        ],
                      ),
                    );
                  }
                }
                return GenericNoDataWidget(
                  key: helpNoDataWidgetKey,
                  actionText: actionTextGenericNoData,
                  type: GenericNoDataTypes.noData,
                  recoverCallback: () {
                    if (Navigator.canPop(context)) {
                      Navigator.of(context).pop();
                    }
                  },
                  messageTitle:
                      getNoDataTile(serviceRequestsText.toLowerCase()),
                  messageBody: resolvedServiceRequestsNoDataBodyString,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
