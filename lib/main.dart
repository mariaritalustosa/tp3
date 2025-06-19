import 'package:flutter/material.dart';
import 'package:tp3/pages/movie_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalogo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MovieListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}