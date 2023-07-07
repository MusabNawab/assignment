import 'package:assignment/presentation/constants/colors.dart';

import 'package:flutter/material.dart';

class ActionsBtn extends StatelessWidget {
  const ActionsBtn(
      {super.key,
      required this.icon,
      required this.title,
      required this.height,
      required this.width,
      required this.navigate});

  final IconData icon;
  final String title;
  final double height;
  final double width;

  final void Function() navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(title),
            duration: const Duration(seconds: 2),
          ),
        );
        navigate();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: Colours.cardColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
