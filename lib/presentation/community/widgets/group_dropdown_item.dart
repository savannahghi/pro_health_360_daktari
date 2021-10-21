import 'package:flutter/material.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/community/entities/dropdown_item.dart';

class GroupDropdownItem extends StatelessWidget {
  const GroupDropdownItem({
    Key? key,
    required this.label,
    this.hint,
    this.value,
    this.items,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final String? hint;
  final String? value;
  final List<DropdownItem>? items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: <Widget>[
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.newGroupLabelColor,
                ),
              ),
              const SizedBox(width: 8.0),
              if (hint != null)
                Text(
                  hint!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.lightGreyColor,
                    fontStyle: FontStyle.italic,
                  ),
                )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.galleryColor,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              value: value,
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: AppColors.listItemBackgroundColor,
              items: items?.map<DropdownMenuItem<String>>((DropdownItem item) {
                return DropdownMenuItem<String>(
                  key: ValueKey<String>(item.value),
                  value: item.value,
                  child: Text(
                    item.description,
                    style: const TextStyle(
                      color: AppColors.listItemBackgroundColor,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        )
      ],
    );
  }
}
