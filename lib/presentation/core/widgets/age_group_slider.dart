import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class AgeGroupSlider extends StatelessWidget {
  const AgeGroupSlider({
    Key? key,
    this.data,
    this.onChanged,
    this.divisions = 11,
    this.minimumAge = 14,
    this.maximumAge = 25,
  }) : super(key: key);

  final RangeValues? data;
  final int divisions;

  final double minimumAge;
  final double maximumAge;

  final ValueChanged<RangeValues>? onChanged;

  @override
  Widget build(BuildContext context) {
    final String lowerAge = data?.start.toString() ?? minimumAge.toString();

    final String higherAge = data?.end.toString() ?? maximumAge.toString();

    return Row(
      children: <Widget>[
        Text(lowerAge),
        Expanded(
          child: RangeSlider(
            key: ageRangeSlider,
            values: data ??
                RangeValues(
                  minimumAge,
                  maximumAge,
                ),
            min: minimumAge,
            max: maximumAge,
            divisions: 11,
            labels: RangeLabels(lowerAge, higherAge),
            onChanged: onChanged,
          ),
        ),
        Text(higherAge)
      ],
    );
  }
}
