import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  const CircularAvatar({super.key, required this.url, required this.radius});
  final String url;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        backgroundImage: NetworkImage(url),
        radius: radius - 2,
      ),
    );
  }
}
