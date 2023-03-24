import 'package:flutter/material.dart';
import 'package:note_taker/constants/theme.dart';
import 'package:note_taker/screens/add_note_screen.dart';
import 'package:note_taker/widgets/app_bar.dart';
import 'package:note_taker/widgets/category_list.dart';
import 'package:note_taker/widgets/headline_note.dart';
import 'package:note_taker/widgets/note_grid.dart';
import 'package:note_taker/widgets/quick_note.dart';

// bagian main screen gausah di utak utek duluu tunggu tak jelasin yaa

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = "/main";

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
          children: [
            //quick note
            const QuickNote(),
            const SizedBox(
              height: 15,
            ),
            //kategori
            const CategoryList(),
            const SizedBox(
              height: 15,
            ),
            //Headline note
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Recently Added",
                style: titleTextStyle,
              ),
            ),
            const HeadlineNote(),
            const SizedBox(
              height: 5,
            ),
            //your note
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Note",
                    style: titleTextStyle.copyWith(
                      color: primaryColor,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.search),
                    ],
                  )
                ],
              ),
            ),

            const NoteGrid(),
          ],
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              shape: BoxShape.circle),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: primaryColor,
            onPressed: () {
              Navigator.of(context).pushNamed(AddNoteScreen.routeName);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
