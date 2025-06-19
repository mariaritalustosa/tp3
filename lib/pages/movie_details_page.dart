import 'package:flutter/material.dart';
import 'package:tp3/models/movie_model.dart';

class MovieDetailsPage extends StatelessWidget{
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});
  
  void _showReviewDialog(BuildContext context){
    double rating = 0;
    final TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Deixe aqui sua opinião'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index){
                  return StatefulBuilder(
                    builder: (context, setState){
                      return IconButton(
                        icon: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amberAccent,
                        ),
                        onPressed: (){
                          setState((){
                            rating = index + 1.0;
                          });
                        },
                      );
                    },
                    );
                }),
              ),
              TextField(
                controller: commentController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Escreva sua Crítica...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: (){
                print('Nota: $rating');
                print('Crítica: ${commentController}');
                Navigator.pop(context);
              }, 
              child: Text('Enviar'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://image.tmdb.org/t/p/w300${movie.posterPath}',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            
            Chip(label: Text(
              'Lançado em: ${movie.releaseDate}',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.deepPurple,
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),

            
          ],
        ),
        ),
    )
  }
  }
}