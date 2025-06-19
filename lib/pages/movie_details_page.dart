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
                  hintText: 'Escreva seu comentário...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          
        )
      })
  }
  }
}