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
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:healthcloud/presentation/service_requests/widgets/red_flag_list_item.dart';
import 'package:misc_utilities/misc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_ui_components/platform_loader.dart';

class RedFlagsPage extends StatefulWidget {
  @override
  State<RedFlagsPage> createState() => _RedFlagsPageState();
}

class _RedFlagsPageState extends State<RedFlagsPage> {
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
          'type': 'RED_FLAG',
          'status': 'PENDING',
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
        title: redFlagString,
        showNotificationIcon: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Center(
                child: SvgPicture.asset(
                  redFlagStressSvgPath,
                  width: 200,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: StreamBuilder<Object>(
                stream: _stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  //show the loader before the data is displayed
                  if (snapshot.data is Map<String, dynamic> &&
                      snapshot.data != null &&
                      snapshot.data['loading'] != null &&
                      snapshot.data['loading'] == true) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const SILPlatformLoader(),
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

                    return GenericNoData(
                      key: helpNoDataWidgetKey,
                      type: GenericNoDataTypes.errorInData,
                      actionText: actionTextGenericNoData,
                      recoverCallback: () async {
                        await genericFetchFunction(
                          streamController: _streamController,
                          context: context,
                          logTitle: 'Fetch red flags',
                          queryString: getServiceRequestsQuery,
                          variables: <String, dynamic>{
                            'type': 'RED_FLAG',
                            'status': 'PENDING'
                          },
                        );
                      },
                      messageBody: getErrorMessage(fetchingRedFlagsString),
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
                      return Column(
                        children: <Widget>[
                          ///TODO(eugene): Restore when ready
                          // Container(
                          //   padding: const EdgeInsets.all(10),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(10),
                          //     boxShadow: <BoxShadow>[
                          //       BoxShadow(
                          //         color: Colors.black.withOpacity(0.10),
                          //         spreadRadius: 1,
                          //         blurRadius: 9,
                          //         offset: const Offset(0, 9),
                          //       ),
                          //     ],
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.only(left: 8.0),
                          //         child: Text(
                          //           searchString,
                          //           style: normalSize12Text(
                          //             AppColors.greyTextColor,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(right: 8.0),
                          //         child: SvgPicture.asset(searchIconSvg),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // veryLargeVerticalSizedBox,
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

                            return RedFlagListItem(
                              clientName: clientName,
                              feelingDescription: feeling,
                              phoneNumber: clientPhoneNumber,
                            );
                          })
                        ],
                      );
                    }
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
