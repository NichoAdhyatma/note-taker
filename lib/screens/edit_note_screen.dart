import 'package:flutter/material.dart';
import 'package:note_taker/models/providers/note_provider.dart';
import 'package:note_taker/widgets/bottom_text_bar.dart';
import 'package:note_taker/widgets/note_box.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key}) : super(key: key);
  static const routeName = "/edit-note";

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  void updateNote(
      NoteProvider noteProvider, String title, String body, int index) {
    var editNote = Provider.of<NoteProvider>(context, listen: false).findByIndex(index);
    if (title != editNote.title || body != editNote.body) {
      noteProvider.editNote(title, body, index);
      Navigator.of(context).pop(true);
    } else {
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as int;
    final editNote = Provider.of<NoteProvider>(context, listen: false)
        .findByIndex(arguments);
    final TextEditingController title =
        TextEditingController(text: editNote.title);
    final TextEditingController body =
        TextEditingController(text: editNote.body);

    return Scaffold(
      appBar: AppBar(
        leading: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) => IconButton(
            onPressed: () {
              updateNote(noteProvider, title.text, body.text, arguments);
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
          ),
        ),
        actions: <Widget>[
          Consumer<NoteProvider>(
            builder: (context, noteProvider, child) => IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: () {
                updateNote(noteProvider, title.text, body.text, arguments);
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
