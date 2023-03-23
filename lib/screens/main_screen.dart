import 'package:flutter/material.dart';
import 'package:note_taker/model/category.dart';
import 'package:note_taker/widgets/app_bar.dart';
import 'package:note_taker/widgets/category_list.dart';
import 'package:note_taker/widgets/quick_note.dart';

// bagian main screen gausah di utak utek duluu tunggu tak jelasin yaa

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.15),
          child: const MyAppbar(),
        ),
        body: ListView(
          children: const [
            //quick note
            QuickNote(),
            SizedBox(
              height: 15,
            ),
            //kategori
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
