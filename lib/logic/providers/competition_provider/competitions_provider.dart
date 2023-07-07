import 'package:assignment/data/models/competitions.dart';
import 'package:assignment/logic/providers/competition_provider/competition_api_call.dart';
import 'package:riverpod/riverpod.dart';

final competitionProvider = FutureProvider<List<Competitions>>((ref) async {
  return ref.watch(competitionApiProvider).fetchData();
});
