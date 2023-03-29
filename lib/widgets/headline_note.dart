import 'package:flutter/material.dart';
import 'package:note_taker/constants/theme.dart';
import 'package:note_taker/providers/note_provider.dart';
import 'package:note_taker/screens/edit_note_screen.dart';
import 'package:provider/provider.dart';

class HeadlineNote extends StatelessWidget {
  const HeadlineNote({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final noteList = Provider.of<NoteProvider>(context).noteList;
    return noteList.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Belum ada notes yang kamu buka...",
                    style: labelTextStyle.copyWith(color: primaryColor),
                  ),
                  const Text(
                    "🗿🗿",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: InkWell(
              onTap: () async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                var result = await Navigator.pushNamed(
                    context, EditNoteScreen.routeName,
                    arguments: noteList.length - 1) as bool;
                if (result) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: secondayColor,
                      behavior: SnackBarBehavior.fixed,
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/app-logo.png',
                            height: 20,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text("Note diubah"),
                        ],
                      ),
                    ),
                  );
                }
              },
              child: Container(
                height: size.height * 0.25,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: primaryColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: primaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noteList[noteList.length - 1].title,
                              style: titleTextStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              noteList[noteList.length - 1].body,
                              style: labelTextStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
