import 'package:flutter/material.dart';
import 'package:food_finder/provider/recipeDetailsProvider.dart';
import 'package:food_finder/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'provider/searchIngredientsProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => SearchByIngredientsProvider()),
        ChangeNotifierProvider(create: (context) => RecipeDetailsProvider()),
      ],
      child: MaterialApp(
        title: 'Recipe Finder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
