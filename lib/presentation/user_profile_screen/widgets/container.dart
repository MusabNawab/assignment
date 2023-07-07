import 'package:assignment/presentation/constants/colors.dart';
import 'package:assignment/presentation/user_profile_screen/widgets/container_tile.dart';
import 'package:flutter/material.dart';

class UserContainer extends StatelessWidget {
  const UserContainer({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        height: height,
        decoration: BoxDecoration(color: Colours.cardColor),
        child: const Column(
          children: [
            ContainerTile(
              title: 'Contribution',
              icon: Icons.home,
              iconbtn: Icons.keyboard_arrow_right_sharp,
            ),
            Divider(),
            ContainerTile(
              title: 'View Plans',
              icon: Icons.wallet,
              iconbtn: Icons.keyboard_arrow_right_sharp,
            ),
            Divider(),
            ContainerTile(
              title: 'Share',
              icon: Icons.share,
              iconbtn: Icons.keyboard_arrow_right_sharp,
            )
          ],
        ),
      ),
    );
  }
}
