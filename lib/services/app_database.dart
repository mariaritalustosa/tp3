import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class Comments extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  RealColumn get rating => real()();
  TextColumn get commentText => text()();
}

@DriftDatabase(tables: [Comments])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertComment(CommentsCompanion comment){
    return into(comments).insert(comment);
  }

  Future<List<Comment>> getCommentsByMovie(int movieId){
    return (select(comments)..where((c) => c.movieId.equals(movieId))).get();
  }

  Future<bool> updateComment(Comment comment){
    return update(comments).replace(comment);
  }

  Future<int> deleteComment(int id){
    return (delete(comments)..where((c) => c.id.equals(id))).go();
  }
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}