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
                  
                }
              )
            ],
          ),
        )
      })
  }
  }
}