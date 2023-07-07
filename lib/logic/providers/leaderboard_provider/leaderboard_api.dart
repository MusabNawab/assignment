import 'package:assignment/data/models/leaderboard_model.dart';
import 'package:assignment/data/repository/dummy_leaderboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderBoardApi {
  Future<List<LeaderBoardModel>> fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    return leaderboardJson.map((e) => LeaderBoardModel.fromJson(e)).toList();
  }
}

final leaderBoardApi = Provider<LeaderBoardApi>((ref) => LeaderBoardApi());
