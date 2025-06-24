import 'package:flutter/material.dart';
import 'package:tp3/services/app_database.dart';
import 'movie_list_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget{
  final AppDatabase db;

  const HomePage({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
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
          ),),
      ),
    );
  }
}