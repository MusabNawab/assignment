import 'package:flutter/material.dart';

class ContainerTile extends StatelessWidget {
  const ContainerTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.iconbtn});

  final String title;
  final IconData icon;
  final IconData iconbtn;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      trailing: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(title),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          icon: Icon(
            iconbtn,
            color: Colors.white,
            size: 35,
          )),
    );
  }
}
