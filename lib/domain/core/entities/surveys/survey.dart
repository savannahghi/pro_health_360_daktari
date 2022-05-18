import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

@freezed
class Survey with _$Survey {
  factory Survey({
    @JsonKey(name: 'projectId') int? projectId,
    @JsonKey(name: 'xmlFormId') String? xmlFormId,
    @JsonKey(name: 'name') String? name,
  }) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

  factory Survey.initial() => Survey(
        projectId: 0,
        name: UNKNOWN,
        xmlFormId: UNKNOWN,
      );
}
