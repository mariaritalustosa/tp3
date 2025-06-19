import 'package:flutter/material.dart';
import 'package:tp3/models/movie_model.dart';

class MovieDetailsPage extends StatelessWidget{
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});
  
  void _showReviewDialog(BuildContext context){
    double rating = 0;
    final TextEditingController commentController = TextEditingController();

    showDialog(
      context: context, builder: builder)
  }
  }
}