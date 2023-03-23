import 'package:flutter/material.dart';

class AddNote extends StatelessWidget{
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
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

    );

  }

}