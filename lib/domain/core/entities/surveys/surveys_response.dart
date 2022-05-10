import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycarehubpro/domain/core/entities/surveys/survey.dart';

part 'surveys_response.freezed.dart';
part 'surveys_response.g.dart';

@freezed
class SurveysResponse with _$SurveysResponse {
  factory SurveysResponse({
    @JsonKey(name: 'listSurveys') List<Survey?>? surveys,
  }) = _SurveysResponse;

  factory SurveysResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveysResponseFromJson(json);
}
