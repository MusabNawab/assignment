import 'package:assignment/presentation/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.url,
      required this.navigate});
  final String title;
  final String url;
  final void Function() navigate;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData().copyWith(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            color: Colors.amber.shade600,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: () {
              navigate();
            },
            child: CircularAvatar(url: url, radius: 50),
          ),
        ),
      ],
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
