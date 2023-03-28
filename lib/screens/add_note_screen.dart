import 'package:flutter/material.dart';
import 'package:note_taker/models/providers/note_provider.dart';
import 'package:note_taker/widgets/bottom_text_bar.dart';
import 'package:note_taker/widgets/note_box.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);
  static const routeName = "/add-note";

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  void simpanNote(NoteProvider noteProvider) {
    if (body.text.isNotEmpty || title.text.isNotEmpty) {
      noteProvider.addNote(title.text, body.text);
      Navigator.of(context).pop(true);
    }
    else {
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) => IconButton(
            onPressed: () {
              simpanNote(noteProvider);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        title: TextField(
          controller: title,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              hintText: "Masukkan Judul...",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          Consumer<NoteProvider>(
            builder: (context, noteProvider, child) => IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: () {
                simpanNote(noteProvider);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.format_list_bulleted),
            onPressed: () {},
          )
        ],
      ),
      body: NoteBox(
        body: body,
      ),
      bottomNavigationBar: const BottomTextBar(),
    );
  }
}
