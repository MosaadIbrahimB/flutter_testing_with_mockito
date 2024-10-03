import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled13/provider/favorites.dart';
import 'package:untitled13/screens/favorites.dart';
import 'package:untitled13/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoritesProvider>(
        create: (context) => FavoritesProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            '/': (context) => const HomePage(),
            '/favorites': (context) => const FavoritesPage(),
          },
        ));
  }
}
