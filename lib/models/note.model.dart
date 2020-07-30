import 'package:uuid/uuid.dart';
import 'package:zefyr/zefyr.dart';

class NoteModel {
  Uuid id;
  String title;
  NotusDocument content;

  static const String DEFAULT_TITLE = 'New Note';
  static const String DEFAULT_CONTENT = 'Start writing\n';

  NoteModel({this.id, this.title, this.content});
}
