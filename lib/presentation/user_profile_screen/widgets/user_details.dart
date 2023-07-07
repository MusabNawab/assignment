import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails(
      {super.key,
      required this.betweenSpacing,
      required this.bottomSpacing,
      required this.title,
      required this.subtitle});

  final double betweenSpacing;
  final double bottomSpacing;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: betweenSpacing,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: bottomSpacing,
        ),
      ],
    );
  }
}
// screenSize.height * 0.01
// screenSize.height * 0.03