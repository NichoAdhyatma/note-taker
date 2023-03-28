import 'package:flutter/material.dart';

class NoteBox extends StatefulWidget {
  const NoteBox({super.key, required this.body});
  final TextEditingController body;

  @override
  State<NoteBox> createState() => _NoteBoxState();
}

class _NoteBoxState extends State<NoteBox> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController body = widget.body;

    return Scaffold(
      body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child:TextField(
              autocorrect: false,
              controller: body,
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Masukkan Catatan",
              ),
            ),
          )),
    );
  }
}
