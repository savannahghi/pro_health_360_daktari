import 'package:freezed_annotation/freezed_annotation.dart';

part 'dropdown_item.freezed.dart';

@freezed
class DropdownItem with _$DropdownItem {
  factory DropdownItem({
    required String description,
    required String value,
  }) = _DropdownItem;
}
