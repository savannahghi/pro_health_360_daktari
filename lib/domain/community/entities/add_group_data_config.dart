// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myharehubpro/domain/community/entities/dropdown_item.dart';

part 'add_group_data_config.freezed.dart';

@freezed
class AddGroupDataConfig with _$AddGroupDataConfig {
  factory AddGroupDataConfig({
    required List<DropdownItem> band,
    required List<DropdownItem> age,
    required List<DropdownItem> location,
    required List<DropdownItem> clinic,
  }) = _AddGroupDataConfig;
}
