import 'package:flutter/material.dart';
import 'package:note_taker/constants/theme.dart';
import 'package:note_taker/models/providers/note_provider.dart';
import 'package:note_taker/screens/edit_note_screen.dart';
import 'package:note_taker/screens/main_screen.dart';
import 'package:note_taker/screens/add_note_screen.dart';
import 'package:provider/provider.dart';

//ini starter template buat aplikasi note taker

void main() {
  return runApp(const NoteTaker());
}

class NoteTaker extends StatelessWidget {
  const NoteTaker({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const MainScreen(),
        routes: {
          MainScreen.routeName: (context) => const MainScreen(),
          AddNoteScreen.routeName: (context) => const AddNoteScreen(),
          EditNoteScreen.routeName: (context) => const EditNoteScreen(),
        }, //kalau mau nampilin screen tertentu , ganti sesuai nama class screen yang dibuat
      ),
    );
  }
}
