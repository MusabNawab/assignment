import 'package:assignment/data/models/recent_top.dart';
import 'package:assignment/logic/providers/top_post_provider/top_post_provider.dart';
import 'package:assignment/presentation/constants/colors.dart';
import 'package:assignment/presentation/homescreen/widgets/recent_top_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPostList extends ConsumerWidget {
  const TopPostList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //fetching data from server via riverpod
    final data = ref.watch(topPostProvider);

    return data.when(
      data: (d) {
        List<RecentTop> recentTopPosts = d.map((e) => e).toList();
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 1.1),
          scrollDirection: Axis.horizontal,
          itemCount: recentTopPosts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  //routing to selected post screen
                  Navigator.of(context).pushNamed('/recentTopPost',
                      arguments: {'topPost': recentTopPosts[index]});
                },
                child: RecentTopCard(post: recentTopPosts[index]),
              ),
            );
          },
        );
      },
      error: (err, s) => const SizedBox(),
      loading: () => Center(
        child: CircularProgressIndicator(
          color: Colours.cardColor,
        ),
      ),
    );
  }
}
