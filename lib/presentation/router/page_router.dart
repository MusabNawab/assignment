import 'package:assignment/presentation/homescreen/homescreen.dart';
import 'package:assignment/presentation/leaderboard_screen/leaderboard_screen.dart';
import 'package:assignment/presentation/toppostscreen/top_post_screen.dart';
import 'package:assignment/presentation/user_profile_screen/userprofile.dart';
import 'package:flutter/material.dart';

class NavigationRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/recentTopPost':
        Map<String, dynamic> argument =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => TopPostScreen(topPost: argument['topPost']),
        );
      case '/profileScreen':
        return MaterialPageRoute(
          builder: (context) => const UserProfileScreen(),
        );
      case '/leaderBoardScreen':
        Map<String, dynamic> argument =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => LeaderBoardScreen(
            url: argument['url'],
            teamName: argument['teamName'],
            pts: argument['pts'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
