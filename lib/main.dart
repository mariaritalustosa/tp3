import 'package:flutter/material.dart';
import 'package:tp3/pages/home_page.dart';
import 'package:tp3/services/app_database.dart';
import 'package:tp3/services/theme_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final AppDatabase db = AppDatabase();

   @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
      builder: (context, themeProvider, _){
      return MaterialApp(
      title: 'Catalogo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: themeProvider.themeMode,
      home: HomePage(db: db),
      debugShowCheckedModeBanner: false,
    );
       },
      ),
    );
  }
}