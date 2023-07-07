import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.topSpacing,
      required this.bottomSpacing});

  final String title;
  final String subtitle;
  final double topSpacing;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: screenSize.height * topSpacing,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenSize.height * 0.009,
              ),
              Text(
                subtitle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenSize.height * bottomSpacing,
        ),
      ],
    );
  }
}
