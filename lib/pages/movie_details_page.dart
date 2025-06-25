import 'package:flutter/material.dart';
import 'package:tp3/models/movie_model.dart';
import 'package:tp3/services/app_database.dart';
import 'comments_page.dart';

class MovieDetailsPage extends StatefulWidget{
  final Movie movie;
  final AppDatabase db;

  const MovieDetailsPage({super.key, required this.movie, required this.db,});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage>{

  @override
  void initState(){
    super.initState();
  }


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
              onPressed: () async{
                if(rating == 0 || commentController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Dê uma nota e escreva sua opinião')),
                  );
                  return;
                }
                await widget.db.insertComment(
                  CommentsCompanion.insert(
                    movieId: widget.movie.id,
                    rating: rating,
                    commentText: commentController.text,
                  ),
                );
                Navigator.pop(context);
      
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Comentário salvo com sucesso!!')),
                );
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
      appBar: AppBar(title: Text(widget.movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://image.tmdb.org/t/p/w300${widget.movie.posterPath}',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            
            Chip(label: Text(
              'Lançado em: ${widget.movie.releaseDate}',
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
                  widget.movie.voteAverage.toStringAsFixed(1),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'Sinopse',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              widget.movie.overview,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () => _showReviewDialog(context),
                  child: const Text('Deixe sua opinião sobre o filme'),
              ),
              ),
              const SizedBox(height: 10),
              Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                 MaterialPageRoute(builder: 
                 (_) => CommentsPage(
                  movieId: widget.movie.id, 
                  db: widget.db,
                  ),
                 ),
                 );
                },
                child: Text('Ver comentários'),
                ),
              ),
          ],
        ),
        ),
    );
  }
  }
