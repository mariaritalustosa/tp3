import 'package:flutter/material.dart';
import 'movie_list_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

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
                      builder: (context) => const MovieListPage(),
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