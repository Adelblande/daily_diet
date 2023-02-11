import 'package:daily_diet/pages/details_meal_page.dart';
import 'package:daily_diet/pages/edit_meal_page.dart';
import 'package:daily_diet/pages/home_page.dart';
import 'package:daily_diet/pages/new_meal_page.dart';
import 'package:daily_diet/pages/statistics_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Diet',
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/details': (context) => const DetailsMealPage(),
        '/new': (context) => const NewMealPage(),
        '/edit': (context) => const EditMealPage(),
        '/statistics': (context) => const StatisticsPage(),
      },
    );
  }
}
