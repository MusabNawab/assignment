import 'package:assignment/data/models/recent_top.dart';
import 'package:assignment/logic/providers/top_post_provider/top_post_api_call.dart';
import 'package:riverpod/riverpod.dart';

final topPostProvider = FutureProvider<List<RecentTop>>((ref) async {
  return ref.watch(recentTopPostsProvider).fetchData();
});
