import 'package:flutter/material.dart';
import 'package:note_taker/widgets/note_box.dart';
import 'package:note_taker/widgets/quick_note.dart';

class AddNote extends StatelessWidget{
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Masukkan Judul",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: (){

            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: (){

            },
          ),
          IconButton(
            icon: const Icon(Icons.format_list_bulleted),
            onPressed: (){

            },
          )
        ],
      ),
    body: NoteBox(),
    );

  }

}