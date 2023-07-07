import 'package:assignment/presentation/constants/colors.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(maxHeight: 45),
      padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
      backgroundColor:
          MaterialStateProperty.resolveWith((states) => Colours.searchBarColor),
      elevation: null,
      leading: const Icon(Icons.search),
      hintText: 'Search Competition',
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colours.cardColor)),
      ),
    );
  }
}
