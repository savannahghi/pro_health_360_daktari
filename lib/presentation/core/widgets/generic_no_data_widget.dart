// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_asset_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';

enum GenericNoDataTypes { noData, error }

/// [GenericNoDataWidget] is a generic used to purposefully communicate that
/// the value of the data received from the API was [null] or it missed
/// key properties that are of a valid response.
/// Because of it;s generic natures, this widget handles the following types
/// of error defined under [GenericNoDataTypes] enum
///
/// - AbsentData -> no data completely
/// - ErrorInData -> there was an error in the received data or the API returned with an error attribute
///
/// When the errorType is of type [ErrorInData] a specific illustration will be shown in place of the default
/// one.
///
/// Always, a [recoverCallback] can be defined to offset the user a way out
class GenericNoDataWidget extends StatelessWidget {
  const GenericNoDataWidget({
    Key? key,
    required this.recoverCallback,
    this.messageTitle,
    this.messageBody,
    this.height,
    this.actionText = retryString,
    this.align,
    this.type = GenericNoDataTypes.error,
    this.headerIconSvgUrl,
  }) : super(key: key);

  /// [actionText]
  final String actionText;

  /// [align] where the error widget should align
  final MainAxisAlignment? align;

  /// [height] of the container
  final double? height;

  /// [messageTitle] to show in the body, in place of the default one
  final String? messageBody;

  /// [messageTitle] to show on the title, in place of the default one
  final String? messageTitle;

  /// [recoverCallback] the function to be called to recover from the error. Default to [null]
  final Function recoverCallback;

  /// [type] the type of error. Defaults to [noData]
  final GenericNoDataTypes type;

  final String? headerIconSvgUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: align ?? MainAxisAlignment.center,
              children: <Widget>[
                largeVerticalSizedBox,
                if (type == GenericNoDataTypes.error ||
                    headerIconSvgUrl != null)
                  SvgPicture.asset(
                    headerIconSvgUrl ?? errorPageImageSvgPath,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: messageTitle ?? genericErrorOccurred,
                              style: veryBoldSize20Text(),
                            ),
                            const TextSpan(text: '\n\n'),
                            TextSpan(
                              text: messageBody ?? defaultUserFriendlyMessage,
                              style: normalSize16Text(
                                AppColors.greyTextColor,
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      mediumVerticalSizedBox,
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: SILPrimaryButton(
                          customRadius: 8.0,
                          buttonKey: genericNoDataButtonKey,
                          buttonColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: this.recoverCallback as void Function()?,
                          text: actionText,
                        ),
                      ),
                      largeVerticalSizedBox,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}