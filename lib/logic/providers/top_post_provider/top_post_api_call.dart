import 'package:assignment/data/models/recent_top.dart';
import 'package:assignment/data/repository/dummy_recent_top_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiServices {
  Future<List<RecentTop>> fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    return recentTopJson.map((e) => RecentTop.fromJson(e)).toList();
  }
}

final recentTopPostsProvider = Provider<ApiServices>((ref) => ApiServices());
