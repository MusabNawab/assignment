import 'package:assignment/logic/providers/user_provider.dart';
import 'package:assignment/presentation/user_profile_screen/widgets/action_btn.dart';
import 'package:assignment/presentation/user_profile_screen/widgets/bottom_navigation_bar.dart';
import 'package:assignment/presentation/user_profile_screen/widgets/container.dart';
import 'package:assignment/presentation/user_profile_screen/widgets/user_details.dart';
import 'package:assignment/presentation/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //fetching current user details
    final currentUser = ref.read(currentUserProvider);

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircularAvatar(url: currentUser.userImage, radius: 50),
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUser.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        currentUser.houseName,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              const Divider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserDetails(
                        betweenSpacing: screenSize.height * 0.01,
                        bottomSpacing: screenSize.height * 0.025,
                        title: 'Aadhar Number:',
                        subtitle: currentUser.aadharNum),
                    UserDetails(
                        betweenSpacing: screenSize.height * 0.01,
                        bottomSpacing: screenSize.height * 0.025,
                        title: 'Phone Number:',
                        subtitle: 'xx ${currentUser.phoneNum}'),
                    UserDetails(
                        betweenSpacing: screenSize.height * 0.01,
                        bottomSpacing: 0.0,
                        title: 'School Name:',
                        subtitle: currentUser.schoolName),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionsBtn(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    height: screenSize.height * 0.12,
                    width: screenSize.width * 0.25,
                    navigate: () {},
                  ),
                  SizedBox(
                    width: screenSize.width * 0.035,
                  ),
                  ActionsBtn(
                    icon: Icons.bar_chart_outlined,
                    title: 'Leaderboards',
                    height: screenSize.height * 0.12,
                    width: screenSize.width * 0.25,
                    navigate: () {
                      Navigator.of(context)
                          .pushNamed('/leaderBoardScreen', arguments: {
                        'url': currentUser.userImage,
                        'teamName': currentUser.contribution['team'],
                        'pts': int.parse(currentUser.contribution['pts']),
                      });
                    },
                  ),
                  SizedBox(
                    width: screenSize.width * 0.035,
                  ),
                  ActionsBtn(
                    icon: Icons.settings,
                    title: 'Settings',
                    height: screenSize.height * 0.12,
                    width: screenSize.width * 0.25,
                    navigate: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              UserContainer(
                height: screenSize.height * 0.27,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
