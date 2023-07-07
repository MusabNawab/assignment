import 'package:assignment/data/models/competitions.dart';
import 'package:assignment/logic/providers/competition_provider/competitions_provider.dart';
import 'package:assignment/presentation/homescreen/widgets/competitions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompetitonsList extends ConsumerWidget {
  const CompetitonsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(competitionProvider);

    // final competitionsList =
    //     competitions.map((e) => Competitions.fromJson(e)).toList();

    return data.when(
        data: (d) {
          List<Competitions> competitionsList = d.map((e) => e).toList();
          return SliverList.builder(
            itemCount: competitionsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: CompetitonsCard(post: competitionsList[index]),
              );
            },
          );
        },
        error: (err, s) => const SizedBox(),
        loading: () => SliverGrid.count(
              crossAxisCount: 1,
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ));
  }
}
