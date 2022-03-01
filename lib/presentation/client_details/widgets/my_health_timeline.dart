// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/entities/profile/doctor.dart';

class MyHealthTimeline extends StatelessWidget {
  const MyHealthTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowWidgets = <Widget>[];

    for (final String key in timelineItems.keys.toList()) {
      final DateTime date = DateFormat('dd/MM/yy').parse(key);

      final Row row = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TimelineIndicator(date: date),
            ),
          ),
          Flexible(
            flex: 8,
            child: Column(
              children: getItemCards(timelineItems[key]!),
            ),
          ),
        ],
      );

      rowWidgets.add(row);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'My Health Timeline',
          style: boldSize14Text(AppColors.greyTextColor),
        ),
        const SizedBox(height: 20),
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ...rowWidgets,
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    decoration: DottedDecoration(
                      color: Colors.black,
                      strokeWidth: 0.5,
                      linePosition: LinePosition.right,
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> getItemCards(List<TimelineItem> items) {
    final List<Widget> results = <Widget>[];

    for (final TimelineItem item in items) {
      results.add(
        InformationListCard(
          alternateLeadingIcon: Container(
            padding: const EdgeInsets.all(12),
            color: item.isDiary ? AppColors.diaryListCardColor : null,
            child: SvgPicture.asset(
              'assets/icons/${item.leadingIcon}.svg',
              color: AppColors.buttonAltColor,
            ),
          ),
          iconBackgroundColor:
              item.isDiary ? AppColors.diaryListCardColor : null,
          title: Text(
            item.title,
            style: normalSize12Text(AppColors.buttonAltColor),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...getItemContent(item),
              const SizedBox(height: 4),
              Text(
                item.time,
                style: normalSize10Text(AppColors.greyTextColor),
              ),
            ],
          ),
        ),
      );
      results.add(const SizedBox(height: 10));
    }

    return results;
  }

  List<Widget> getItemContent(TimelineItem item) {
    final List<Widget> content = <Widget>[];

    if (item.doctor != null) {
      final String? firstName = item.doctor?.firstName.getValue();
      final String? lastName = item.doctor?.lastName.getValue();
      final String venue = item.venue!;

      content.add(
        Row(
          children: <Widget>[
            Text(
              'Dr $firstName $lastName',
              style: normalSize10Text(AppColors.greyTextColor),
            ),
            const SizedBox(width: 8),
            Text(
              venue,
              style: normalSize10Text(AppColors.greyTextColor),
            ),
          ],
        ),
      );
    }

    return content;
  }
}

class TimelineIndicator extends StatelessWidget {
  const TimelineIndicator({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                date.day.toString(),
                style: boldSize22Text(AppColors.greyTextColor),
              ),
              Text(
                '${date.month}/${date.year}',
                style: normalSize10Text(AppColors.greyTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineItem {
  const TimelineItem({
    required this.leadingIcon,
    required this.title,
    required this.time,
    this.doctor,
    this.venue,
    this.file,
    this.fileType,
    bool? isDiary,
  }) : isDiary = isDiary ?? false;

  final String leadingIcon;
  final String title;
  final String time;
  final Doctor? doctor;
  final String? venue;
  final String? file;
  final String? fileType;
  final bool isDiary;
}

final Map<String, List<TimelineItem>> timelineItems =
    <String, List<TimelineItem>>{
  '10/07/21': <TimelineItem>[
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
    ),
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
      isDiary: true,
    ),
  ],
  '01/07/21': <TimelineItem>[
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
    ),
  ],
  '18/06/21': <TimelineItem>[
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
    ),
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
      isDiary: true,
    ),
  ],
};
