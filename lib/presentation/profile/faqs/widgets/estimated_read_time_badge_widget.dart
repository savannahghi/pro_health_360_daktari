// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/theme/app_themes.dart';
// Project imports:

class EstimatedReadTimeBadge extends StatelessWidget {
  const EstimatedReadTimeBadge({
    Key? key,
    required this.contentType,
    required this.estimateReadTime,
    this.videoDuration,
    this.isAudio = false,
  }) : super(key: key);

  final ContentType contentType;
  final int estimateReadTime;
  final bool isAudio;
  final int? videoDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: AppColors.readTimeBackgroundColor,
      ),
      child: Text(
        contentType == ContentType.AUDIO_VIDEO && isAudio
            ? audioTime(estimateReadTime)
            : contentType == ContentType.AUDIO_VIDEO
                ? contentAudioVideoDuration(
                    videoDuration ?? 0,
                  )
                : contentReadDuration(estimateReadTime),
        style: mediumSize14Text(Colors.white).copyWith(fontSize: 12),
      ),
    );
  }
}
