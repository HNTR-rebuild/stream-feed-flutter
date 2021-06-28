import 'package:flutter/material.dart';
import 'package:stream_feed_flutter/src/utils/typedefs.dart';
import 'package:stream_feed_flutter/src/widgets/activity/content.dart';
import 'package:stream_feed_flutter/src/widgets/activity/footer.dart';
import 'package:stream_feed_flutter/src/widgets/activity/header.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

class StreamFeedActivity extends StatelessWidget {
  const StreamFeedActivity({
    Key? key,
    required this.activity,
    this.feedGroup = 'user',
    this.onHashtagTap,
    this.onMentionTap,
    this.onUserTap,
    this.activityFooterBuilder,
    this.activityContentBuilder,
    this.onActivityTap,
  }) : super(key: key);
  final EnrichedActivity activity;
  final OnMentionTap? onMentionTap;
  final OnHashtagTap? onHashtagTap;
  final OnUserTap? onUserTap;
  final OnActivityTap? onActivityTap;
  final ActivityFooterBuilder? activityFooterBuilder;
  final ActivityContentBuilder? activityContentBuilder;
  final String feedGroup;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onActivityTap?.call(context, activity);
      },
      child: Column(
        children: [
          ActivityHeader(
            //TODO: builders
            activity: activity,
            onUserTap: onUserTap,
          ),
          activityContentBuilder?.call(context, activity) ??
              ActivityContent(
                //TODO: builders
                activity: activity,
                onHashtagTap: onHashtagTap,
                onMentionTap: onMentionTap,
              ),
          activityFooterBuilder?.call(context, activity) ??
              ActivityFooter(
                activity: activity,
                feedGroup: feedGroup,
              )
        ],
      ),
    );
  }
}
