import 'package:flutter/material.dart';
import 'package:tp3/services/app_database.dart';
import 'package:tp3/services/theme_provider.dart';
import 'movie_list_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  final AppDatabase db;

  const HomePage({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
                 actions: [
                  IconButton(
                    icon: Icon(
                      themeProvider.themeMode == ThemeMode.dark
                      ? Icons.brightness_7
                      : Icons.brightness_2,
                    ),
                    onPressed: () {
                      themeProvider.toogleTheme();
                    },
                    tooltip: 'Alterar tema',
                  ),
                ],
          ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                'CineSpot',
                style: GoogleFonts.merriweather(
                  fontSize: 30,
                  letterSpacing: 8,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) =>  MovieListPage(db: db),
                    ),
                  );
                }, child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    'Ver filmes populares',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
           ),
        ),
    );
  }
}