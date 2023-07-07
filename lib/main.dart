import 'package:assignment/presentation/constants/colors.dart';
import 'package:assignment/presentation/homescreen/homescreen.dart';
import 'package:assignment/presentation/router/page_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

void main() {
  //Locking device oreintaitions
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        //appBarTheme
        appBarTheme: const AppBarTheme().copyWith(
            color: Colours.bgColor,
            actionsIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: const TextStyle(color: Colors.white)),
        //body color
        scaffoldBackgroundColor: Colours.bgColor,
        //text theme
        textTheme: const TextTheme().copyWith(
          bodyLarge: const TextStyle(
            color: Colors.white,
          ),
          bodyMedium: const TextStyle(
            color: Colors.white,
          ),
          bodySmall: const TextStyle(
            color: Colors.white,
          ),
        ),
        //search bar theme
        searchBarTheme: const SearchBarThemeData().copyWith(
          textStyle: MaterialStatePropertyAll(
            MaterialStateTextStyle.resolveWith(
              (states) => const TextStyle(color: Colors.white),
            ),
          ),
        ),
        //icons theme
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRouter().onGenerateRoute,
      initialRoute: '/',
    );
  }
}
