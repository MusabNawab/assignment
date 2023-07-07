import 'package:assignment/logic/providers/user_provider.dart';
import 'package:assignment/presentation/homescreen/widgets/header.dart';
import 'package:assignment/presentation/homescreen/widgets/top_post_list.dart';
import 'package:assignment/presentation/homescreen/widgets/searchbar.dart';
import 'package:assignment/presentation/homescreen/widgets/competitions_list.dart';
import 'package:assignment/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.read(currentUserProvider);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      //App bar
      appBar: CustomAppBar(
        title: 'Hello ${currentUser.name.substring(
          0,
          currentUser.name.indexOf(' '),
        )}!',
        url: currentUser.userImage,
        navigate: () {
          Navigator.of(context).pushNamed('/profileScreen');
        },
      ),

      //horizontal and vertical scroll
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // item 1
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: const Searchbar(),
                ),
                const Header(
                  title: 'Inspiration',
                  subtitle: 'View the recent top performances',
                  topSpacing: 0.065,
                  bottomSpacing: 0.04,
                ),
                //horizontal scrollable card
                SizedBox(
                    height: screenSize.height * 0.4,
                    child: const TopPostList()),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //item2
                Header(
                  title: 'Attention!',
                  subtitle: 'Pull up your socks for the upcoming competitions',
                  topSpacing: 0.055,
                  bottomSpacing: 0.02,
                ),
              ],
            ),
          ),
          //vertical scrollable list
          const CompetitonsList(),
        ],
      ),
    );
  }
}
