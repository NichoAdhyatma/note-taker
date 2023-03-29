import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note_taker/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteProvider with ChangeNotifier {
  final List<NoteModel> _noteList = [];
  List<NoteModel> get noteList => _noteList;

  void addNote(String title, String body) {
    _noteList.add(
      NoteModel(title: title, body: body),
    );

    saveData();

    notifyListeners();
  }

  Future<void> initialData() async {
    _noteList.clear();
    var pref = await SharedPreferences.getInstance();
    var noteTemp = pref.getString("note");
    var noteListTemp = jsonDecode(noteTemp!) as List<dynamic>;

    for (var element in noteListTemp) {
      _noteList.add(NoteModel.fromJson(element));
    }

    notifyListeners();

    // _noteList.addAll(noteListTemp);
  }

  Future<void> saveData() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();

    var decodedNote = jsonEncode(_noteList);
    pref.setString("note", decodedNote);
  }

  NoteModel findByIndex(int index) {
    return _noteList[index];
  }

  void editNote(String title, String body, int index) {
    var note = findByIndex(index);

    note.title = title;
    note.body = body;

    saveData();

    notifyListeners();
  }

  void deleteNote(int index) {
    _noteList.removeAt(index);
    saveData();
    notifyListeners();
  }
}
