import 'package:flutter/material.dart';
import 'package:tp3/services/app_database.dart';

class CommentsPage extends StatefulWidget{
  final int movieId;
  final AppDatabase db;

  const CommentsPage({super.key, required this.movieId, required this.db});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage>{
  late Future<List<Comment>> _commentsFuture;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments(){
    setState(() {
      _commentsFuture = widget.db.getCommentsByMovie(widget.movieId);
    });
  }

  void _showEditDeeleteDialog(Comment comment)

}