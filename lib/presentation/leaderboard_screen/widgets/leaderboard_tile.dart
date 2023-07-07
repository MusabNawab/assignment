import 'package:assignment/data/models/leaderboard_model.dart';
import 'package:flutter/material.dart';

class LeaderBoardTile extends StatelessWidget {
  const LeaderBoardTile(
      {super.key, required this.leaderBoardObject, required this.index});

  final LeaderBoardModel leaderBoardObject;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${index + 1}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
      title: Text(
        leaderBoardObject.name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: Text(
        '${leaderBoardObject.pts}pts',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
