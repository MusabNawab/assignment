import 'package:assignment/data/models/leaderboard_model.dart';
import 'package:assignment/logic/providers/leaderboard_provider/leaderboard_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leaderboardProvider = FutureProvider<List<LeaderBoardModel>>((ref) async {
  return ref.watch(leaderBoardApi).fetchData();
});
