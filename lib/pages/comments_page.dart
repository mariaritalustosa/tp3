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

  void _showEditDeeleteDialog(Comment comment){
    final TextEditingController editController = TextEditingController(text: comment.commentText);
    double editRating = comment.rating;

    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Editar comentário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index){
                  return StatefulBuilder(builder: (context, setState) {
                    return IconButton(
                      icon: Icon(
                        index < editRating ? Icons.star : Icons.star_border,
                        color: Colors.amberAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          editRating = index + 1.0;
                        });
                      },
                      );   
                  },
                  );
                }),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: editController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Escreva sua crítica...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async{
                await widget.db.deleteComment(comment.id);
                Navigator.pop(context);
                _loadComments();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Comentário excluído com sucesso')),
                );
              },
               child: Text('Excluir', style: TextStyle(color: Colors.red)),
               ),
               TextButton(
                onPressed: () => Navigator.pop(context),
                 child: Text('Cancelar'),
                 ),
                 ElevatedButton(onPressed: onPressed, child: child)
          ],
        )
      }
      )
  }

}