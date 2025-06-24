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

  
}