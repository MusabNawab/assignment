import 'package:assignment/presentation/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.of(context).pop();
        break;
      case 1:
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Learn'),
            duration: Duration(seconds: 2),
          ),
        );

        break;
      case 2:
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Competitions'),
            duration: Duration(seconds: 2),
          ),
        );
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: 'Learn'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
            ),
            label: 'Competitions'),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: _selectedIndex == 0 ? Colors.white : Colours.cardColor,
      backgroundColor: Colors.transparent,
      iconSize: 35,
      unselectedItemColor: Colors.white,
      elevation: 0,
    );
  }
}
