import 'package:mocktail/mocktail.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

class MockReactions extends Mock implements ReactionsClient {}

class MockStreamAnalytics extends Mock implements StreamAnalytics {}

class MockStreamFeedClient extends Mock implements StreamFeedClient {}

class MockFeedAPI extends Mock implements FlatFeed {}

class MockFeedBloc extends Mock implements FeedBloc {}