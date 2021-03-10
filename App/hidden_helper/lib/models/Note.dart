import 'package:hive/hive.dart';

part 'Note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;

  Note(this.title, this.description, this.date);
}
