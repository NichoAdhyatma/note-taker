import 'package:flutter/material.dart';

class NoteBox extends StatefulWidget{
  const NoteBox({Key? key});

  @override
  State<NoteBox> createState() => _NoteBoxState();
}

class _NoteBoxState extends State<NoteBox>{

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              maxLines: 4,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:"Masukkan Catatan",
              ),
            ),
          )
      ),
    );
  }
}