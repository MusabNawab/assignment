import 'package:assignment/data/models/leaderboard_model.dart';
import 'package:assignment/logic/providers/leaderboard_provider/leaderboard_provider.dart';
import 'package:assignment/presentation/constants/colors.dart';
import 'package:assignment/presentation/leaderboard_screen/widgets/bar_chart.dart';
import 'package:assignment/presentation/leaderboard_screen/widgets/leaderboard_tile.dart';
import 'package:assignment/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderBoardScreen extends ConsumerWidget {
  const LeaderBoardScreen(
      {super.key,
      required this.url,
      required this.teamName,
      required this.pts});

  final String url;
  final String teamName;
  final int pts;

  int ptsValue(List<LeaderBoardModel> list, String name) {
    final val = list.firstWhere((element) => element.name == name);
    return val.pts;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(leaderboardProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'LeaderBoard',
        url: url,
        navigate: () {},
      ),
      body: data.when(
        data: (d) {
          List<LeaderBoardModel> leaderBoardList = d.map((e) => e).toList();
          leaderBoardList.sort(
            (a, b) {
              if (a.pts < b.pts) {
                return 1;
              } else {
                return 0;
              }
            },
          );
          return Container(
            padding:
                const EdgeInsets.only(top: 25, left: 35, right: 60, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This week:',
                    style: TextStyle(fontSize: 22, color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      for (int i = 0; i < leaderBoardList.length; i++)
                        LeaderBoardTile(
                            leaderBoardObject: leaderBoardList[i], index: i),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Text(
                    'Current Team Positions:',
                    style: TextStyle(fontSize: 22, color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    height: 350,
                  ),
                  SizedBox(
                    height: 35,
                    child: LeaderBoardChart(
                        greenvalue:
                            ptsValue(leaderBoardList, 'Green House').toDouble(),
                        redvalue: ptsValue(leaderBoardList, 'Yellow House')
                            .toDouble(),
                        bluevalue:
                            ptsValue(leaderBoardList, 'Red House').toDouble(),
                        yellowvalue:
                            ptsValue(leaderBoardList, 'Blue House').toDouble()),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Your contribution to $teamName: ${pts}pts',
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Keep it up!',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return const Center(child: Text('Something Went Wrong :('));
        },
        loading: () => Center(
          child: CircularProgressIndicator(
            color: Colours.cardColor,
          ),
        ),
      ),
    );
  }
}
