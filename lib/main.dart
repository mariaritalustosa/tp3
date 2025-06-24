import 'package:flutter/material.dart';
import 'package:tp3/pages/home_page.dart';
import 'package:tp3/pages/movie_list_page.dart';
import 'package:tp3/services/app_database.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final AppDatabase db = AppDatabase();

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalogo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: HomePage(db: db),
      debugShowCheckedModeBanner: false,
    );
  }
}