import 'package:flutter/material.dart';
import 'package:note_taker/models/note_model.dart';

class NoteProvider with ChangeNotifier {
  final List<NoteModel> _noteList = [];
  List<NoteModel> get noteList => _noteList;

  void addNote(String title, String body) {
    _noteList.add(
      NoteModel(title: title, body: body),
    );

    notifyListeners();
  }

  NoteModel findByIndex(int index) {
    return _noteList[index];
  }

  void editNote(String title, String body, int index) {
    var note = findByIndex(index);

    note.title = title;
    note.body = body;

    notifyListeners();
  }

  void deleteNote(int index) {
    _noteList.removeAt(index);
    notifyListeners();
  }
}
