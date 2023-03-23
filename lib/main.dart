import 'package:flutter/material.dart';
import 'package:note_taker/constants/theme.dart';
import 'package:note_taker/screens/main_screen.dart';
import 'package:note_taker/screens/screen_add_note.dart';

//ini starter template buat aplikasi note taker

void main() {
  return runApp(const NoteTaker());
}

class NoteTaker extends StatelessWidget {
  const NoteTaker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const AddNote(), //kalau mau nampilin screen tertentu , ganti sesuai nama class screen yang dibuat
    );
  }
}
