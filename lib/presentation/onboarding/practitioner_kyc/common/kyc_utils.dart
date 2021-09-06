import 'dart:convert';

import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:healthcloud/application/core/graphql/queries.dart';
import 'package:healthcloud/application/redux/actions/kyc_state_actions/update_kyc_submission_status.dart';
import 'package:healthcloud/domain/core/entities/identification.dart';
import 'package:healthcloud/domain/core/entities/supporting_documents.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/application/core/services/onboarding.dart';
import 'package:bewell_pro_core/domain/clinical/value_objects/system_enums.dart';
import 'package:bewell_pro_core/domain/core/entities/processed_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:async_redux/async_redux.dart';

///[Get Upload ID]
///get ID of uploaded file
Future<String> uploadFileAndGetId({
  required Map<String, dynamic> fileData,
  required BuildContext context,
}) async {
  try {
    /// initialize the http client from [AppWrapperBase]
    final IGraphQlClient _httpClient =
        AppWrapperBase.of(context)!.graphQLClient;

    /// initialize the [uploadFileEndpoint]
    final String endPoint = EndpointContext.uploadFileEndpoint(
        AppWrapperBase.of(context)!.appContexts);

    final ProcessedResponse processedResponse = processResponse(
        await _httpClient.callRESTAPI(
          endpoint: endPoint,
          variables: fileData,
          method: AppRequestTypes.POST.name,
        ),
        context);
    if (processedResponse.ok == true) {
      final Map<String, dynamic> body =
          json.decode(processedResponse.response.body) as Map<String, dynamic>;
      return body['id']!.toString();
    } else {
      throw 'err';
    }
  } catch (e) {
    return 'err';
  }
}

List<String> addOrRemoveService({
  required List<String> services,
  required String value,
  required bool shouldAdd,
}) {
  if (shouldAdd) {
    services.add(value);
  } else {
    services.remove(value);
  }
  return services;
}

bool validateKYCFields({
  required BuildContext context,
  String? idType,
  String? idUploadId,
  String? kraUploadId,
}) {
  if (idUploadId == null || idUploadId.isEmpty) {
    //notify the user
    showAlertSnackBar(
      context: context,
      message: uploadYourIdentificationDocument(idType!),
      title: '',
    );
    return false;
  }
  if (kraUploadId == null || kraUploadId.isEmpty) {
    showAlertSnackBar(
      context: context,
      message: uploadYourKraString,
      title: '',
    );
    return false;
  }
  return true;
}

List<SupportingDocument> removeSupportingDoc(
        List<SupportingDocument> docs, String title, String description) =>
    docs
        .where((SupportingDocument doc) =>
            doc.title != title && doc.description != description)
        .toList();

SupportingDocument? getSupportingDoc(String? supportingDocumentTitle,
    String? supportingDocumentDescription, String? supportingDocumentUpload) {
  if (supportingDocumentTitle != null &&
      supportingDocumentDescription != null &&
      supportingDocumentUpload != null) {
    return SupportingDocument(
      title: supportingDocumentTitle,
      description: supportingDocumentDescription,
      upload: supportingDocumentUpload,
    );
  }
}

List<SupportingDocument> deconstructSupportingDocuments(
    {required List<SupportingDocument> supportingDocumentsFromState,
    SupportingDocument? newSupportingDocument}) {
  if (newSupportingDocument == null) return supportingDocumentsFromState;
  if (supportingDocumentsFromState.isNotEmpty) {
    return <SupportingDocument>[
      ...supportingDocumentsFromState,
      newSupportingDocument,
    ];
  } else {
    return <SupportingDocument>[newSupportingDocument];
  }
}

List<Identification> removeIdentificationDoc(
        List<Identification> docs, String idNumber) =>
    docs.where((Identification doc) => doc.docNumber != idNumber).toList();

Future<void> hasSupplierSubmittedKYC(BuildContext context) async {
  final Map<String, dynamic> fetchSupplierKYCSubmitted =
      await SimpleCall.callAPI(
    queryString: checkSupplierKYCSubmittedQuery,
    variables: <String, dynamic>{},
    graphClient: AppWrapperBase.of(context)!.graphQLClient,
  ) as Map<String, dynamic>;

  bool supplierKYCSubmitted = false;

  if (!fetchSupplierKYCSubmitted.containsKey('error')) {
    supplierKYCSubmitted =
        fetchSupplierKYCSubmitted['data']['checkSupplierKYCSubmitted'] as bool;
  }

  StoreProvider.dispatch<CoreState>(
    context,
    UpdateKYCSubmissionStatusAction(kycSubmitted: supplierKYCSubmitted),
  );
}

bool userEmailFilled(BuildContext context) {
  final CoreState state = StoreProvider.state<CoreState>(context)!;
  if (state.userState!.userProfile!.primaryEmailAddress != null) {
    if (state.userState!.userProfile!.primaryEmailAddress!.getValue() !=
        UNKNOWNEMAIL) {
      return true;
    }
    return false;
  }
  return false;
}
