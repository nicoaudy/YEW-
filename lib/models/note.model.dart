import 'package:uuid/uuid.dart';
import 'package:zefyr/zefyr.dart';

class NoteModel {
  Uuid id;
  String title;
  String content;

  static const String DEFAULT_TITLE = 'New Note';
  static const String DEFAULT_CONTENT = 'Start writing\n';

  NoteModel({this.id, this.title, this.content});

  String get noteTitle =>
      this.title.isNotEmpty ? this.title : NoteModel.DEFAULT_TITLE;

  String get noteContent =>
      this.content.isNotEmpty ? this.content : NoteModel.DEFAULT_CONTENT;
}
