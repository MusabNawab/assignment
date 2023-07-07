import 'package:assignment/data/models/competitions.dart';
import 'package:assignment/data/repository/dummy_competitions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiServices {
  Future<List<Competitions>> fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    return competitions.map((e) => Competitions.fromJson(e)).toList();
  }
}

final competitionApiProvider = Provider<ApiServices>((ref) => ApiServices());
